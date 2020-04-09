const Sequelize = require('sequelize')
const sequelize = require('../db')

const Passport = sequelize.define('passport', {
  id_congdan: {
    type: Sequelize.INTEGER,
  },
  id_admin: {
    type: Sequelize.INTEGER,
  },
  hoten: {
    type: Sequelize.STRING,
  },
  hinh: {
    type: Sequelize.STRING,
  },
  gioitinh: {
    type: Sequelize.STRING,
  },
  ngaysinh: {
    type: Sequelize.DATEONLY,
  },
  noisinh: {
    type: Sequelize.STRING,
  },
  cmnd: {
    type: Sequelize.INTEGER,
  },
  ngaycap: {
    type: Sequelize.DATEONLY,
  },
  noicap: {
    type: Sequelize.STRING,
  },
  dantoc: {
    type: Sequelize.STRING,
  },
  tongiao: {
    type: Sequelize.STRING,
  },
  sodienthoai: {
    type: Sequelize.STRING,
  },
  email: {
    type: Sequelize.STRING,
  },
  dcthuongtru: {
    type: Sequelize.STRING,
  },
  quanhuyen: {
    type: Sequelize.STRING,
  },
  dcchitiet: {
    type: Sequelize.STRING,
  },
  dctamtru: {
    type: Sequelize.STRING,
  },
  quanhuyen_tt: {
    type: Sequelize.STRING,
  },
  dcchitiet_tt: {
    type: Sequelize.STRING,
  },
  nghenghiep: {
    type: Sequelize.STRING,
  },
  tendccoquan: {
    type: Sequelize.STRING,
  },
  hoten_cha: {
    type: Sequelize.STRING,
  },
  ngaysinh_cha: {
    type: Sequelize.DATEONLY,
  },
  hoten_me: {
    type: Sequelize.STRING,
  },
  ngaysinh_me: {
    type: Sequelize.DATEONLY,
  },
  hoten_vc: {
    type: Sequelize.STRING,
  },
  ngaysinh_vc: {
    type: Sequelize.DATEONLY,
  },
  tinhtrang: {
    type: Sequelize.STRING,
  },
  hansudung: {
    type: Sequelize.DATEONLY,
  },
  tinhtranghsd: {
    type: Sequelize.STRING,
  },
});

// create table with Passport model
Passport.sync()
  .then(() => console.log('Passport table created successfully'))
  .catch(err => console.log('oooh, did you enter wrong database credentials?'));
  
module.exports = Passport;