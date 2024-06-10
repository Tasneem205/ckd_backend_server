import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";
import medicineSchema from "../../schemas/medicine.schema.js";

const prisma = new PrismaClient();

const addMedicine = async (req, res, next) => {
    try {
        const { error, value } = medicineSchema.validate(req.body);
        if (error) return responses.badRequest(res, error);
        const { medicine_name, time, dosage, days} = value;
        let mySet = new Set(days);
        let daysNum = "";
        (mySet.has('sat')) ? daysNum += "1" : daysNum += "0";
        (mySet.has('sun')) ? daysNum += "1" : daysNum += "0";
        (mySet.has('mon')) ? daysNum += "1" : daysNum += "0";
        (mySet.has('tue')) ? daysNum += "1" : daysNum += "0";
        (mySet.has('wed')) ? daysNum += "1" : daysNum += "0";
        (mySet.has('thu')) ? daysNum += "1" : daysNum += "0";
        (mySet.has('fri')) ? daysNum += "1" : daysNum += "0";

        const entry = await prisma.alarmmedicine.create({
            data: {
                PatientID: +req.params.id,
                time,
                medicine_name,
                dosage,
                days: daysNum
            }
          });
          return responses.success(res,
              "medicine added successfully, Waiting for doctor to confirm",
              entry);
    } catch (error) {
        console.log(error);
        next();
    }
};


export default addMedicine;

