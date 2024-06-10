import { PrismaClient } from "@prisma/client";
import responses from "../helpers/responses.js";

const prisma = new PrismaClient();

const homepage = async (req, res, next) => {
    try {
        const today = await prisma.dailyProgress.findFirst({
            where: { PatientID: +req.params.id },
            orderBy: {ProgressDate: 'desc'}
        });
        const workoutWeek = await prisma.dailyProgress.findMany({
            where: { PatientID: +req.params.id },
            orderBy: { ProgressDate: 'desc' },
            select:{ Excercise:true}
        });
        console.log(workoutWeek);
        let sum = 0
        for (let i = 0; i < Math.min(7, workoutWeek.length); i++)
            sum += workoutWeek[i].Excercise;
        console.log(sum);
        let workoutHours = String(Math.floor(sum / 60)).padStart(2, '0');
        let workoutMinutes = String(sum % 60).padStart(2, '0');
        let workoutThisWeek = workoutHours + ":" + workoutMinutes
        const homeData = {
            today,
            workoutThisWeek
        }
        return responses.success(res, "Success for home", homeData);
    } catch (error) {
        console.log(error);
        next();
    }}

    export default homepage;