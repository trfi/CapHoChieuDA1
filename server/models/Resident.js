module.exports = (sequelize, DataTypes) => {
  const Resident = sequelize.define('Resident', {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true
    },
    hoten: {
      type: DataTypes.STRING,
    },
    gioitinh: {
      type: DataTypes.STRING,
    },
    ngaysinh: {
      type: DataTypes.DATEONLY,
    },
    noisinh: {
      type: DataTypes.STRING,
    },
    cmnd: {
      type: DataTypes.INTEGER,
    },
    dcthuongtru: {
      type: DataTypes.STRING,
    },
    quanhuyen: {
      type: DataTypes.STRING,
    },
  },
  {
    underscored: true
  }
  )

  Resident.associate = function (models) {

  }
  return Resident
}