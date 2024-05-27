import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";
import fs from "fs";

const prisma = new PrismaClient();

const deletePatient = async (req, res, next) => {
    try {
        const id = req.params.id;
        const deletedPatient = await prisma.patients.delete({
            where: { PatientID: +id }
        });
        if ("undefined image" != deletedPatient.image_path) {
            fs.unlink(deletedPatient.image_path, (err) => {
                if (err) {
                    console.error('Error deleting file:', err);
                    return;
                }
                console.log('File deleted successfully');
            });
        }
        return responses.success(res, "Patient deleted successfully", deletedPatient);
    } catch (error) {
        console.log(error);
        next();
    }
};

export default deletePatient;