import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";
import exerciseSchema from "../../schemas/exercise.schema.js";


const prisma = new PrismaClient();

const updateExercise = async (req, res, next) => {
    try {
        const { error, value } = exerciseSchema.validate(req.body);
        if (error) return responses.badRequest(res, error);
        const { Excercise } = value;
        const allExercise = await prisma.dailyProgress.findMany({
            where: {PatientID: +req.params.id},
            select: {ProregressID:true, ProgressDate:true, Excercise:true}
        });
        const today = new Date;
        const todayString = today.toISOString();
        for (let i = 0; i < allExercise.length; i++) {
            if (String(todayString)[8] === String(allExercise[i].ProgressDate)[8] &&
                String(todayString)[9] === String(allExercise[i].ProgressDate)[9]) {
                const UpdateExercise = await prisma.dailyProgress.update({
                    where: {
                        ProregressID: allExercise[i].ProregressID,
                    },
                    data: { Excercise: {increment: Excercise} },
                });
                return responses.success(res, "water edited successfully", UpdateExercise);
            }
        }
        return responses.notFound(res, "entry not found");
    } catch (error) {
        console.log(error);
        next();
    }
};

export default updateExercise;

