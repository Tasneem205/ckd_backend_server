/*
  Warnings:

  - The primary key for the `followup` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `followupID` on the `followup` table. All the data in the column will be lost.
  - You are about to drop the column `followup_date` on the `followup` table. All the data in the column will be lost.
  - You are about to drop the column `followup_notes` on the `followup` table. All the data in the column will be lost.
  - You are about to drop the column `prescriptionID` on the `followup` table. All the data in the column will be lost.
  - You are about to drop the column `class` on the `kidney_scan` table. All the data in the column will be lost.
  - You are about to drop the column `img` on the `kidney_scan` table. All the data in the column will be lost.
  - You are about to drop the column `class` on the `kidney_test` table. All the data in the column will be lost.
  - You are about to drop the column `DoctorID` on the `prescriptions` table. All the data in the column will be lost.
  - You are about to drop the column `ExpiryDate` on the `prescriptions` table. All the data in the column will be lost.
  - You are about to drop the column `PatientID` on the `prescriptions` table. All the data in the column will be lost.
  - The primary key for the `prescriptions_medication` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `prescription_id` on the `reservations` table. All the data in the column will be lost.
  - Added the required column `image_path` to the `Assistant` table without a default value. This is not possible if the table is not empty.
  - Added the required column `image_path` to the `Doctors` table without a default value. This is not possible if the table is not empty.
  - Added the required column `firstId` to the `followup` table without a default value. This is not possible if the table is not empty.
  - Added the required column `followupId` to the `followup` table without a default value. This is not possible if the table is not empty.
  - Added the required column `AssistantID` to the `kidney_scan` table without a default value. This is not possible if the table is not empty.
  - Added the required column `DoctorID` to the `kidney_scan` table without a default value. This is not possible if the table is not empty.
  - Added the required column `scan_class` to the `kidney_scan` table without a default value. This is not possible if the table is not empty.
  - Added the required column `scan_name` to the `kidney_scan` table without a default value. This is not possible if the table is not empty.
  - Added the required column `DoctorID` to the `kidney_test` table without a default value. This is not possible if the table is not empty.
  - Added the required column `assistant_id` to the `kidney_test` table without a default value. This is not possible if the table is not empty.
  - Added the required column `test_class` to the `kidney_test` table without a default value. This is not possible if the table is not empty.
  - Added the required column `test_name` to the `kidney_test` table without a default value. This is not possible if the table is not empty.
  - Added the required column `Phone` to the `patients` table without a default value. This is not possible if the table is not empty.
  - Added the required column `image_path` to the `patients` table without a default value. This is not possible if the table is not empty.
  - Added the required column `reservation_id` to the `prescriptions` table without a default value. This is not possible if the table is not empty.
  - Added the required column `ExpiryDate` to the `prescriptions_medication` table without a default value. This is not possible if the table is not empty.
  - Added the required column `prescription_medicationID` to the `prescriptions_medication` table without a default value. This is not possible if the table is not empty.
  - Added the required column `report_path` to the `reports` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `followup` DROP FOREIGN KEY `followup_prescriptionID_fkey`;

-- DropForeignKey
ALTER TABLE `prescriptions` DROP FOREIGN KEY `prescriptions_DoctorID_fkey`;

-- DropForeignKey
ALTER TABLE `prescriptions` DROP FOREIGN KEY `prescriptions_PatientID_fkey`;

-- DropForeignKey
ALTER TABLE `reservations` DROP FOREIGN KEY `reservations_prescription_id_fkey`;

-- AlterTable
ALTER TABLE `assistant` ADD COLUMN `image_path` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `doctors` ADD COLUMN `image_path` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `followup` DROP PRIMARY KEY,
    DROP COLUMN `followupID`,
    DROP COLUMN `followup_date`,
    DROP COLUMN `followup_notes`,
    DROP COLUMN `prescriptionID`,
    ADD COLUMN `firstId` INTEGER NOT NULL,
    ADD COLUMN `followupId` INTEGER NOT NULL,
    ADD PRIMARY KEY (`followupId`);

-- AlterTable
ALTER TABLE `kidney_scan` DROP COLUMN `class`,
    DROP COLUMN `img`,
    ADD COLUMN `AssistantID` INTEGER NOT NULL,
    ADD COLUMN `DoctorID` INTEGER NOT NULL,
    ADD COLUMN `scan_class` VARCHAR(191) NOT NULL,
    ADD COLUMN `scan_name` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `kidney_test` DROP COLUMN `class`,
    ADD COLUMN `DoctorID` INTEGER NOT NULL,
    ADD COLUMN `assistant_id` INTEGER NOT NULL,
    ADD COLUMN `test_class` VARCHAR(191) NOT NULL,
    ADD COLUMN `test_name` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `patients` ADD COLUMN `Phone` VARCHAR(191) NOT NULL,
    ADD COLUMN `image_path` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `prescriptions` DROP COLUMN `DoctorID`,
    DROP COLUMN `ExpiryDate`,
    DROP COLUMN `PatientID`,
    ADD COLUMN `reservation_id` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `prescriptions_medication` DROP PRIMARY KEY,
    ADD COLUMN `ExpiryDate` DATETIME(3) NOT NULL,
    ADD COLUMN `prescription_medicationID` INTEGER NOT NULL AUTO_INCREMENT,
    MODIFY `prescriptionID` INTEGER NOT NULL,
    ADD PRIMARY KEY (`prescription_medicationID`);

-- AlterTable
ALTER TABLE `reports` ADD COLUMN `report_path` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `reservations` DROP COLUMN `prescription_id`;

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
CREATE TABLE `Doctor_Schedule` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `doctorId` INTEGER NOT NULL,
    `day` VARCHAR(191) NOT NULL,
    `startTime` VARCHAR(191) NOT NULL,
    `endTime` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `img` (
    `imgId` INTEGER NOT NULL AUTO_INCREMENT,
    `image_path` VARCHAR(191) NOT NULL,
    `scanId` INTEGER NOT NULL,

    PRIMARY KEY (`imgId`)
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
CREATE TABLE `alarmmedicine` (
    `ID` INTEGER NOT NULL,
    `PatientID` INTEGER NOT NULL,
    `time` DATETIME(3) NOT NULL,
    `medicine_name` VARCHAR(191) NOT NULL,
    `dosage` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`PatientID`, `time`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Assistant_Schedule` ADD CONSTRAINT `Assistant_Schedule_assistantId_fkey` FOREIGN KEY (`assistantId`) REFERENCES `Assistant`(`AssistantID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Doctor_Schedule` ADD CONSTRAINT `Doctor_Schedule_doctorId_fkey` FOREIGN KEY (`doctorId`) REFERENCES `Doctors`(`DoctorID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `followup` ADD CONSTRAINT `followup_firstId_fkey` FOREIGN KEY (`firstId`) REFERENCES `reservations`(`reservation_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `followup` ADD CONSTRAINT `followup_followupId_fkey` FOREIGN KEY (`followupId`) REFERENCES `reservations`(`reservation_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `kidney_scan` ADD CONSTRAINT `kidney_scan_DoctorID_fkey` FOREIGN KEY (`DoctorID`) REFERENCES `Doctors`(`DoctorID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `kidney_scan` ADD CONSTRAINT `kidney_scan_AssistantID_fkey` FOREIGN KEY (`AssistantID`) REFERENCES `Assistant`(`AssistantID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `img` ADD CONSTRAINT `img_scanId_fkey` FOREIGN KEY (`scanId`) REFERENCES `kidney_scan`(`Scan_ID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `kidney_test` ADD CONSTRAINT `kidney_test_assistant_id_fkey` FOREIGN KEY (`assistant_id`) REFERENCES `Assistant`(`AssistantID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `kidney_test` ADD CONSTRAINT `kidney_test_DoctorID_fkey` FOREIGN KEY (`DoctorID`) REFERENCES `Doctors`(`DoctorID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `general_notes` ADD CONSTRAINT `general_notes_patientid_fkey` FOREIGN KEY (`patientid`) REFERENCES `patients`(`PatientID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `general_notes` ADD CONSTRAINT `general_notes_doctorid_fkey` FOREIGN KEY (`doctorid`) REFERENCES `Doctors`(`DoctorID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `prescriptions` ADD CONSTRAINT `prescriptions_reservation_id_fkey` FOREIGN KEY (`reservation_id`) REFERENCES `reservations`(`reservation_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `prescriptions_medication` ADD CONSTRAINT `prescriptions_medication_prescriptionID_fkey` FOREIGN KEY (`prescriptionID`) REFERENCES `prescriptions`(`prescriptionID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `alarmmedicine` ADD CONSTRAINT `alarmmedicine_PatientID_fkey` FOREIGN KEY (`PatientID`) REFERENCES `patients`(`PatientID`) ON DELETE RESTRICT ON UPDATE CASCADE;
