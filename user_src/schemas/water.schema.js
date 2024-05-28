import joi from "joi";

const waterSchema = joi.object({
    WaterML: joi.number()
});
export default waterSchema;