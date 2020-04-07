const Sequelize = require('sequelize')
const db = {}

const sequelize = new Sequelize({
  host: 'localhost',
  port: '3307',
  database: 'caphochieu',
  username: 'root',
  password: '',
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

db.sequelize = sequelize
db.Sequelize = Sequelize

module.exports = db