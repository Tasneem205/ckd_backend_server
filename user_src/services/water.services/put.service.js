import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";
import waterSchema from "../../schemas/water.schema.js";

const prisma = new PrismaClient();

const updatewater = async (req, res, next) => {
    try {
        const { error, value } = waterSchema.validate(req.body);
        if (error) return responses.badRequest(res, error);
        const { WaterML } = value;
        const allWater = await prisma.dailyProgress.findMany({
            where: {PatientID: +req.params.id},
            select: {ProregressID:true, ProgressDate:true, WaterML:true}
        });
        const today = new Date;
        console.log(String(today));
        const todayString = today.toISOString();
        for (let i = 0; i < allWater.length; i++) {
            console.log(String(allWater[i].ProgressDate)[8], String(allWater[i].ProgressDate)[9]);
            if (String(todayString)[8] === String(allWater[i].ProgressDate)[8] && String(todayString)[9] === String(allWater[i].ProgressDate)[9]) {
                const Updatewater = await prisma.dailyProgress.update({
                    where: {
                        ProregressID: allWater[i].ProregressID,
                    },
                    data: { WaterML: {increment: WaterML} },
                });
                return responses.success(res, "water edited successfully", Updatewater);
            }
        }
        return responses.notFound(res, "entry not found");
    } catch (error) {
        console.log(error);
        next();
    }
};

export default updatewater;