/*
  Warnings:

  - You are about to alter the column `rbc` on the `kidney_test` table. The data in that column could be lost. The data in that column will be cast from `Double` to `VarChar(191)`.

*/
-- AlterTable
ALTER TABLE `kidney_test` MODIFY `rbc` VARCHAR(191) NULL;
