import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";
import progressschema from "../../schemas/dailyservice.schema.js";

const prisma = new PrismaClient();

const dailyProgress = async (req, res, next) => {
    try {
        const now = new Date();
        const dateString = now.toISOString();
        const entry = await prisma.dailyProgress.create({
            data: {
                ProgressDate: dateString,
                PatientID: +req.params.id,
                WaterML: 0,
                WalkingTime : 0,
                WalkingSteps: 0,
                Excercise: 0
            }
          });
          return responses.success(res, "a new entry added successfully", entry);
    } catch (error) {
        console.log(error);
        next();
    }
};
export default dailyProgress;
