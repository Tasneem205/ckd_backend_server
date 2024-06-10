import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";

const prisma = new PrismaClient();

const getMedicine = async (req, res, next) => {
    try {
        const medicine = await prisma.alarmmedicine.findMany({
            where: {
                PatientID : +req.params.id
            } 
        });
        let med = {0: {}, 1: {}, 2: {}, 3: {}, 4: {}, 5: {}, 6: {}};
        for (let j = 0; j < 7; j++) {
            for (let i = 0; i < medicine.length; i++) {
                if (medicine[i].days[j] === "1") {
                    if (med[j].hasOwnProperty(medicine[i].time)) {
                        med[j][medicine[i].time].push(medicine[i]);
                    } else {
                        med[j][medicine[i].time] = [medicine[i]];
                    }
                }
            }
        }
        return responses.success(res, "There are your medicines", med);
    } catch (error) {
        console.log(error);
        next();
    }
};

export default getMedicine;