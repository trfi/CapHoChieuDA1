module.exports = (sequelize, DataTypes) => {
  const Role = sequelize.define('Role', {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true
    },
    role: {
      type: DataTypes.STRING,
      required: true,
      allowNull: false
    }
  },
  {
    underscored: true
  }
  )

  Role.associate = function (models) {

  }
  return Role
}