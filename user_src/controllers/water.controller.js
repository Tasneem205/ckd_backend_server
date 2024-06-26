 import { Router} from 'express'; 
const waterRouter = Router(); 
import updatewater from '../services/water.services/put.service.js';
import allWater from '../services/water.services/get.service.js';

waterRouter.get("/:id", allWater);
waterRouter.put("/:id", updatewater);

export default waterRouter;