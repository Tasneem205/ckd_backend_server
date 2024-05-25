/*
  Warnings:

  - You are about to drop the column `htl` on the `kidney_test` table. All the data in the column will be lost.
  - You are about to alter the column `bp` on the `kidney_test` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Double`.
  - You are about to alter the column `sg` on the `kidney_test` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Double`.
  - You are about to alter the column `al` on the `kidney_test` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Int`.
  - You are about to alter the column `su` on the `kidney_test` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Double`.
  - You are about to alter the column `test_class` on the `kidney_test` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Int`.
  - Added the required column `htn` to the `kidney_test` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `kidney_test` DROP COLUMN `htl`,
    ADD COLUMN `htn` VARCHAR(191) NOT NULL,
    MODIFY `bp` DOUBLE NOT NULL,
    MODIFY `sg` DOUBLE NOT NULL,
    MODIFY `al` INTEGER NOT NULL,
    MODIFY `su` DOUBLE NOT NULL,
    MODIFY `test_class` INTEGER NOT NULL;
