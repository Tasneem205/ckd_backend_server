import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";
import walkingSchema from "../../schemas/walking.schema.js";

const prisma = new PrismaClient();

const updateWalking = async (req, res, next) => {
    try {
        const { error, value } = walkingSchema.validate(req.body);
        if (error) return responses.badRequest(res, error);
        const { time, steps } = value;
        const allWalking = await prisma.dailyProgress.findMany({
            where: {PatientID: +req.params.id},
            select: {ProregressID:true, ProgressDate:true, WalkingTime:true, WalkingSteps:true}
        });
        const today = new Date;
        const todayString = today.toISOString();
        for (let i = 0; i < allWalking.length; i++) {
            if (String(todayString)[8] === String(allWalking[i].ProgressDate)[8] &&
                String(todayString)[9] === String(allWalking[i].ProgressDate)[9]) {
                const UpdateWalking = await prisma.dailyProgress.update({
                    where: {
                        ProregressID: allWalking[i].ProregressID,
                    },
                    data: { WalkingTime: {increment: time},
                            WalkingSteps: {increment: steps}},
                });
                return responses.success(res, "water edited successfully", UpdateWalking);
            }
        }
        return responses.notFound(res, "entry not found");
    } catch (error) {
        console.log(error);
        next();
    }
};

export default updateWalking;