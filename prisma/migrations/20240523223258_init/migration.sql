/*
  Warnings:

  - A unique constraint covering the columns `[Email]` on the table `patients` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX `patients_Email_key` ON `patients`(`Email`);
