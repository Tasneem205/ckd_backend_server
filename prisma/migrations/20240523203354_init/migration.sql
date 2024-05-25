-- CreateTable
CREATE TABLE `alarmmedicine` (
    `ID` INTEGER NOT NULL AUTO_INCREMENT,
    `PatientID` INTEGER NOT NULL,
    `time` VARCHAR(191) NOT NULL,
    `medicine_name` VARCHAR(191) NOT NULL,
    `dosage` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`ID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `alarmmedicine` ADD CONSTRAINT `alarmmedicine_PatientID_fkey` FOREIGN KEY (`PatientID`) REFERENCES `patients`(`PatientID`) ON DELETE RESTRICT ON UPDATE CASCADE;
