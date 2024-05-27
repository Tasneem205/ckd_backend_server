
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


CREATE TABLE `alarmmedicine` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PatientID` int(11) NOT NULL,
  `time` varchar(191) NOT NULL,
  `medicine_name` varchar(191) NOT NULL,
  `dosage` varchar(191) NOT NULL,
  `days` varchar(191) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `alarmmedicine_PatientID_fkey` (`PatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `assistant` (
  `AssistantID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(191) NOT NULL,
  `LastName` varchar(191) NOT NULL,
  `Email` varchar(191) NOT NULL UNIQUE,
  `Password` varchar(191) NOT NULL,
  `Phone_num` varchar(191) NOT NULL,
  `image_path` varchar(191) NOT NULL,
  PRIMARY KEY (`AssistantID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `assistant_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assistantId` int(11) NOT NULL,
  `day` varchar(191) NOT NULL,
  `startTime` varchar(191) NOT NULL,
  `endTime` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `blacklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jwt` varchar(191) NOT NULL,
  `exp` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `dailyprogress` (
  `ProregressID` int(11) NOT NULL AUTO_INCREMENT,
  `PatientID` int(11) NOT NULL,
  `WaterML` int(11) NOT NULL,
  `WalkingTime` time NOT NULL,
  `WalkingSteps` int(11) NOT NULL,
  `Excercise` time NOT NULL,
  `ProgressDate` datetime(3) NOT NULL,
  PRIMARY KEY (`ProregressID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `diabetes` (
  `PatientID` int(11) NOT NULL ,
  `date` datetime(3) NOT NULL,
  `diabetes_value` int(11) NOT NULL,
  PRIMARY KEY (`PatientID`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `doctors` (
  `DoctorID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(191) NOT NULL,
  `LastName` varchar(191) NOT NULL,
  `Phone_num` varchar(191) NOT NULL,
  `Email` varchar(191) NOT NULL UNIQUE,
  `Password` varchar(191) NOT NULL,
  `image_path` varchar(191) NOT NULL,
  PRIMARY KEY (`DoctorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `doctor_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doctorId` int(11) NOT NULL,
  `day` varchar(191) NOT NULL,
  `startTime` varchar(191) NOT NULL,
  `endTime` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `followup` (
  `firstId` int(11) NOT NULL,
  `followupId` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`followupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `general_notes` (
  `noteId` int(11) NOT NULL AUTO_INCREMENT,
  `patientid` int(11) NOT NULL,
  `doctorid` int(11) NOT NULL,
  `time` time NOT NULL,
  `note` varchar(191) NOT NULL,
  PRIMARY KEY (`noteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `img` (
  `imgId` int(11) NOT NULL AUTO_INCREMENT,
  `image_path` varchar(191) NOT NULL,
  `scanId` int(11) NOT NULL,
  PRIMARY KEY (`imgId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `kidney_scan` (
  `Scan_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PatientID` int(11) NOT NULL,
  `ScanDate` datetime(3) NOT NULL,
  `AssistantID` int(11) NOT NULL,
  `DoctorID` int(11) NOT NULL,
  `scan_class` varchar(191) NOT NULL,
  `scan_name` varchar(191) NOT NULL,
  PRIMARY KEY (`Scan_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `kidney_test` (
  `TestID` int(11) NOT NULL AUTO_INCREMENT,
  `TestDate` datetime(3) NOT NULL,
  `PatientID` int(11) NOT NULL,
  `pot` double DEFAULT NULL,
  `hemo` double DEFAULT NULL,
  `pcv` double DEFAULT NULL,
  `wbc` double DEFAULT NULL,
  `rbc` double DEFAULT NULL,
  `pc` double DEFAULT NULL,
  `pcc` double DEFAULT NULL,
  `ba` double DEFAULT NULL,
  `dm` double DEFAULT NULL,
  `cad` double DEFAULT NULL,
  `appet` double DEFAULT NULL,
  `pe` double DEFAULT NULL,
  `ane` double DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `bp` double DEFAULT NULL,
  `bgr` double DEFAULT NULL,
  `bu` double DEFAULT NULL,
  `sc` double DEFAULT NULL,
  `sod` double DEFAULT NULL,
  `sg` double DEFAULT NULL,
  `al` int(11) DEFAULT NULL,
  `su` double DEFAULT NULL,
  `DoctorID` int(11) NOT NULL,
  `assistant_id` int(11) NOT NULL,
  `test_class` double DEFAULT NULL,
  `test_name` varchar(191) DEFAULT NULL,
  `rc` double DEFAULT NULL,
  `htn` double DEFAULT NULL,
  PRIMARY KEY (`TestID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `medications` (
  `medicationID` int(11) NOT NULL AUTO_INCREMENT,
  `medication_name` varchar(191) NOT NULL,
  `dosage_form` varchar(191) NOT NULL,
  `manufacturer` varchar(191) NOT NULL,
  `generic_name` varchar(191) NOT NULL,
  `therapeutic_class` varchar(191) NOT NULL,
  PRIMARY KEY (`medicationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `name: homepageview` (
  `day` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `doctors` int(11) NOT NULL,
  `patients` int(11) NOT NULL,
  `lab_tests` int(11) NOT NULL,
  `scans` int(11) NOT NULL,
  `assistants` int(11) NOT NULL,
  `reports` int(11) NOT NULL,
  PRIMARY KEY (`day`);
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `patients` (
  `PatientID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(191) NOT NULL,
  `LastName` varchar(191) NOT NULL,
  `DateOfBirth` time NOT NULL,
  `Gender` varchar(191) NOT NULL,
  `Email` varchar(191) NOT NULL,
  `Password` varchar(191) NOT NULL,
  `DoctorID` int(11) NOT NULL,
  `Job` varchar(191) DEFAULT NULL,
  `assistantID` int(11) NOT NULL,
  `bloodGroup` varchar(191) DEFAULT NULL,
  `hieght` double DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `registrationDate` time NOT NULL,
  `Phone` varchar(191) DEFAULT NULL,
  `image_path` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`PatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `prescriptions` (
  `prescriptionID` int(11) NOT NULL AUTO_INCREMENT,
  `prescription_date` datetime(3) NOT NULL,
  `reservation_id` int(11) NOT NULL,
  PRIMARY KEY (`prescriptionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `prescriptions_medication` (
  `prescriptionID` int(11) NOT NULL,
  `medicationID` int(11) NOT NULL,
  `dosage` varchar(191) NOT NULL,
  `frequency` varchar(191) NOT NULL,
  `instructions` varchar(191) NOT NULL,
  `ExpiryDate` datetime(3) NOT NULL,
  `prescription_medicationID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`prescription_medicationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `pressure` (
  `PatientID` int(11) NOT NULL,
  `date` datetime(3) NOT NULL,
  `pressureHigh` int(11) NOT NULL,
  `pressureLow` int(11) NOT NULL,
  `heart_rate` int(11) NOT NULL,
  PRIMARY KEY (`PatientID`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `reports` (
  `report_id` int(11) NOT NULL AUTO_INCREMENT,
  `age` int(11) NOT NULL,
  `authority` varchar(191) NOT NULL,
  `examination_date` time NOT NULL,
  `report_date` time NOT NULL,
  `tests_scans` tinyint(1) NOT NULL,
  `tests_scans_notes` varchar(191) NOT NULL,
  `notes` varchar(191) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `assistant_id` int(11) NOT NULL,
  `report_path` varchar(191) NOT NULL,
  PRIMARY KEY (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `reservations` (
  `reservation_id` int(11) NOT NULL AUTO_INCREMENT,
  `assistant_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `notes` varchar(191) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `reservation_date` time NOT NULL,
  `type` enum('First','FollowUP') NOT NULL,
  `is_done` tinyint(1) NOT NULL,
  PRIMARY KEY (`reservation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `video` (
  `VideoId` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(191) NOT NULL,
  `Category` varchar(191) NOT NULL,
  `Descript` varchar(191) NOT NULL,
  `Duration` time NOT NULL,
  `Thumbnail` varchar(191) NOT NULL,
  PRIMARY KEY (`VideoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) NOT NULL,
  `checksum` varchar(64) NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) NOT NULL,
  `logs` text DEFAULT NULL,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `applied_steps_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


ALTER TABLE `assistant_schedule`
  ADD KEY `Assistant_Schedule_assistantId_fkey` (`assistantId`);

ALTER TABLE `dailyprogress`
  ADD KEY `DailyProgress_PatientID_fkey` (`PatientID`);

ALTER TABLE `doctor_schedule`
  ADD KEY `Doctor_Schedule_doctorId_fkey` (`doctorId`);

ALTER TABLE `followup`
  ADD KEY `followup_firstId_fkey` (`firstId`);

ALTER TABLE `general_notes`
  ADD KEY `general_notes_patientid_fkey` (`patientid`),
  ADD KEY `general_notes_doctorid_fkey` (`doctorid`);

ALTER TABLE `img`
  ADD KEY `img_scanId_fkey` (`scanId`);

ALTER TABLE `kidney_scan`
  ADD KEY `kidney_scan_PatientID_fkey` (`PatientID`),
  ADD KEY `kidney_scan_DoctorID_fkey` (`DoctorID`),
  ADD KEY `kidney_scan_AssistantID_fkey` (`AssistantID`);

ALTER TABLE `kidney_test`
  ADD KEY `kidney_test_PatientID_fkey` (`PatientID`),
  ADD KEY `kidney_test_assistant_id_fkey` (`assistant_id`),
  ADD KEY `kidney_test_DoctorID_fkey` (`DoctorID`);

ALTER TABLE `patients`
  ADD UNIQUE KEY `patients_Email_key` (`Email`),
  ADD KEY `patients_DoctorID_fkey` (`DoctorID`),
  ADD KEY `patients_assistantID_fkey` (`assistantID`);

ALTER TABLE `prescriptions`
  ADD KEY `prescriptions_reservation_id_fkey` (`reservation_id`);

ALTER TABLE `prescriptions_medication`
  ADD KEY `prescriptions_medication_medicationID_fkey` (`medicationID`),
  ADD KEY `prescriptions_medication_prescriptionID_fkey` (`prescriptionID`);

ALTER TABLE `reports`
  ADD KEY `reports_patient_id_fkey` (`patient_id`),
  ADD KEY `reports_assistant_id_fkey` (`assistant_id`),
  ADD KEY `reports_doctor_id_fkey` (`doctor_id`);

ALTER TABLE `reservations`
  ADD KEY `reservations_patient_id_fkey` (`patient_id`),
  ADD KEY `reservations_assistant_id_fkey` (`assistant_id`),
  ADD KEY `reservations_doctor_id_fkey` (`doctor_id`);





ALTER TABLE `alarmmedicine`
  ADD CONSTRAINT `alarmmedicine_PatientID_fkey` FOREIGN KEY (`PatientID`) REFERENCES `patients` (`PatientID`) ON UPDATE CASCADE;

ALTER TABLE `assistant_schedule`
  ADD CONSTRAINT `Assistant_Schedule_assistantId_fkey` FOREIGN KEY (`assistantId`) REFERENCES `assistant` (`AssistantID`) ON UPDATE CASCADE;

ALTER TABLE `dailyprogress`
  ADD CONSTRAINT `DailyProgress_PatientID_fkey` FOREIGN KEY (`PatientID`) REFERENCES `patients` (`PatientID`) ON UPDATE CASCADE;

ALTER TABLE `diabetes`
  ADD CONSTRAINT `Diabetes_PatientID_fkey` FOREIGN KEY (`PatientID`) REFERENCES `patients` (`PatientID`) ON UPDATE CASCADE;

ALTER TABLE `doctor_schedule`
  ADD CONSTRAINT `Doctor_Schedule_doctorId_fkey` FOREIGN KEY (`doctorId`) REFERENCES `doctors` (`DoctorID`) ON UPDATE CASCADE;

ALTER TABLE `followup`
  ADD CONSTRAINT `followup_firstId_fkey` FOREIGN KEY (`firstId`) REFERENCES `reservations` (`reservation_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `followup_followupId_fkey` FOREIGN KEY (`followupId`) REFERENCES `reservations` (`reservation_id`) ON UPDATE CASCADE;

ALTER TABLE `general_notes`
  ADD CONSTRAINT `general_notes_doctorid_fkey` FOREIGN KEY (`doctorid`) REFERENCES `doctors` (`DoctorID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `general_notes_patientid_fkey` FOREIGN KEY (`patientid`) REFERENCES `patients` (`PatientID`) ON UPDATE CASCADE;

ALTER TABLE `img`
  ADD CONSTRAINT `img_scanId_fkey` FOREIGN KEY (`scanId`) REFERENCES `kidney_scan` (`Scan_ID`) ON UPDATE CASCADE;

ALTER TABLE `kidney_scan`
  ADD CONSTRAINT `kidney_scan_AssistantID_fkey` FOREIGN KEY (`AssistantID`) REFERENCES `assistant` (`AssistantID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `kidney_scan_DoctorID_fkey` FOREIGN KEY (`DoctorID`) REFERENCES `doctors` (`DoctorID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `kidney_scan_PatientID_fkey` FOREIGN KEY (`PatientID`) REFERENCES `patients` (`PatientID`) ON UPDATE CASCADE;

ALTER TABLE `kidney_test`
  ADD CONSTRAINT `kidney_test_DoctorID_fkey` FOREIGN KEY (`DoctorID`) REFERENCES `doctors` (`DoctorID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `kidney_test_PatientID_fkey` FOREIGN KEY (`PatientID`) REFERENCES `patients` (`PatientID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `kidney_test_assistant_id_fkey` FOREIGN KEY (`assistant_id`) REFERENCES `assistant` (`AssistantID`) ON UPDATE CASCADE;

ALTER TABLE `patients`
  ADD CONSTRAINT `patients_DoctorID_fkey` FOREIGN KEY (`DoctorID`) REFERENCES `doctors` (`DoctorID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `patients_assistantID_fkey` FOREIGN KEY (`assistantID`) REFERENCES `assistant` (`AssistantID`) ON UPDATE CASCADE;

ALTER TABLE `prescriptions`
  ADD CONSTRAINT `prescriptions_reservation_id_fkey` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`reservation_id`) ON UPDATE CASCADE;

ALTER TABLE `prescriptions_medication`
  ADD CONSTRAINT `prescriptions_medication_medicationID_fkey` FOREIGN KEY (`medicationID`) REFERENCES `medications` (`medicationID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `prescriptions_medication_prescriptionID_fkey` FOREIGN KEY (`prescriptionID`) REFERENCES `prescriptions` (`prescriptionID`) ON UPDATE CASCADE;

ALTER TABLE `pressure`
  ADD CONSTRAINT `pressure_PatientID_fkey` FOREIGN KEY (`PatientID`) REFERENCES `patients` (`PatientID`) ON UPDATE CASCADE;

ALTER TABLE `reports`
  ADD CONSTRAINT `reports_assistant_id_fkey` FOREIGN KEY (`assistant_id`) REFERENCES `assistant` (`AssistantID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `reports_doctor_id_fkey` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`DoctorID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `reports_patient_id_fkey` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`PatientID`) ON UPDATE CASCADE;

ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_assistant_id_fkey` FOREIGN KEY (`assistant_id`) REFERENCES `assistant` (`AssistantID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `reservations_doctor_id_fkey` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`DoctorID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `reservations_patient_id_fkey` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`PatientID`) ON UPDATE CASCADE;

ALTER TABLE DailyProgress
MODIFY COLUMN WalkingTime INT,
MODIFY COLUMN Excercise INT;
