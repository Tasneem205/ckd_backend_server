
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


INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `started_at`, `applied_steps_count`) VALUES
('12525ad1-9c9e-4048-86ca-f658326e3c43', '177ffdb0fdc1c76c5b2ac0c3c1e28a8cc64a4fb3228d969fc30ad4990ea318be', '2024-05-24 21:03:36.272', '20240523223258_init', NULL, NULL, '2024-05-24 21:03:35.534', 1),
('260675a2-10c8-4a90-9904-3d2708cab021', 'c1498e35072c696cd0e51da5ca3764a9d26da4e8bd9d9ad01b8d09e7fb3656e2', '2024-05-24 21:03:13.379', '20240510122440_init', NULL, NULL, '2024-05-24 21:02:39.503', 1),
('282ee6ac-a0a4-46aa-83ce-4908073a4f01', '5356efd5bd33a468370b17afa8648224f03031505744e898a444b6a85e8070db', '2024-05-24 21:06:48.301', '20240524210647_init', NULL, NULL, '2024-05-24 21:06:47.951', 1),
('3fb3fd66-6675-469d-96de-84cffd3c0272', '62b20112820e5974d440ac053bef3bd3b63f656f7618f2ff7e98a6e40cc53c91', '2024-05-24 21:02:04.837', '20240218102225_init', NULL, NULL, '2024-05-24 21:02:01.455', 1),
('5325cb32-b540-4e75-9c4d-636960739f88', '86c73d7bbcf3e45e64eda9bd59e1e338c05aaa0a15ba625d9aa1ba9562eb1fa4', '2024-05-24 21:03:30.425', '20240521224900_init', NULL, NULL, '2024-05-24 21:03:28.873', 1),
('5476d07c-e249-4ed3-8b67-a310f4403309', '9d258eca2bba573c32dacc5cc0b16776f411bf776fa137d2b31a00ffdeb308b3', '2024-05-24 21:03:16.365', '20240513175604_init', NULL, NULL, '2024-05-24 21:03:13.680', 1),
('581ced06-0cae-4c36-9b77-c9346ac4d0f8', '63b9eb62d3b7b1fb630ac7accd8848a30a594364891cba0563c86f92008d0701', '2024-05-24 21:02:27.573', '20240309200238_init', NULL, NULL, '2024-05-24 21:02:25.950', 1),
('6cde4288-be2a-4a76-bfde-9ac4758044c9', '061c3fe3ce1dc4f79cf5a67a80e557833a7dcc86212a24404d76600f6a51009c', '2024-05-24 21:02:29.471', '20240309203427_init', NULL, NULL, '2024-05-24 21:02:27.652', 1),
('6fd842cc-2e22-4547-b94b-17c43d53b5cf', '313a8ee398d961bf94986aa7b43a9ccb60cf9b6dbb59a80f12fe9866be519596', '2024-05-24 21:02:32.385', '20240319112924_init', NULL, NULL, '2024-05-24 21:02:30.269', 1),
('77159333-0932-4955-9870-877086b34f01', 'f235abee2083a3fadd783c426b1b673cd042e38452dd380f9b976ca59b4a389d', '2024-05-24 21:03:30.864', '20240523202442_init', NULL, NULL, '2024-05-24 21:03:30.477', 1),
('8a9dc2b0-3496-4ec7-a86a-f2f8f004f429', '1535850d41f8131f66deb8563cd5334f7a954d23609544f667e8b121fe4fab4c', '2024-05-24 21:03:28.621', '20240518195300_init', NULL, NULL, '2024-05-24 21:03:24.926', 1),
('8b2875f2-7f44-4802-bae4-ffbdb97328dd', '9c6fd6d21d776b6aed47bbf5fa49e41b108f75cee7e8fbb6cc935773184af50a', '2024-05-24 21:02:39.137', '20240416114704_init', NULL, NULL, '2024-05-24 21:02:32.600', 1),
('9ff27231-c654-46e5-88f5-2f141e7bdcbf', 'aec350e0265e69b9cfb37e9175f67a401f23a68076a48c7fc4099bfdab7978e2', '2024-05-24 21:02:30.152', '20240309214349_init', NULL, NULL, '2024-05-24 21:02:29.679', 1),
('b0c0c8c8-3484-4125-9d1e-603e0d4a0386', 'e8fd6e36a7e6cbff1b0a548381119d21da36e4474d6bdd962c058741def4e10d', '2024-05-24 21:02:39.485', '20240417095916_init', NULL, NULL, '2024-05-24 21:02:39.209', 1),
('ba59e366-5624-4f6e-b6eb-766a704ca7b4', '9a5dd9585c4774384dd384549ebfd8c23755b08438ad96163590fdb80ffc7e64', '2024-05-24 21:03:23.255', '20240515172237_init', NULL, NULL, '2024-05-24 21:03:20.425', 1),
('ccd512ed-f1a9-48e1-a753-9cdfb17cee0c', '87a139e567863e83a25c10492a48f2ee3095dd8a8e54e3a625a08b40a7cb2622', '2024-05-24 21:03:19.489', '20240515163458_init', NULL, NULL, '2024-05-24 21:03:16.641', 1),
('cd66e745-3fed-4199-9a63-7db6078a3ea1', 'df30e7493b6887de0734dcacdf588b4ccbbd35b87d26e44ff73a9578a54d93f9', '2024-05-24 21:03:35.466', '20240523203354_init', NULL, NULL, '2024-05-24 21:03:30.921', 1),
('d5aeb45f-4202-4766-8404-4b07220b95fc', '49655f185c9a76f17b9baa537cdf401e5c69857187a181e51b5aa0a5018ab7ec', '2024-05-24 21:02:25.554', '20240309122913_init', NULL, NULL, '2024-05-24 21:02:05.302', 1),
('dfa9428f-21b8-450f-a355-3e2c8c02f3b8', '4ca32ee1496949e892b95c8caf3e8a378ae3794c3b5d8777f850c8e0e27f0c00', '2024-05-24 21:02:05.285', '20240309093606_init', NULL, NULL, '2024-05-24 21:02:04.918', 1),
('e87ab31f-4875-46c7-976f-decf646c0fd1', 'e2fc42134af12faa8b8bb9cb96e84d8a885c7e0cb0504d71c8c42dcd9eb2ed75', '2024-05-24 21:03:20.166', '20240515172041_init', NULL, NULL, '2024-05-24 21:03:19.563', 1),
('ec2967ad-b995-4c36-8c0f-2c3ceeb4ce47', 'b1b0c6e0dd8d759a516876a677366e55a42a2d0d0f2053361924c08b14cb0ccd', '2024-05-24 21:03:24.719', '20240515181242_init', NULL, NULL, '2024-05-24 21:03:23.334', 1),
('f1e77cd9-e20e-42ba-b7c6-aee47ef003c8', '9278ab9d2a1ba625a872bfe15a05f08be004c23c30bd362b6530a1243545106f', '2024-05-24 21:03:13.657', '20240513000933_init', NULL, NULL, '2024-05-24 21:03:13.413', 1);



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
