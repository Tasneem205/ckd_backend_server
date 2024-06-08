import joi from "joi";

const exerciseSchema = joi.object({
    Excercise: joi.number(),
});
export default exerciseSchema;