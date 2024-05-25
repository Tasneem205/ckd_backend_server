/*
  Warnings:

  - Added the required column `rc` to the `kidney_test` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `kidney_test` ADD COLUMN `rc` DOUBLE NOT NULL;
