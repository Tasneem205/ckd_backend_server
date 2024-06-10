import joi from "joi";

const addMedicine = joi.object({
    medicine_name: joi.string().required(),
    time: joi.string().regex(/^(0[1-9]|1[0-2]):[0-5][0-9](am|pm)$/).required(),
    dosage: joi.string().required(),
    days: joi.array().items(joi.string().valid('sat', 'sun', 'mon', 'tue', 'wed', 'thu', 'fri')).required()
});


export default addMedicine;