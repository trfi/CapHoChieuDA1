module.exports = (sequelize, DataTypes) => {
  const Role = sequelize.define('role', {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true
    },
    role_name: {
      type: DataTypes.STRING,
      required: true,
      allowNull: false
    }
  },
  {
    underscored: true
  }
  )

  Role.associate = function (models) {}
  return Role
}