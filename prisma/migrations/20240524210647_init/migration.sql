/*
  Warnings:

  - Added the required column `days` to the `alarmmedicine` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `alarmmedicine` ADD COLUMN `days` VARCHAR(191) NOT NULL;
