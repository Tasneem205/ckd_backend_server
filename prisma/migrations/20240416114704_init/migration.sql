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

    PRIMARY KEY (`report_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `reservations` (
    `reservation_id` INTEGER NOT NULL AUTO_INCREMENT,
    `assistant_id` INTEGER NOT NULL,
    `doctor_id` INTEGER NOT NULL,
    `notes` VARCHAR(191) NOT NULL,
    `patient_id` INTEGER NOT NULL,
    `prescription_id` INTEGER NOT NULL,
    `reservation_date` TIME NOT NULL,
    `type` ENUM('First', 'FollowUP') NOT NULL,

    PRIMARY KEY (`reservation_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

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
ALTER TABLE `reservations` ADD CONSTRAINT `reservations_prescription_id_fkey` FOREIGN KEY (`prescription_id`) REFERENCES `prescriptions`(`prescriptionID`) ON DELETE RESTRICT ON UPDATE CASCADE;
