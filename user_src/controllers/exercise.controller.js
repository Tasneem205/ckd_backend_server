import { Router} from "express";
const exerciseRouter = new Router();

import allExercise from "../services/exercise.services/get.services.js";
import updateExercise from "../services/exercise.services/put.services.js";

exerciseRouter.get("/", allExercise);
exerciseRouter.put("/:id", updateExercise);

export default exerciseRouter;