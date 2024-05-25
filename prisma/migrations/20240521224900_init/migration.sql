/*
  Warnings:

  - The primary key for the `alarmmedicine` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- AlterTable
ALTER TABLE `alarmmedicine` DROP PRIMARY KEY,
    MODIFY `time` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`PatientID`, `time`);
