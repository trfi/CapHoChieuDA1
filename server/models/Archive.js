module.exports = (sequelize, DataTypes) => {
    const Archive = sequelize.define('Archive', {
      id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true
      },
      passport_id: {
        type: DataTypes.INTEGER,
        required: true
      }
    },
    {
      underscored: true
    }
    )
  
    Archive.associate = function (models) {

    }
    return Archive
  }