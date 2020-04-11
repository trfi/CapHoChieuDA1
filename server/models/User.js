const bcrypt = require('bcrypt');

function hashPassword (user, options) {
  const saltRounds = 8
  if (!user.changed('password')) {
    return
  }
  return bcrypt.hash(user.password, saltRounds).then(function(hash) {
    console.log(user.password);
    console.log(hash);
    user.setDataValue('password', hash)
  });
}

module.exports = (sequelize, DataTypes) => {
  const User = sequelize.define('user', {
    id: {
      type: DataTypes.UUID,
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
      type: DataTypes.STRING,
      required: true
    },
    role_id: {
      type: DataTypes.INTEGER,
      required: true,
      allowNull: false
    }
  },
  {
    underscored: true
  },
  {
    hooks: {
      //beforeCreate: hashPassword,
      //beforeUpdate: hashPassword,
      beforeSave: hashPassword
    }
  }
  )

  User.prototype.comparePassword = function (password) {
    return bcrypt.compare(password, this.password);
  }
  User.associate = function (models) {}
  return User
}