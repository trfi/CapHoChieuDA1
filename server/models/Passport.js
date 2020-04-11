module.exports = (sequelize, DataTypes) => {
  const Passport = sequelize.define('passport', {
    id_congdan: {
      type: DataTypes.INTEGER,
    },
    id_admin: {
      type: DataTypes.INTEGER,
    },
    hoten: {
      type: DataTypes.STRING,
    },
    hinh: {
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
    ngaycap: {
      type: DataTypes.DATEONLY,
    },
    noicap: {
      type: DataTypes.STRING,
    },
    dantoc: {
      type: DataTypes.STRING,
    },
    tongiao: {
      type: DataTypes.STRING,
    },
    sodienthoai: {
      type: DataTypes.STRING,
    },
    email: {
      type: DataTypes.STRING,
    },
    dcthuongtru: {
      type: DataTypes.STRING,
    },
    quanhuyen: {
      type: DataTypes.STRING,
    },
    dcchitiet: {
      type: DataTypes.STRING,
    },
    dctamtru: {
      type: DataTypes.STRING,
    },
    quanhuyen_tt: {
      type: DataTypes.STRING,
    },
    dcchitiet_tt: {
      type: DataTypes.STRING,
    },
    nghenghiep: {
      type: DataTypes.STRING,
    },
    tendccoquan: {
      type: DataTypes.STRING,
    },
    hoten_cha: {
      type: DataTypes.STRING,
    },
    ngaysinh_cha: {
      type: DataTypes.DATEONLY,
    },
    hoten_me: {
      type: DataTypes.STRING,
    },
    ngaysinh_me: {
      type: DataTypes.DATEONLY,
    },
    hoten_vc: {
      type: DataTypes.STRING,
    },
    ngaysinh_vc: {
      type: DataTypes.DATEONLY,
    },
    tinhtrang: {
      type: DataTypes.STRING,
    },
    hansudung: {
      type: DataTypes.DATEONLY,
    },
    tinhtranghsd: {
      type: DataTypes.STRING,
    },
  })
  Passport.associate = function (models) {}
  return Passport
}
// create table with Passport model
// Passport.sync()
//   .then(() => console.log('Passport table created successfully'))
//   .catch(err => console.log('oooh, did you enter wrong database credentials?'));
