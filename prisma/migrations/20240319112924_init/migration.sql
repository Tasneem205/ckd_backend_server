/*
  Warnings:

  - You are about to drop the column `phonenumber` on the `assistant` table. All the data in the column will be lost.
  - You are about to drop the column `ProgressData` on the `dailyprogress` table. All the data in the column will be lost.
  - Added the required column `Phone_num` to the `Assistant` table without a default value. This is not possible if the table is not empty.
  - Added the required column `ProgressDate` to the `DailyProgress` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `assistant` DROP COLUMN `phonenumber`,
    ADD COLUMN `Phone_num` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `dailyprogress` DROP COLUMN `ProgressData`,
    ADD COLUMN `ProgressDate` DATETIME(3) NOT NULL;
