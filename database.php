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
          <label for="tableSelect">Select Table:</label>
          <select class="form-control" id="tableSelect" name="table">
            <option value="">-- Select Table --</option>
            <?php
            // Connect to the database
            $conn = mysqli_connect('localhost', 'root', '', 'gymgymgym');

           // Check connection
            if (!$conn) {
              die("Connection failed: " . mysqli_connect_error());
            }
            // Get all table names from the database
            $sql = "SHOW TABLES FROM gymgymgym";
            $result = mysqli_query($conn, $sql);
            // Generate the options for the select element
            while ($row = mysqli_fetch_row($result)) {
              echo '<option value="' . $row[0] . '">' . $row[0] . '</option>';
            }
            ?>
          </select>
        </div>
        <div class="form-group">
  <label for="infoSelect">Select Information:</label>
  <select class="form-control" id="infoSelect" name="info">
    <option value="structure" <?php if (isset($_POST['info']) && $_POST['info'] == 'structure') echo 'selected'; ?>>Structure</option>
    <option value="data" <?php if (isset($_POST['info']) && $_POST['info'] == 'data') echo 'selected'; ?>>Data</option>
  </select>
</div>

        <button type="submit" class="btn btn-primary">Submit</button>
		<a href="database1.php" class="btn btn-secondary">Run Query on Another Page</a>
      </form>
      <?php
      // Check if the form has been submitted
      if (isset($_POST['table']) && isset($_POST['info'])) {
        $table = $_POST['table'];
        $info = $_POST['info'];
        // Display the structure of the selected table
        if ($info == "structure") {
			$sql = "DESCRIBE $table";
          $result = mysqli_query($conn, $sql);
		  echo '<h2 class="mt-5">' . $table . ' Table Structure</h2>';
		  echo '<table class="table table-bordered">';
		  echo '<thead>';
		  echo '<tr>';
		  echo '<th>Field</th>';
		  echo '<th>Type</th>';
		  echo '<th>Null</th>';
		  echo '<th>Key</th>';
		  echo '<th>Extra</th>';
		  echo '</tr>';
		  echo '</thead>';
		  echo '<tbody>';
		  while ($row = mysqli_fetch_assoc($result)) {
			echo '<tr>';
			echo '<td>' . $row['Field'] . '</td>';
			echo '<td>' . $row['Type'] . '</td>';
			echo '<td>' . $row['Null'] . '</td>';
			echo '<td>' . $row['Key'] . '</td>';
			echo '<td>' . $row['Extra'] . '</td>';
			echo '</tr>';
		  }
		  echo '</tbody>';
		  echo '</table>';
		  }
		  // Display the data in the selected table
		  else if ($info == "data") {
		  $sql = "SELECT * FROM $table";
		  $result = mysqli_query($conn, $sql);
		  echo '<h2 class="mt-5">' . $table . ' Table Data</h2>';
		  echo '<table class="table table-bordered">';
		  echo '<thead>';
		  echo '<tr>';
		  // Generate the table headers
		  $firstRow = mysqli_fetch_assoc($result);
		  foreach ($firstRow as $key => $value) {
			echo '<th>' . $key . '</th>';
		  }
		  echo '</tr>';
		  echo '</thead>';
		  echo '<tbody>';
		  // Output the data for each row
		  do {
			echo '<tr>';
			foreach ($firstRow as $value) {
			  echo '<td>' . $value . '</td>';
			}
			echo '</tr>';
		  } while ($firstRow = mysqli_fetch_assoc($result));
		  echo '</tbody>';
		  echo '</table>';
		  }
		  }
		  ?>
		  </div>
		  
