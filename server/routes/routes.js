const express = require('express')
const router = express.Router()
const passport = require('../controllers/PassportControllers')
const AuthenticationController = require('../controllers/AuthenticationController')
const AuthenticationControllerPolicy = require('../policies/AuthenticationControllerPolicy')


router.post('/passport', passport.view)
router.get('/passport/:status', passport.viewByStatus)
router.post('/passport/apply', passport.createNew)
router.post('/register', AuthenticationControllerPolicy.register, AuthenticationController.register)
router.post('/login', AuthenticationController.login)
router.post('/passport/authenticate/:id', passport.authenticate)
router.post('/passport/approve/:id', passport.approve)
router.post('/passport/archive/:id', passport.archive)
router.post('/passport/lookup', passport.lookup)

module.exports = router;