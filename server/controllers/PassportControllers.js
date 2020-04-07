const Passport = require('../models/PassportModels')


// exports.passport = function(req, res, next) {
//   Passport.create(req.body)
//   .then(user =>
//     res.json({ user, msg: 'Passport account created successfully' })
//   );
// }

module.exports = {
  async createNew(req, res, next) {
    Passport.create(req.body)
    .then(passport =>
      res.json({ passport, msg: 'Passport account created successfully' })
    )
  },
  async view(req, res, next) {
    Passport.findAll()
    .then(passports =>
      res.json(passports)
    )
  }
}