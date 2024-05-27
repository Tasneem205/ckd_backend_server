import { PrismaClient } from "@prisma/client";
import responses from "../helpers/responses.js";

const prisma = new PrismaClient();

const history = async (req, res, next) => {
    try {
        const Diabetes = await prisma.diabetes.findMany({
            where: { PatientID: +req.params.id },
            select: {diabetes_value: true}
        });
        const diabetes_values = [];
        for (let i = 0; i < Diabetes.length; i++) {
            diabetes_values.push(Diabetes[i].diabetes_value);
        }
        const Pressure = await prisma.pressure.findMany({
            where: { PatientID: +req.params.id }
        });
        const pressureHigh_values = [];
        const pressureLow_values = [];
        for (let i = 0; i < Pressure.length; i++) {
            pressureHigh_values.push(Pressure[i].pressureHigh);
            pressureLow_values.push(Pressure[i].pressureLow);
        }
        const exercise = await prisma.dailyProgress.findMany({
            where: { PatientID: +req.params.id },
            select: { Excercise:true }
        });
        const excercise_values = [];
        for (let i = 0; i < exercise.length; i++) {
            excercise_values.push(exercise[i].Excercise);
        }
        const water = await prisma.dailyProgress.findMany({
            where: { PatientID: +req.params.id },
            select:{ WaterML:true}
        });
        const water_values = [];
        for (let i = 0; i < water.length; i++) {
            water_values.push(water[i].WaterML);
        }
        const walking = await prisma.dailyProgress.findMany({
            where: { PatientID: +req.params.id },
            select:{
                WalkingSteps: true,
                WalkingTime: true
            }
        });
        const walkingSteps_values = [];
        const walkingTime_values = [];
        for (let i = 0; i < walking.length; i++) {
            walkingSteps_values.push(walking[i].WalkingSteps);
            walkingTime_values.push(walking[i].walkingTime);
        }
        const data = {
            diabetes_values,
            pressureHigh_values,
            pressureLow_values,
            excercise_values,
            walkingSteps_values,
            walkingTime_values,
            water_values
        }

        return responses.success(res, "Success graphs",data);
    } catch (error) {
        console.log(error);
        next();
    }
};


export default history;