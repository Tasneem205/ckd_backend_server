import { Router } from 'express'; 

import historyRouter from './history.controller.js';
import diabetesRouter from './diabetes.controller.js';
import pressureRouter from './pressure.controller.js';
import medicineRouter from './medicine.controller.js';
import waterRouter from './water.controller.js';
import walkingRouter from './walking.controller.js';
import exerciseRouter from './exercise.controller.js';
import homeRouter from './home.controller.js';
import registrationRouter from './registration.controller.js';
import dailyProgress from "../services/dailyservices/post.service.js";

const indexRouter = new Router();

indexRouter.post("/newDay/:id", dailyProgress);

indexRouter.use("/history", historyRouter);

indexRouter.use("/diabetes", diabetesRouter);

indexRouter.use("/pressure", pressureRouter);

indexRouter.use("/medicine", medicineRouter);

indexRouter.use("/water",waterRouter);

indexRouter.use("/walking", walkingRouter);

indexRouter.use("/exercise", exerciseRouter);

indexRouter.use("/home", homeRouter);

indexRouter.use("/registration",registrationRouter);

export default indexRouter;