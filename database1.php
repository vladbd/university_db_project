<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

    <title>Database Info</title>
  </head>
  <body>
    <div class="container mt-5">
      <h1 class="mb-5">Database Info</h1>
      <form action="" method="post">
        <div class="form-group">
          <label for="querySelect">Select Query:</label>
          <select class="form-control" id="querySelect" name="query">
            <option value="">-- Select Query --</option>
            <option value="1">Find the names and email addresses of all members who have enrolled in a class taught by a trainer with expertise in "Yoga"</option>
            <option value="2">Find the names and membership tiers of members who have attended a class in the past week, along with the class name and instructor</option>
            <option value="3">Find the names and membership tiers of members who have made a payment in the past 3 months, and have a review rating of 4 or higher, along with the payment amount and date</option>
            <option value="4">Find the names and phone numbers of members who have an appointment with a trainer who specialized in strength training in the next week, along with the start and end times of the appointment and the name of the trainer</option>
            <option value="5">Find the names and membership tiers of members who have not attended a class in the past month, along with the name of the class and the date of their last attendance</option>
            <option value="6">Find the names, email addresses, and goals of members who have a nutrition plan and have made a payment in the past month, along with the name of their nutrition plan and recommendations</option>
            <option value="7">Find the names, email addresses, and membership tiers of members who have not made a payment in the past 3 months, along with the amount owed and the date of their last payment</option>
            <option value="8">Find the names and phone numbers of members who have an appointment with a trainer who specializes in cardio in the next week, along with the start and end times of the appointment and the name of the trainer</option>
            <option value="9">Find the names and membership tiers of members who have attended a class in the past month, along with the name of the class and the date of their attendance</option>
            <option value="10">Find the names, email addresses, and goals and membership tiers of members who have not made a payment in the past 3 months, along with the amount owed and the date of their last payment</option>
            </select>
