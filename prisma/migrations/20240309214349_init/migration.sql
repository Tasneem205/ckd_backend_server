/*
  Warnings:

  - Added the required column `phonenumber` to the `Assistant` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `assistant` ADD COLUMN `phonenumber` VARCHAR(191) NOT NULL;
