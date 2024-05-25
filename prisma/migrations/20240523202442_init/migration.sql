/*
  Warnings:

  - You are about to drop the `alarmmedicine` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `alarmmedicine` DROP FOREIGN KEY `alarmmedicine_PatientID_fkey`;

-- DropTable
DROP TABLE `alarmmedicine`;