</div>
<button type="submit" class="btn btn-primary">Submit</button>
<a href="database.php" class="btn btn-secondary">Return to main</a>
</form>
<?php
// Check if the form has been submitted
if (isset($_POST['query'])) {
$query = $_POST['query'];
// Connect to the database
$conn = mysqli_connect('localhost', 'root', '', 'gymgymgym');
$queries = array(
    "SELECT Members.name, Contact_Info.email FROM Members
    JOIN Enrollment ON Members.member_id = Enrollment.member_id
    JOIN Classes ON Enrollment.class_id = Classes.class_id
    JOIN Trainers ON Classes.instructor_id = Trainers.trainer_id
    JOIN Contact_Info ON Members.member_id = Contact_Info.member_id
    WHERE Trainers.expertise = 'Yoga';",
    "SELECT Members.name, Membership_Tier.name, Classes.name, Trainers.name FROM Members
    JOIN Attendance ON Members.member_id = Attendance.member_id
    JOIN Classes ON Attendance.class_id = Classes.class_id
    JOIN Trainers ON Classes.instructor_id = Trainers.trainer_id
    JOIN Membership_Tier ON Members.membership_tier_id = Membership_Tier.membership_tier_id
    WHERE Attendance.date BETWEEN DATE_SUB(CURRENT_DATE, INTERVAL 1 WEEK) AND CURRENT_DATE
          AND Members.name IS NOT NULL AND Membership_Tier.name IS NOT NULL AND Classes.name IS NOT NULL AND Trainers.name IS NOT NULL;",
    "SELECT Members.name, Membership_Tier.name, Payment.amount, Payment.date FROM Members
    JOIN Payment ON Members.member_id = Payment.member_id
    JOIN Membership_Tier ON Members.membership_tier_id = Membership_Tier.membership_tier_id
    JOIN Review ON Members.member_id = Review.member_id
    WHERE Payment.date BETWEEN DATE_SUB(CURRENT_DATE, INTERVAL 3 MONTH) AND CURRENT_DATE
          AND Review.rating >= 4 AND Payment.amount IS NOT NULL AND Payment.date IS NOT NULL;",
    "SELECT Members.name, Contact_Info.phone, Appointment.start_time, Appointment.end_time, Trainers.name FROM Members
    JOIN Appointment ON Members.member_id = Appointment.member_id
    JOIN Trainers ON Appointment.trainer_id = Trainers.trainer_id
    JOIN Contact_Info ON Members.member_id = Contact_Info.member_id
    WHERE Appointment.start_time BETWEEN CURRENT_DATE AND DATE_ADD(CURRENT_DATE, INTERVAL 7 DAY)
          AND Trainers.expertise = 'strength training' AND Members.name IS NOT NULL AND Contact_Info.phone IS NOT NULL AND Appointment.start_time IS NOT NULL AND Appointment.end_time IS NOT NULL AND Trainers.name IS NOT NULL;
    ",
    "SELECT Members.name, Membership_Tier.name, Classes.name, Attendance.date FROM Members
    JOIN Membership_Tier ON Members.membership_tier_id = Membership_Tier.membership_tier_id
    LEFT JOIN Attendance ON Members.member_id = Attendance.member_id
    LEFT JOIN Classes ON Attendance.class_id = Classes.class_id
    WHERE Attendance.date < DATE_SUB(CURRENT_DATE, INTERVAL 1 MONTH) OR Attendance.date IS NULL
          AND Members.name IS NOT NULL AND Membership_Tier.name IS NOT NULL AND Classes.name IS NOT NULL;
    ",
    "SELECT Members.name, Contact_Info.email, Goals.goals, Nutrition.plan, Nutrition.recommendations FROM Members
    JOIN Payment ON Members.member_id = Payment.member_id
    JOIN Contact_Info ON Members.member_id = Contact_Info.member_id
    JOIN Goals ON Members.member_id = Goals.member_id
    JOIN Nutrition ON Members.member_id = Nutrition.member_id
    WHERE Payment.date BETWEEN CURRENT_DATE AND DATE_ADD(CURRENT_DATE, INTERVAL 1 MONTH)
          AND Members.name IS NOT NULL AND Contact_Info.email IS NOT NULL AND Goals.goals IS NOT NULL AND Nutrition.plan IS NOT NULL AND Nutrition.recommendations IS NOT NULL;
    
    ",
    "SELECT Trainers.name, Trainers.expertise, Personal_Training.start_time, Personal_Training.end_time FROM Trainers
    JOIN Personal_Training ON Trainers.trainer_id = Personal_Training.trainer_id
    JOIN Members ON Personal_Training.client_id = Members.member_id
    JOIN Membership_Tier ON Members.membership_tier_id = Membership_Tier.membership_tier_id
    WHERE Personal_Training.start_time BETWEEN CURRENT_DATE AND DATE_ADD(CURRENT_DATE, INTERVAL 1 MONTH)
          AND Membership_Tier.name = 'gold' AND Trainers.name IS NOT NULL AND Trainers.expertise IS NOT NULL AND Personal_Training.start_time IS NOT NULL AND Personal_Training.end_time IS NOT NULL;
    
    ",
    "SELECT Members.name, Contact_Info.email, Workout_Plan.plan, Workout_Plan.recommendations FROM Members
    JOIN Workout_Plan ON Members.member_id = Workout_Plan.member_id
    JOIN Contact_Info ON Members.member_id = Contact_Info.member_id
    LEFT JOIN Attendance ON Members.member_id = Attendance.member_id
    WHERE Attendance.date < DATE_SUB(CURRENT_DATE, INTERVAL 1 MONTH) OR Attendance.date IS NULL
          AND Members.name IS NOT NULL AND Contact_Info.email IS NOT NULL AND Workout_Plan.plan IS NOT NULL AND Workout_Plan.recommendations IS NOT NULL;
    ",
    "SELECT Members.name, Membership_Tier.name, Contact_Info.email, Payment.amount, Payment.date, Nutrition.plan FROM Members
    JOIN Nutrition ON Members.member_id = Nutrition.member_id
    JOIN Payment ON Members.member_id = Payment.member_id
    JOIN Membership_Tier ON Members.membership_tier_id = Membership_Tier.membership_tier_id
    JOIN Contact_Info ON Members.member_id = Contact_Info.member_id
    WHERE Payment.date BETWEEN DATE_SUB(CURRENT_DATE, INTERVAL 1 MONTH) AND CURRENT_DATE
    AND Payment.amount IS NOT NULL AND Payment.date IS NOT NULL AND Nutrition.plan IS NOT NULL;
    ",
    "SELECT Members.name, Contact_Info.phone, Contact_Info.email, Trainers.name, Personal_Training.start_time FROM Members
    JOIN Personal_Training ON Members.member_id = Personal_Training.client_id
    JOIN Trainers ON Personal_Training.trainer_id = Trainers.trainer_id
    JOIN Contact_Info ON Members.member_id = Contact_Info.member_id
    WHERE Trainers.expertise = 'Strength Training' AND Personal_Training.start_time IS NOT NULL
    AND Members.name IS NOT NULL AND Contact_Info.phone IS NOT NULL AND Contact_Info.email IS NOT NULL AND Trainers.name IS NOT NULL;");
     $result = mysqli_query($conn, $queries[$query]);
     if (mysqli_num_rows($result) > 0) {
       // Output the data
       echo '<h2 class="mt-5">Query Results</h2>';
       echo '<table class="table table-bordered">';
       echo '<thead>';
       echo '<tr>';
       while ($field = mysqli_fetch_field($result)) {
         echo '<th>' . $field->name . '</th>';
       }
       echo '</tr>';
       echo '</thead>';
       echo '<tbody>';
       while ($row = mysqli_fetch_assoc($result)) {
         echo '<tr>';
         foreach ($row as $value) {
           echo '<td>' . $value . '</td>';
         }
         echo '</tr>';
       }
       echo '</tbody>';
       echo '</table>';
     } else {
       echo '<p>No results found.</p>';
     }
     mysqli_close($conn);
   }
   ?>
 </div>
</body>
</html>
