const bcrypt = require('bcrypt');

function hashPassword (User, options) {
  const saltRounds = 8
  if (!User.changed('password')) {
    return
  }
  return bcrypt.hash(User.password, saltRounds).then(function(hash) {
    User.setDataValue('password', hash)
  });
}

module.exports = (sequelize, DataTypes) => {
  const User = sequelize.define('User', {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    email: {
      type: DataTypes.STRING,
      unique: true,
      required: true,
      len: [7, 100],
      isEmail: true
    },
    password: {
      type: DataTypes.STRING
    },
    role_id: {
      type: DataTypes.INTEGER,
      required: true,
      allowNull: false
    }
  },
  {
    hooks: {
      beforeCreate: hashPassword,
      //beforeUpdate: hashPassword,
      //beforeSave: hashPassword
    }
  }
  )

  User.prototype.comparePassword = function (password) {
    return bcrypt.compare(password, this.password);
  }
  User.associate = function (models) {
    
  }
  return User
}