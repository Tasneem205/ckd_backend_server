/*
  Warnings:

  - You are about to alter the column `rbc` on the `kidney_test` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Double`.
  - You are about to alter the column `pc` on the `kidney_test` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Double`.
  - You are about to alter the column `pcc` on the `kidney_test` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Double`.
  - You are about to alter the column `ba` on the `kidney_test` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Double`.
  - You are about to alter the column `dm` on the `kidney_test` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Double`.
  - You are about to alter the column `cad` on the `kidney_test` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Double`.
  - You are about to alter the column `appet` on the `kidney_test` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Double`.
  - You are about to alter the column `pe` on the `kidney_test` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Double`.
  - You are about to alter the column `ane` on the `kidney_test` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Double`.
  - You are about to alter the column `test_class` on the `kidney_test` table. The data in that column could be lost. The data in that column will be cast from `Int` to `Double`.
  - You are about to alter the column `htn` on the `kidney_test` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Double`.

*/
-- AlterTable
ALTER TABLE `kidney_test` MODIFY `rbc` DOUBLE NULL,
    MODIFY `pc` DOUBLE NULL,
    MODIFY `pcc` DOUBLE NULL,
    MODIFY `ba` DOUBLE NULL,
    MODIFY `dm` DOUBLE NULL,
    MODIFY `cad` DOUBLE NULL,
    MODIFY `appet` DOUBLE NULL,
    MODIFY `pe` DOUBLE NULL,
    MODIFY `ane` DOUBLE NULL,
    MODIFY `test_class` DOUBLE NULL,
    MODIFY `htn` DOUBLE NULL;
