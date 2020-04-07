const express = require('express')
const router = express.Router()
const passport = require('../controllers/PassportControllers')
const AuthenticationController = require('../controllers/AuthenticationController')
const AuthenticationControllerPolicy = require('../policies/AuthenticationControllerPolicy')

router.get('/', function(req, res) {
  res.json({ message: 'Express is up!' });
});
router.get('/passport', passport.view)
router.post('/passport', passport.createNew)
router.post('/register', AuthenticationControllerPolicy.register, AuthenticationController.register)
router.post('/login', AuthenticationController.login)

module.exports = router;