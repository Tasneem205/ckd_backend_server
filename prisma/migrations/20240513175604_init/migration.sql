-- AlterTable
ALTER TABLE `patients` MODIFY `DateOfBirth` TIME NOT NULL,
    MODIFY `Job` VARCHAR(191) NULL,
    MODIFY `bloodGroup` VARCHAR(191) NULL,
    MODIFY `hieght` DOUBLE NULL,
    MODIFY `weight` DOUBLE NULL,
    MODIFY `registrationDate` TIME NOT NULL,
    MODIFY `Phone` VARCHAR(191) NULL,
    MODIFY `image_path` VARCHAR(191) NULL;
