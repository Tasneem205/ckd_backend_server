-- CreateTable
CREATE TABLE `Assistant_Schedule` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `assistantId` INTEGER NOT NULL,
    `day` VARCHAR(191) NOT NULL,
    `startTime` VARCHAR(191) NOT NULL,
    `endTime` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Assistant` (
    `AssistantID` INTEGER NOT NULL AUTO_INCREMENT,
    `FirstName` VARCHAR(191) NOT NULL,
    `LastName` VARCHAR(191) NOT NULL,
    `Email` VARCHAR(191) NOT NULL,
    `Password` VARCHAR(191) NOT NULL,
    `Phone_num` VARCHAR(191) NOT NULL,
    `image_path` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Assistant_Email_key`(`Email`),
    PRIMARY KEY (`AssistantID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `blackList` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `jwt` VARCHAR(191) NOT NULL,
    `exp` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DailyProgress` (
    `ProregressID` INTEGER NOT NULL AUTO_INCREMENT,
    `PatientID` INTEGER NOT NULL,
    `ProgressDate` DATETIME(3) NOT NULL,
    `WaterML` INTEGER NOT NULL,
    `WalkingTime` TIME NOT NULL,
    `WalkingSteps` INTEGER NOT NULL,
    `Excercise` TIME NOT NULL,

    PRIMARY KEY (`ProregressID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Diabetes` (
    `PatientID` INTEGER NOT NULL,
    `date` DATETIME(3) NOT NULL,
    `diabetes_value` INTEGER NOT NULL,

    PRIMARY KEY (`PatientID`, `date`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Doctor_Schedule` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `doctorId` INTEGER NOT NULL,
    `day` VARCHAR(191) NOT NULL,
    `startTime` VARCHAR(191) NOT NULL,
    `endTime` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Doctors` (
    `DoctorID` INTEGER NOT NULL AUTO_INCREMENT,
    `FirstName` VARCHAR(191) NOT NULL,
    `LastName` VARCHAR(191) NOT NULL,
    `Phone_num` VARCHAR(191) NOT NULL,
    `Email` VARCHAR(191) NOT NULL,
    `Password` VARCHAR(191) NOT NULL,
    `image_path` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Doctors_Email_key`(`Email`),
    PRIMARY KEY (`DoctorID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `followup` (
    `followupId` INTEGER NOT NULL,
    `firstId` INTEGER NOT NULL,

    PRIMARY KEY (`followupId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `kidney_scan` (
    `Scan_ID` INTEGER NOT NULL AUTO_INCREMENT,
    `scan_name` VARCHAR(191) NOT NULL,
    `PatientID` INTEGER NOT NULL,
    `DoctorID` INTEGER NOT NULL,
    `AssistantID` INTEGER NOT NULL,
    `ScanDate` DATETIME(3) NOT NULL,
    `scan_class` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`Scan_ID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `img` (
    `imgId` INTEGER NOT NULL AUTO_INCREMENT,
    `image_path` VARCHAR(191) NOT NULL,
    `scanId` INTEGER NOT NULL,

    PRIMARY KEY (`imgId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `kidney_test` (
    `TestID` INTEGER NOT NULL AUTO_INCREMENT,
    `test_name` VARCHAR(191) NULL,
    `TestDate` DATETIME(3) NOT NULL,
    `PatientID` INTEGER NOT NULL,
    `assistant_id` INTEGER NOT NULL,
    `DoctorID` INTEGER NOT NULL,
    `pot` DOUBLE NULL,
    `hemo` DOUBLE NULL,
    `pcv` DOUBLE NULL,
    `wbc` DOUBLE NULL,
    `rbc` DOUBLE NULL,
    `pc` DOUBLE NULL,
    `pcc` DOUBLE NULL,
    `ba` DOUBLE NULL,
    `htn` DOUBLE NULL,
    `dm` DOUBLE NULL,
    `cad` DOUBLE NULL,
    `appet` DOUBLE NULL,
    `pe` DOUBLE NULL,
    `ane` DOUBLE NULL,
    `age` INTEGER NULL,
    `bp` DOUBLE NULL,
    `bgr` DOUBLE NULL,
    `bu` DOUBLE NULL,
    `sc` DOUBLE NULL,
    `sod` DOUBLE NULL,
    `sg` DOUBLE NULL,
    `al` INTEGER NULL,
    `su` DOUBLE NULL,
    `rc` DOUBLE NULL,
    `test_class` DOUBLE NULL,

    PRIMARY KEY (`TestID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `medications` (
    `medicationID` INTEGER NOT NULL AUTO_INCREMENT,
    `medication_name` VARCHAR(191) NOT NULL,
    `dosage_form` VARCHAR(191) NOT NULL,
    `manufacturer` VARCHAR(191) NOT NULL,
    `generic_name` VARCHAR(191) NOT NULL,
    `therapeutic_class` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`medicationID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `patients` (
    `PatientID` INTEGER NOT NULL AUTO_INCREMENT,
    `FirstName` VARCHAR(191) NOT NULL,
    `LastName` VARCHAR(191) NOT NULL,
    `DateOfBirth` TIME NOT NULL,
    `Gender` VARCHAR(191) NOT NULL,
    `Email` VARCHAR(191) NOT NULL,
    `Password` VARCHAR(191) NOT NULL,
    `DoctorID` INTEGER NOT NULL,
    `Job` VARCHAR(191) NULL,
    `bloodGroup` VARCHAR(191) NULL,
    `hieght` DOUBLE NULL,
    `weight` DOUBLE NULL,
    `assistantID` INTEGER NOT NULL,
    `registrationDate` TIME NOT NULL,
    `Phone` VARCHAR(191) NULL,
    `image_path` VARCHAR(191) NULL,

    UNIQUE INDEX `patients_Email_key`(`Email`),
    PRIMARY KEY (`PatientID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `general_notes` (
    `noteId` INTEGER NOT NULL AUTO_INCREMENT,
    `patientid` INTEGER NOT NULL,
    `doctorid` INTEGER NOT NULL,
    `time` TIME NOT NULL,
    `note` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`noteId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `prescriptions` (
    `prescriptionID` INTEGER NOT NULL AUTO_INCREMENT,
    `prescription_date` DATETIME(3) NOT NULL,
    `reservation_id` INTEGER NOT NULL,

    PRIMARY KEY (`prescriptionID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `prescriptions_medication` (
    `prescription_medicationID` INTEGER NOT NULL AUTO_INCREMENT,
    `prescriptionID` INTEGER NOT NULL,
    `medicationID` INTEGER NOT NULL,
    `dosage` VARCHAR(191) NOT NULL,
    `frequency` VARCHAR(191) NOT NULL,
    `ExpiryDate` DATETIME(3) NOT NULL,
    `instructions` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`prescription_medicationID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `pressure` (
    `PatientID` INTEGER NOT NULL,
    `date` DATETIME(3) NOT NULL,
    `pressureHigh` INTEGER NOT NULL,
    `pressureLow` INTEGER NOT NULL,
    `heart_rate` INTEGER NOT NULL,

    PRIMARY KEY (`PatientID`, `date`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `reports` (
    `report_id` INTEGER NOT NULL AUTO_INCREMENT,
    `age` INTEGER NOT NULL,
    `authority` VARCHAR(191) NOT NULL,
    `examination_date` TIME NOT NULL,
    `report_date` TIME NOT NULL,
    `tests_scans` BOOLEAN NOT NULL,
    `tests_scans_notes` VARCHAR(191) NOT NULL,
    `notes` VARCHAR(191) NOT NULL,
    `doctor_id` INTEGER NOT NULL,
    `patient_id` INTEGER NOT NULL,
    `assistant_id` INTEGER NOT NULL,
    `report_path` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`report_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `reservations` (
    `reservation_id` INTEGER NOT NULL AUTO_INCREMENT,
    `assistant_id` INTEGER NOT NULL,
    `doctor_id` INTEGER NOT NULL,
    `patient_id` INTEGER NOT NULL,
    `notes` VARCHAR(191) NOT NULL,
    `reservation_date` TIME NOT NULL,
    `is_done` BOOLEAN NOT NULL,
    `type` ENUM('First', 'FollowUP') NOT NULL,

    PRIMARY KEY (`reservation_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `video` (
    `VideoId` INTEGER NOT NULL AUTO_INCREMENT,
    `Title` VARCHAR(191) NOT NULL,
    `Category` VARCHAR(191) NOT NULL,
    `Descript` VARCHAR(191) NOT NULL,
    `Duration` TIME NOT NULL,
    `Thumbnail` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`VideoId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `alarmmedicine` (
    `ID` INTEGER NOT NULL AUTO_INCREMENT,
    `PatientID` INTEGER NOT NULL,
    `time` VARCHAR(191) NOT NULL,
    `medicine_name` VARCHAR(191) NOT NULL,
    `dosage` VARCHAR(191) NOT NULL,
    `days` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`ID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `name: homepageView` (
    `day` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `doctors` INTEGER NOT NULL,
    `patients` INTEGER NOT NULL,
    `lab_tests` INTEGER NOT NULL,
    `reports` INTEGER NOT NULL,
    `scans` INTEGER NOT NULL,
    `assistants` INTEGER NOT NULL,

    PRIMARY KEY (`day`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Assistant_Schedule` ADD CONSTRAINT `Assistant_Schedule_assistantId_fkey` FOREIGN KEY (`assistantId`) REFERENCES `Assistant`(`AssistantID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DailyProgress` ADD CONSTRAINT `DailyProgress_PatientID_fkey` FOREIGN KEY (`PatientID`) REFERENCES `patients`(`PatientID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Diabetes` ADD CONSTRAINT `Diabetes_PatientID_fkey` FOREIGN KEY (`PatientID`) REFERENCES `patients`(`PatientID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Doctor_Schedule` ADD CONSTRAINT `Doctor_Schedule_doctorId_fkey` FOREIGN KEY (`doctorId`) REFERENCES `Doctors`(`DoctorID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `followup` ADD CONSTRAINT `followup_firstId_fkey` FOREIGN KEY (`firstId`) REFERENCES `reservations`(`reservation_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `followup` ADD CONSTRAINT `followup_followupId_fkey` FOREIGN KEY (`followupId`) REFERENCES `reservations`(`reservation_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `kidney_scan` ADD CONSTRAINT `kidney_scan_PatientID_fkey` FOREIGN KEY (`PatientID`) REFERENCES `patients`(`PatientID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `kidney_scan` ADD CONSTRAINT `kidney_scan_DoctorID_fkey` FOREIGN KEY (`DoctorID`) REFERENCES `Doctors`(`DoctorID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `kidney_scan` ADD CONSTRAINT `kidney_scan_AssistantID_fkey` FOREIGN KEY (`AssistantID`) REFERENCES `Assistant`(`AssistantID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `img` ADD CONSTRAINT `img_scanId_fkey` FOREIGN KEY (`scanId`) REFERENCES `kidney_scan`(`Scan_ID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `kidney_test` ADD CONSTRAINT `kidney_test_assistant_id_fkey` FOREIGN KEY (`assistant_id`) REFERENCES `Assistant`(`AssistantID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `kidney_test` ADD CONSTRAINT `kidney_test_PatientID_fkey` FOREIGN KEY (`PatientID`) REFERENCES `patients`(`PatientID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `kidney_test` ADD CONSTRAINT `kidney_test_DoctorID_fkey` FOREIGN KEY (`DoctorID`) REFERENCES `Doctors`(`DoctorID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `patients` ADD CONSTRAINT `patients_DoctorID_fkey` FOREIGN KEY (`DoctorID`) REFERENCES `Doctors`(`DoctorID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `patients` ADD CONSTRAINT `patients_assistantID_fkey` FOREIGN KEY (`assistantID`) REFERENCES `Assistant`(`AssistantID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `general_notes` ADD CONSTRAINT `general_notes_patientid_fkey` FOREIGN KEY (`patientid`) REFERENCES `patients`(`PatientID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `general_notes` ADD CONSTRAINT `general_notes_doctorid_fkey` FOREIGN KEY (`doctorid`) REFERENCES `Doctors`(`DoctorID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `prescriptions` ADD CONSTRAINT `prescriptions_reservation_id_fkey` FOREIGN KEY (`reservation_id`) REFERENCES `reservations`(`reservation_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `prescriptions_medication` ADD CONSTRAINT `prescriptions_medication_prescriptionID_fkey` FOREIGN KEY (`prescriptionID`) REFERENCES `prescriptions`(`prescriptionID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `prescriptions_medication` ADD CONSTRAINT `prescriptions_medication_medicationID_fkey` FOREIGN KEY (`medicationID`) REFERENCES `medications`(`medicationID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `pressure` ADD CONSTRAINT `pressure_PatientID_fkey` FOREIGN KEY (`PatientID`) REFERENCES `patients`(`PatientID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `reports` ADD CONSTRAINT `reports_patient_id_fkey` FOREIGN KEY (`patient_id`) REFERENCES `patients`(`PatientID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `reports` ADD CONSTRAINT `reports_assistant_id_fkey` FOREIGN KEY (`assistant_id`) REFERENCES `Assistant`(`AssistantID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `reports` ADD CONSTRAINT `reports_doctor_id_fkey` FOREIGN KEY (`doctor_id`) REFERENCES `Doctors`(`DoctorID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `reservations` ADD CONSTRAINT `reservations_patient_id_fkey` FOREIGN KEY (`patient_id`) REFERENCES `patients`(`PatientID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `reservations` ADD CONSTRAINT `reservations_assistant_id_fkey` FOREIGN KEY (`assistant_id`) REFERENCES `Assistant`(`AssistantID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `reservations` ADD CONSTRAINT `reservations_doctor_id_fkey` FOREIGN KEY (`doctor_id`) REFERENCES `Doctors`(`DoctorID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `alarmmedicine` ADD CONSTRAINT `alarmmedicine_PatientID_fkey` FOREIGN KEY (`PatientID`) REFERENCES `patients`(`PatientID`) ON DELETE RESTRICT ON UPDATE CASCADE;
