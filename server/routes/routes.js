const express = require('express')
const router = express.Router()
const passport = require('../controllers/PassportControllers')
const AuthenticationController = require('../controllers/AuthenticationController')
const AuthenticationControllerPolicy = require('../policies/AuthenticationControllerPolicy')
const path = require('path');

router.get('/', function(req, res) {
  res.sendFile('/client/dist/index.html', {root: '../'});
});
router.get('/passport', passport.view)
router.post('/passport', passport.createNew)
router.post('/register', AuthenticationControllerPolicy.register, AuthenticationController.register)
router.post('/login', AuthenticationController.login)

module.exports = router;