const Sequelize = require('sequelize');

const sequelize = new Sequelize({
  host: '204.44.81.17',
  port: '3306',
  database: 'CapHoChieu',
  username: 'admin',
  password: 'Tt147369@',
  dialect: 'mysql',
  define: {
    charset: 'utf8mb4',
    collate: 'utf8mb4_general_ci'
  }
});
// check the databse connection
sequelize
  .authenticate()
  .then(() => console.log('Connection has been established successfully.'))
  .catch(err => console.error('Unable to connect to the database:', err));

module.exports = sequelize;