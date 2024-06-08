import joi from "joi";

const walkingSchema = joi.object({
    time: joi.number(),
    steps: joi.number()
});
export default walkingSchema;
