const Joi = require('@hapi/joi');

module.exports = {
  register (req, res, next) {
    const schema = Joi.object({
      email: Joi.string().email(),
      password: Joi.string().min(6).max(32),
      role: Joi.string()
    })

    const {error} = schema.validate(req.body)

    if (error) {
      switch (error.details[0].context.key) {
        case 'email':
          res.status(400).send({
            error: 'You must provide a valid email address'
          })
          break
        case 'password':
          res.status(400).send({
            error: `The password provided failed to match the following rules:
              <br>
              1. It must be at least 6 characters in length and not greater than 32 characters in length.
            `
          })
          break
        default:
          res.status(400).send({
            error: 'Invalid registration information'
          })
      }
    } else {
      next()
    }
  }
}