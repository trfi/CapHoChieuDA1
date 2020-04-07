const {sequelize} = require('../models')
const Sequelize = require('sequelize')
const bcrypt = require('bcrypt');

function hashPassword (user, options) {
  const saltRounds = 8

  if (!user.changed('password')) {
    return
  }

  // return bcrypt.hash(user.password, saltRounds, function(err, hash) {
  //   user.setDataValue('password', hash)
  // });
  return bcrypt.hash(user.password, saltRounds).then(function(hash) {
    console.log(user.password);
    console.log(hash);
    user.setDataValue('password', hash)
  });
}

function hashPassword2() {
  bcrypt.hash(myPlaintextPassword, saltRounds, function(err, hash) {
    // Store hash in your password DB.
  });
}

const User = sequelize.define('user', {
  email: {
    type: Sequelize.STRING,
    unique: true
  },
  password: {
    type: Sequelize.STRING
  },
  role: {
    type: Sequelize.STRING
  }
},
{
  hooks: {
    //beforeCreate: hashPassword,
    //beforeUpdate: hashPassword,
    beforeSave: hashPassword
  }
})

User.prototype.comparePassword = function (password) {
  console.log(password)
  console.log(this.password)
  return bcrypt.compare(password, this.password);
}


module.exports = User;