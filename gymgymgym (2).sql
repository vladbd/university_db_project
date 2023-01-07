-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2023 at 04:54 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gymgymgym`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appointment_id` int(11) NOT NULL,
  `trainer_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appointment_id`, `trainer_id`, `member_id`, `date`, `start_time`, `end_time`) VALUES
(1, 1, 1, '2022-01-01', '10:00:00', '11:00:00'),
(2, 2, 2, '2022-01-01', '11:00:00', '12:00:00'),
(3, 3, 3, '2022-01-01', '09:00:00', '10:00:00'),
(4, 4, 4, '2022-01-01', '11:00:00', '12:00:00'),
(5, 5, 5, '2022-01-01', '11:00:00', '12:00:00'),
(6, 6, 6, '2022-01-01', '09:00:00', '10:00:00'),
(7, 7, 7, '2022-01-01', '10:00:00', '11:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `attendance_id` int(11) NOT NULL,
  `member_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`attendance_id`, `member_id`, `class_id`, `date`) VALUES
(1, 1, 1, '2023-01-01'),
(2, 2, 2, '2023-01-01'),
(3, 3, 3, '2023-01-01'),
(4, 4, 4, '2022-12-31'),
(5, 5, 5, '2022-12-31'),
(6, 6, 6, '2022-12-31'),
(7, 7, 7, '2022-01-07');

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `class_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `instructor_id` int(11) DEFAULT NULL,
  `schedule` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`class_id`, `name`, `instructor_id`, `schedule`) VALUES
(1, 'Strength training', 1, 'Monday, Wednesday, Friday 9:00 AM'),
(2, 'Cardio training', 2, 'Tuesday, Thursday, Saturday 10:00 AM'),
(3, 'Yoga', 3, 'Monday, Wednesday, Friday 11:00 AM'),
(4, 'Pilates', 4, 'Tuesday, Thursday, Saturday 12:00 PM'),
(5, 'Kickboxing', 5, 'Monday, Wednesday, Friday 1:00 PM'),
(6, 'Zumba', 6, 'Tuesday, Thursday, Saturday 2:00 PM'),
(7, 'Tai Chi', 7, 'Monday, Wednesday, Friday 3:00 PM');

-- --------------------------------------------------------

--
-- Table structure for table `contact_info`
--

