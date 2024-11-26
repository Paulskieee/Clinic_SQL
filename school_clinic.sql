-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2024 at 12:50 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school_clinic`
--

-- --------------------------------------------------------

--
-- Table structure for table `diagnosis`
--

CREATE TABLE `diagnosis` (
  `Diagnosis_ID` int(11) NOT NULL,
  `Registration_ID` int(11) NOT NULL,
  `Diagnosis_Date` timestamp NOT NULL DEFAULT current_timestamp(),
  `Notes` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `health_record`
--

CREATE TABLE `health_record` (
  `Record_ID` int(11) NOT NULL,
  `Student_ID` int(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Medical_Condition` enum('Head/Neck Injury','Frequent Headaches','Frequent Dizziness','Fainting Spells, Fits, Seizures','Insomnia/Sleep Disorder','Depression/Other Mental Disorder','Eye Problems/Error of Refraction','Deafness/Ear Disorder','Nose/Throat Disorder','Bronchial Asthma','Tuberculosis/Other Lung Disease','High Blood Pressure','Heart Disease/Chest Pain','Rheumatic Fever','Diabetes Mellitus','Thyroid Disorder','Cancer or Tumor','Blood Disorder','Stomach Pain','GERD, Ulcer','Other Abdominal Disease','Gynecologic Disorder','LMP','Kidney or Bladder Disorder','Back Injury/Arthritis','Genetic, Hereditary, Familial Disorder','Sexually Transmitted Disease','Dengue, Malaria, Typhoid Fever','Schistosomiasis','Allergies','Accidents') DEFAULT NULL,
  `Medical_History` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `medical_staff`
--

CREATE TABLE `medical_staff` (
  `Staff_ID` int(100) NOT NULL,
  `Name` varchar(200) NOT NULL,
  `Position` enum('Doctor','Dentist','Nurse') NOT NULL,
  `Contact_Info` varchar(200) NOT NULL,
  `Employement_Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `Registration_ID` int(11) NOT NULL,
  `Student_ID` int(10) NOT NULL,
  `Staff_ID` int(100) NOT NULL,
  `Reason` enum('General_Check-up','Dental','Follow-up','Emergency') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_student`
--

CREATE TABLE `tb_student` (
  `Student_ID` int(10) NOT NULL,
  `Last_Name` varchar(200) NOT NULL,
  `First_Name` varchar(200) NOT NULL,
  `DateOfBirth` date NOT NULL,
  `Contact_Info` varchar(200) NOT NULL,
  `Address` varchar(200) DEFAULT NULL,
  `Emergency_Contact` varchar(200) NOT NULL,
  `Enrollment_Year` year(4) DEFAULT NULL,
  `Major` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `treatment`
--

CREATE TABLE `treatment` (
  `Treatment_ID` int(11) NOT NULL,
  `Diagnosis_ID` int(11) NOT NULL,
  `Prescribe_Medication` varchar(255) DEFAULT NULL,
  `Dosage` varchar(255) DEFAULT NULL,
  `Duration_Of_Treatment` varchar(255) DEFAULT NULL,
  `Notes` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visit`
--

CREATE TABLE `visit` (
  `Visit_ID` int(11) NOT NULL,
  `Student_ID` int(10) DEFAULT NULL,
  `Staff_ID` int(100) DEFAULT NULL,
  `Visit_Date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `diagnosis`
--
ALTER TABLE `diagnosis`
  ADD PRIMARY KEY (`Diagnosis_ID`),
  ADD KEY `Registration_ID` (`Registration_ID`);

--
-- Indexes for table `health_record`
--
ALTER TABLE `health_record`
  ADD PRIMARY KEY (`Record_ID`),
  ADD KEY `Student_ID` (`Student_ID`);

--
-- Indexes for table `medical_staff`
--
ALTER TABLE `medical_staff`
  ADD PRIMARY KEY (`Staff_ID`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`Registration_ID`),
  ADD KEY `Student_ID` (`Student_ID`),
  ADD KEY `Staff_ID` (`Staff_ID`);

--
-- Indexes for table `tb_student`
--
ALTER TABLE `tb_student`
  ADD PRIMARY KEY (`Student_ID`);

--
-- Indexes for table `treatment`
--
ALTER TABLE `treatment`
  ADD PRIMARY KEY (`Treatment_ID`),
  ADD KEY `Diagnosis_ID` (`Diagnosis_ID`);

--
-- Indexes for table `visit`
--
ALTER TABLE `visit`
  ADD PRIMARY KEY (`Visit_ID`),
  ADD KEY `Student_ID` (`Student_ID`),
  ADD KEY `Staff_ID` (`Staff_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `diagnosis`
--
ALTER TABLE `diagnosis`
  MODIFY `Diagnosis_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `health_record`
--
ALTER TABLE `health_record`
  MODIFY `Record_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `registration`
--
ALTER TABLE `registration`
  MODIFY `Registration_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `treatment`
--
ALTER TABLE `treatment`
  MODIFY `Treatment_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visit`
--
ALTER TABLE `visit`
  MODIFY `Visit_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `diagnosis`
--
ALTER TABLE `diagnosis`
  ADD CONSTRAINT `diagnosis_ibfk_1` FOREIGN KEY (`Registration_ID`) REFERENCES `registration` (`Registration_ID`);

--
-- Constraints for table `health_record`
--
ALTER TABLE `health_record`
  ADD CONSTRAINT `health_record_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `tb_student` (`Student_ID`);

--
-- Constraints for table `registration`
--
ALTER TABLE `registration`
  ADD CONSTRAINT `registration_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `tb_student` (`Student_ID`),
  ADD CONSTRAINT `registration_ibfk_2` FOREIGN KEY (`Staff_ID`) REFERENCES `medical_staff` (`Staff_ID`);

--
-- Constraints for table `treatment`
--
ALTER TABLE `treatment`
  ADD CONSTRAINT `treatment_ibfk_1` FOREIGN KEY (`Diagnosis_ID`) REFERENCES `diagnosis` (`Diagnosis_ID`);

--
-- Constraints for table `visit`
--
ALTER TABLE `visit`
  ADD CONSTRAINT `visit_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `tb_student` (`Student_ID`),
  ADD CONSTRAINT `visit_ibfk_2` FOREIGN KEY (`Staff_ID`) REFERENCES `medical_staff` (`Staff_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
