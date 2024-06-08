import { PrismaClient } from "@prisma/client";
import responses from "../../helpers/responses.js";

const prisma = new PrismaClient();

const allExercise = async (req, res, next) => {
    try {
        const exercise = await prisma.video.findMany({});
        return responses.success(res, "All exercises", exercise);
    } catch (error) {
        console.log(error);
        next();
    }
};

export default allExercise;