CREATE TABLE `contact_info` (
  `member_id` int(11) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_info`
--

INSERT INTO `contact_info` (`member_id`, `phone`, `email`) VALUES
(1, '555-555-1212', 'johnsmith@gmail.com'),
(2, '555-555-1213', 'janedoe@gmail.com'),
(3, '555-555-1214', 'bobjohnson@gmail.com'),
(4, '555-555-1215', 'alicewilliams@gmail.com'),
(5, '555-555-1216', 'mikethompson@gmail.com'),
(6, '555-555-1217', 'sarahanderson@gmail.com'),
(7, '555-555-1218', 'tomjackson@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `enrollment`
--

CREATE TABLE `enrollment` (
  `enrollment_id` int(11) NOT NULL,
  `member_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrollment`
--

INSERT INTO `enrollment` (`enrollment_id`, `member_id`, `class_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7);

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE `equipment` (
  `equipment_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `maintenance_schedule` varchar(255) NOT NULL,
  `membership_tier_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `equipment`
--

INSERT INTO `equipment` (`equipment_id`, `type`, `location`, `maintenance_schedule`, `membership_tier_id`) VALUES
(1, 'Treadmill', 'Cardio room', 'First Monday of the month', NULL),
(2, 'Elliptical', 'Cardio room', 'First Tuesday of the month', NULL),
(3, 'Exercise bike', 'Cardio room', 'First Wednesday of the month', NULL),
(4, 'Weight machine', 'Weight room', 'First Thursday of the month', NULL),
(5, 'Free weights', 'Weight room', 'First Friday of the month', NULL),
(6, 'Yoga mats', 'Yoga room', 'First Saturday of the month', NULL),
(7, 'Pilates reformer', 'Pilates room', 'First Sunday of the month', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exercise`
--

CREATE TABLE `exercise` (
  `exercise_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `muscle_group` varchar(255) NOT NULL,
  `equipment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exercise`
--

INSERT INTO `exercise` (`exercise_id`, `name`, `muscle_group`, `equipment`) VALUES
(1, 'Barbell Bench Press', 'Chest', 'Barbell'),
(2, 'Dumbbell Flyes', 'Chest', 'Dumbbells'),
(3, 'Push-Ups', 'Chest', 'Body Weight'),
(4, 'Lat Pulldowns', 'Back', 'Lat Pulldown Machine'),
(5, 'Seated Cable Row', 'Back', 'Cable Machine'),
(6, 'Deadlifts', 'Back', 'Barbell'),
(7, 'Barbell Squats', 'Legs', 'Barbell');

-- --------------------------------------------------------

--
-- Table structure for table `exercise_instance`
--

CREATE TABLE `exercise_instance` (
  `instance_id` int(11) NOT NULL,
  `exercise_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `reps` int(11) NOT NULL,
  `sets` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exercise_instance`
--

INSERT INTO `exercise_instance` (`instance_id`, `exercise_id`, `member_id`, `reps`, `sets`, `weight`, `date`) VALUES
(1, 1, 1, 8, 3, 185, '2023-01-01'),
(2, 2, 2, 10, 3, 40, '2023-01-01'),
(3, 3, 3, 15, 3, 0, '2023-01-01'),
(4, 4, 4, 12, 3, 70, '2022-12-31'),
(5, 5, 5, 10, 3, 95, '2022-12-31'),
(6, 6, 6, 12, 3, 120, '2022-12-31'),
(7, 7, 7, 8, 3, 225, '2022-01-07');

-- --------------------------------------------------------

--
-- Table structure for table `exercise_plan`
--

CREATE TABLE `exercise_plan` (
  `plan_id` int(11) NOT NULL,
  `member_id` int(11) DEFAULT NULL,
  `plan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exercise_plan`
--

INSERT INTO `exercise_plan` (`plan_id`, `member_id`, `plan`) VALUES
(1, 1, 'Monday: Chest and Triceps\r\nTuesday: Legs\r\nWednesday: Rest\r\nThursday: Back and Biceps\r\nFriday: Shoulders\r\nSaturday: Cardio\r\nSunday: Rest'),
(2, 2, 'Monday: Chest and Triceps\r\nTuesday: Cardio\r\nWednesday: Rest\r\nThursday: Back and Biceps\r\nFriday: Shoulders\r\nSaturday: Legs\r\nSunday: Rest'),
(3, 3, 'Monday: Chest and Biceps\r\nTuesday: Cardio\r\nWednesday: Rest\r\nThursday: Back and Triceps\r\nFriday: Shoulders\r\nSaturday: Legs\r\nSunday: Rest'),
(4, 4, 'Monday: Chest and Triceps\r\nTuesday: Cardio\r\nWednesday: Rest\r\nThursday: Back and Biceps\r\nFriday: Shoulders\r\nSaturday: Legs\r\nSunday: Rest'),
(5, 5, 'Monday: Chest and Triceps\r\nTuesday: Cardio\r\nWednesday: Rest\r\nThursday: Back and Biceps\r\nFriday: Shoulders\r\nSaturday: Legs\r\nSunday: Rest'),
(6, 6, 'Monday: Chest and Triceps\r\nTuesday: Cardio\r\nWednesday: Rest\r\nThursday: Back and Biceps\r\nFriday: Shoulders\r\nSaturday: Legs\r\nSunday: Rest'),
(7, 7, 'Monday: Chest and Triceps\r\nTuesday: Cardio\r\nWednesday: Rest\r\nThursday: Back and Biceps\r\nFriday: Shoulders\r\nSaturday: Legs\r\nSunday: Rest');

-- --------------------------------------------------------

--
-- Table structure for table `goals`
--

CREATE TABLE `goals` (
  `member_id` int(11) NOT NULL,
  `goals` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `goals`
--

INSERT INTO `goals` (`member_id`, `goals`) VALUES
(1, 'Lose 20 pounds, improve strength and endurance'),
(2, 'Gain 5 pounds of muscle, improve flexibility'),
(3, 'Improve cardiovascular health, lower blood pressure'),
(4, 'Lose 10 pounds, increase energy levels'),
(5, 'Gain 10 pounds of muscle, improve athletic performance'),
(6, 'Improve overall health and well-being'),
(7, 'Lose 15 pounds, improve body composition');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `item_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `reorder_level` int(11) NOT NULL,
  `promotion_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`item_id`, `name`, `quantity`, `reorder_level`, `promotion_id`) VALUES
(1, 'Protein bars', 50, 20, NULL),
(2, 'Water bottles', 100, 50, NULL),
(3, 'Towels', 200, 100, NULL),
(4, 'Resistance bands', 50, 20, NULL),
(5, 'Dumbbells', 100, 50, NULL),
(6, 'Yoga mats', 50, 20, NULL),
(7, 'Jump ropes', 100, 50, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `measurement`
--

CREATE TABLE `measurement` (
  `measurement_id` int(11) NOT NULL,
  `member_id` int(11) DEFAULT NULL,
  `weight` decimal(10,2) NOT NULL,
  `body_fat_percentage` decimal(10,2) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `measurement`
--

INSERT INTO `measurement` (`measurement_id`, `member_id`, `weight`, `body_fat_percentage`, `date`) VALUES
(1, 1, '180.50', '15.20', '2023-01-01'),
(2, 2, '150.00', '22.50', '2023-01-01'),
(3, 3, '200.00', '10.50', '2023-01-01'),
(4, 4, '162.50', '20.00', '2022-12-31'),
(5, 5, '170.00', '17.30', '2022-12-31'),
(6, 6, '180.00', '14.00', '2022-12-31'),
(7, 7, '195.00', '12.80', '2022-01-07');

-- --------------------------------------------------------

--
-- Table structure for table `medical_info`
--

CREATE TABLE `medical_info` (
  `member_id` int(11) NOT NULL,
  `medical_conditions` varchar(255) NOT NULL,
  `allergies` varchar(255) NOT NULL,
  `medications` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medical_info`
--

INSERT INTO `medical_info` (`member_id`, `medical_conditions`, `allergies`, `medications`) VALUES
(1, 'None', 'None', 'None'),
(2, 'High blood pressure', 'None', 'Lisinopril'),
(3, 'Diabetes', 'None', 'Metformin'),
(4, 'None', 'Peanuts', 'None'),
(5, 'None', 'None', 'None'),
(6, 'None', 'None', 'None'),
(7, 'None', 'None', 'None');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `member_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `membership_start_date` date NOT NULL,
  `membership_end_date` date NOT NULL,
  `membership_tier_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`member_id`, `name`, `membership_start_date`, `membership_end_date`, `membership_tier_id`) VALUES
(1, 'John Smith', '2022-01-01', '2022-12-31', 1),
(2, 'Jane Doe', '2022-01-01', '2022-12-31', 2),
(3, 'Bob Johnson', '2022-01-01', '2022-06-30', 3),
(4, 'Alice Williams', '2022-07-01', '2022-12-31', 1),
(5, 'Mike Thompson', '2022-01-01', '2022-12-31', 2),
(6, 'Sarah Anderson', '2022-01-01', '2022-06-30', 3),
(7, 'Tom Jackson', '2022-07-01', '2022-12-31', 1);

-- --------------------------------------------------------

--
-- Table structure for table `membership_tier`
--

CREATE TABLE `membership_tier` (
  `membership_tier_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `perks` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `membership_tier`
--

INSERT INTO `membership_tier` (`membership_tier_id`, `name`, `perks`) VALUES
(1, 'Bronze', '10% discount on personal training sessions, access to group fitness classes'),
(2, 'Silver', '20% discount on personal training sessions, access to group fitness classes, use of sauna and steam room'),
(3, 'Gold', '30% discount on personal training sessions, access to group fitness classes, use of sauna and steam room, priority booking for fitness assessments');

-- --------------------------------------------------------

--
-- Table structure for table `nutrition`
--

CREATE TABLE `nutrition` (
  `nutrition_id` int(11) NOT NULL,
  `member_id` int(11) DEFAULT NULL,
  `plan` varchar(255) NOT NULL,
  `recommendations` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nutrition`
--

INSERT INTO `nutrition` (`nutrition_id`, `member_id`, `plan`, `recommendations`) VALUES
(1, 1, 'Low carb', 'Limit intake of grains, pasta, and sugary foods, increase intake of vegetables and protein'),
(2, 2, 'Low fat', 'Limit intake of fried and high fat foods, increase intake of fruits and vegetables'),
(3, 3, 'Vegetarian', 'Eliminate meat from diet, increase intake of plant-based protein sources like beans and tofu'),
(4, 4, 'Paleo', 'Eliminate grains, legumes, and processed foods, increase intake of meats, vegetables, and healthy fats'),
(5, 5, 'Gluten-free', 'Eliminate grains that contain gluten, including wheat, barley, and rye'),
(6, 6, 'Dairy-free', 'Eliminate dairy products from diet, including milk, cheese, and yogurt'),
(7, 7, 'Ketogenic', 'Very low dadad');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `member_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `date` date NOT NULL,
  `method` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `member_id`, `amount`, `date`, `method`) VALUES
(1, 1, '100.00', '2022-12-27', 'Credit card'),
(2, 2, '200.00', '2022-12-28', 'Check'),
(3, 3, '300.00', '2023-01-01', 'Bank transfer'),
(4, 4, '400.00', '2023-01-02', 'Credit card'),
(5, 5, '500.00', '2023-01-03', 'Check'),
(6, 6, '600.00', '2023-01-04', 'Bank transfer'),
(7, 7, '700.00', '2023-01-05', 'Credit card');

-- --------------------------------------------------------

--
-- Table structure for table `personal_training`
--

CREATE TABLE `personal_training` (
  `session_id` int(11) NOT NULL,
  `trainer_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `personal_training`
--

INSERT INTO `personal_training` (`session_id`, `trainer_id`, `client_id`, `start_time`, `end_time`, `location`) VALUES
(1, 3, 1, '10:00:00', '11:00:00', 'Studio 1'),
(2, 4, 2, '08:00:00', '09:00:00', 'Studio 2'),
(3, 5, 3, '09:00:00', '10:00:00', 'Studio 3'),
(4, 6, 4, '10:00:00', '11:00:00', 'Studio 4'),
(5, 7, 5, '09:00:00', '10:00:00', 'Studio 5'),
(6, 1, 6, '11:00:00', '12:00:00', 'Studio 6'),
(7, 2, 7, '08:00:00', '09:00:00', 'Studio 7');

-- --------------------------------------------------------

--
-- Table structure for table `promotion`
--

CREATE TABLE `promotion` (
  `promotion_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `promotion`
--

INSERT INTO `promotion` (`promotion_id`, `name`, `discount`, `start_date`, `end_date`) VALUES
(1, 'New member special', '0.10', '2022-01-01', '2022-01-31'),
(2, 'Summer sale', '0.20', '2022-06-01', '2022-06-30'),
(3, 'Referral program', '0.15', '2022-01-01', '2022-12-31'),
(4, 'Holiday promotion', '0.25', '2022-12-01', '2022-12-31'),
(5, 'Anniversary sale', '0.30', '2022-01-01', '2022-01-31'),
(6, 'Spring sale', '0.20', '2022-03-01', '2022-03-31'),
(7, 'Black Friday sale', '0.50', '2022-11-01', '2022-11-30');

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `purchase_id` int(11) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `cost` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`purchase_id`, `supplier_id`, `date`, `cost`) VALUES
(1, 1, '2023-01-01', '1000.00'),
(2, 2, '2023-01-01', '2000.00'),
(3, 3, '2023-01-01', '3000.00'),
(4, 4, '2022-12-31', '4000.00'),
(5, 5, '2022-12-31', '5000.00'),
(6, 6, '2022-12-31', '6000.00'),
(7, 7, '2022-01-07', '7000.00');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `review_id` int(11) NOT NULL,
  `member_id` int(11) DEFAULT NULL,
  `rating` int(11) NOT NULL,
  `review` varchar(255) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`review_id`, `member_id`, `rating`, `review`, `date`) VALUES
(1, 1, 5, 'Great gym, highly recommend!', '2023-01-01'),
(2, 2, 4, 'Good gym, would recommend.', '2023-01-01'),
(3, 3, 3, 'Average gym, not terrible but not great.', '2023-01-01'),
(4, 4, 2, 'Below average gym, would not recommend.', '2022-12-31'),
(5, 5, 1, 'Terrible gym, do not recommend.', '2022-12-31'),
(6, 6, 5, 'Outstanding gym, best I have ever been to!', '2022-12-31'),
(7, 7, 4, 'Very good gym, would definitely recommend.', '2022-01-07');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `schedule` varchar(255) NOT NULL,
  `member_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `name`, `position`, `schedule`, `member_id`) VALUES
(1, 'John Smith', 'Manager', 'Monday-Friday 9:00 AM-5:00 PM', NULL),
(2, 'Jane Doe', 'Receptionist', 'Monday-Friday 9:00 AM-5:00 PM', NULL),
(3, 'Bob Johnson', 'Trainer', 'Monday, Wednesday, Friday 9:00 AM-1:00 PM', NULL),
(4, 'Alice Williams', 'Trainer', 'Tuesday, Thursday, Saturday 9:00 AM-1:00 PM', NULL),
(5, 'Mike Thompson', 'Trainer', 'Monday, Wednesday, Friday 1:00 PM-5:00 PM', NULL),
(6, 'Sarah Anderson', 'Trainer', 'Tuesday, Thursday, Saturday 1:00 PM-5:00 PM', NULL),
(7, 'Tom Jackson', 'Trainer', 'Monday-Friday 5:00 PM-9:00 PM', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplier_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplier_id`, `name`, `phone`, `email`) VALUES
(1, 'Acme Co', '555-555-5555', 'acme@example.com'),
(2, 'XYZ Inc', '444-444-4444', 'xyz@example.com'),
(3, 'Example Co', '333-333-3333', 'example@example.com'),
(4, 'Foo Bar', '222-222-2222', 'foo@example.com'),
(5, 'Bar Foo', '111-111-1111', 'bar@example.com'),
(6, 'Dan Tro', '542-222-2222', 'tro@example.com'),
(7, 'Fo Dro', '242-222-2222', 'dfo@example.com');

-- --------------------------------------------------------

--
-- Table structure for table `trainers`
--

CREATE TABLE `trainers` (
  `trainer_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `expertise` varchar(255) NOT NULL,
  `schedule` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trainers`
--

INSERT INTO `trainers` (`trainer_id`, `name`, `expertise`, `schedule`) VALUES
(1, 'Mike Smith', 'Strength training', 'Monday, Wednesday, Friday'),
(2, 'Sara Johnson', 'Cardio training', 'Tuesday, Thursday, Saturday'),
(3, 'Tom Williams', 'Yoga', 'Monday, Wednesday, Friday'),
(4, 'Jane Doe', 'Pilates', 'Tuesday, Thursday, Saturday'),
(5, 'John Thompson', 'Kickboxing', 'Monday, Wednesday, Friday'),
(6, 'Alice Anderson', 'Zumba', 'Tuesday, Thursday, Saturday'),
(7, 'Bob Jackson', 'Tai Chi', 'Monday, Wednesday, Friday');

-- --------------------------------------------------------

--
-- Table structure for table `workout_plan`
--

CREATE TABLE `workout_plan` (
  `plan_id` int(11) NOT NULL,
  `member_id` int(11) DEFAULT NULL,
  `plan` varchar(255) NOT NULL,
  `recommendations` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `workout_plan`
--

INSERT INTO `workout_plan` (`plan_id`, `member_id`, `plan`, `recommendations`) VALUES
(1, 1, 'Full body strength training', 'Perform 3 sets of 8-12 reps of exercises like squats, bench press, and rows, 2-3 times per week'),
(2, 2, 'Cardio and HIIT', 'Perform high intensity interval training workouts, such as sprints or circuit training, 3-4 times per week'),
(3, 3, 'Yoga and flexibility', 'Perform yoga and stretching exercises 3-4 times per week to improve flexibility and relaxation'),
(4, 4, 'Powerlifting', 'Perform exercises like squats, bench press, and deadlifts, focusing on increasing strength and power'),
(5, 5, 'Bodybuilding', 'Perform exercises targeting specific muscle groups, 3-4 times per week, with the goal of building muscle size and definition'),
(6, 6, 'Crossfit', 'Perform high intensity functional fitness workouts that combine elements of weightlifting, cardio, and gymnastics'),
(7, 7, 'Runners training', 'Perform workouts to improve running endurance and speed, such as interval training and tempo runs');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appointment_id`),
  ADD KEY `trainer_id` (`trainer_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`attendance_id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`class_id`),
  ADD KEY `instructor_id` (`instructor_id`);

--
-- Indexes for table `contact_info`
--
ALTER TABLE `contact_info`
  ADD PRIMARY KEY (`member_id`);

--
-- Indexes for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD PRIMARY KEY (`enrollment_id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`equipment_id`),
  ADD KEY `membership_tier_id` (`membership_tier_id`);

--
-- Indexes for table `exercise`
--
ALTER TABLE `exercise`
  ADD PRIMARY KEY (`exercise_id`);

--
-- Indexes for table `exercise_instance`
--
ALTER TABLE `exercise_instance`
  ADD PRIMARY KEY (`instance_id`),
  ADD KEY `exercise_id` (`exercise_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `exercise_plan`
--
ALTER TABLE `exercise_plan`
  ADD PRIMARY KEY (`plan_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `goals`
--
ALTER TABLE `goals`
  ADD PRIMARY KEY (`member_id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `promotion_id` (`promotion_id`);

--
-- Indexes for table `measurement`
--
ALTER TABLE `measurement`
  ADD PRIMARY KEY (`measurement_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `medical_info`
--
ALTER TABLE `medical_info`
  ADD PRIMARY KEY (`member_id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`member_id`),
  ADD KEY `membership_tier_id` (`membership_tier_id`);

--
-- Indexes for table `membership_tier`
--
ALTER TABLE `membership_tier`
  ADD PRIMARY KEY (`membership_tier_id`);

--
-- Indexes for table `nutrition`
--
ALTER TABLE `nutrition`
  ADD PRIMARY KEY (`nutrition_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `personal_training`
--
ALTER TABLE `personal_training`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `trainer_id` (`trainer_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`promotion_id`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`purchase_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `trainers`
--
ALTER TABLE `trainers`
  ADD PRIMARY KEY (`trainer_id`);

--
-- Indexes for table `workout_plan`
--
ALTER TABLE `workout_plan`
  ADD PRIMARY KEY (`plan_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`trainer_id`),
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`);

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`),
  ADD CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`);

--
-- Constraints for table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`instructor_id`) REFERENCES `trainers` (`trainer_id`),
  ADD CONSTRAINT `classes_ibfk_2` FOREIGN KEY (`instructor_id`) REFERENCES `trainers` (`trainer_id`);

--
-- Constraints for table `contact_info`
--
ALTER TABLE `contact_info`
  ADD CONSTRAINT `contact_info_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`);

--
-- Constraints for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD CONSTRAINT `enrollment_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`),
  ADD CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`);

--
-- Constraints for table `equipment`
--
ALTER TABLE `equipment`
  ADD CONSTRAINT `equipment_ibfk_1` FOREIGN KEY (`membership_tier_id`) REFERENCES `membership_tier` (`membership_tier_id`);

--
-- Constraints for table `exercise_instance`
--
ALTER TABLE `exercise_instance`
  ADD CONSTRAINT `exercise_instance_ibfk_1` FOREIGN KEY (`exercise_id`) REFERENCES `exercise` (`exercise_id`),
  ADD CONSTRAINT `exercise_instance_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`);

--
-- Constraints for table `exercise_plan`
--
ALTER TABLE `exercise_plan`
  ADD CONSTRAINT `exercise_plan_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`);

--
-- Constraints for table `goals`
--
ALTER TABLE `goals`
  ADD CONSTRAINT `goals_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`);

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`promotion_id`) REFERENCES `promotion` (`promotion_id`);

--
-- Constraints for table `measurement`
--
ALTER TABLE `measurement`
  ADD CONSTRAINT `measurement_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`);

--
-- Constraints for table `medical_info`
--
ALTER TABLE `medical_info`
  ADD CONSTRAINT `medical_info_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`);

--
-- Constraints for table `members`
--
ALTER TABLE `members`
  ADD CONSTRAINT `members_ibfk_1` FOREIGN KEY (`membership_tier_id`) REFERENCES `membership_tier` (`membership_tier_id`),
  ADD CONSTRAINT `members_ibfk_2` FOREIGN KEY (`membership_tier_id`) REFERENCES `membership_tier` (`membership_tier_id`);

--
-- Constraints for table `nutrition`
--
ALTER TABLE `nutrition`
  ADD CONSTRAINT `nutrition_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`);

--
-- Constraints for table `personal_training`
--
ALTER TABLE `personal_training`
  ADD CONSTRAINT `personal_training_ibfk_1` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`trainer_id`),
  ADD CONSTRAINT `personal_training_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `members` (`member_id`);

--
-- Constraints for table `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`);

--
-- Constraints for table `workout_plan`
--
ALTER TABLE `workout_plan`
  ADD CONSTRAINT `workout_plan_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
