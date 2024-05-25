/*
  Warnings:

  - Added the required column `reports` to the `name: homepageView` table without a default value. This is not possible if the table is not empty.
  - Added the required column `is_done` to the `reservations` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `name: homepageview` ADD COLUMN `reports` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `reservations` ADD COLUMN `is_done` BOOLEAN NOT NULL;
