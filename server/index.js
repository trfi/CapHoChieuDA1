const express = require('express')
const bodyParser = require('body-parser')
const cors = require('cors')
const morgan = require('morgan')
const config = require('./config/config')
const router = require('./routes/routes')
const {sequelize} = require('./models')

const app = express()
app.use(morgan('combined'))
app.use(bodyParser.json())
app.use(cors())
app.use(router)

require('./passport')

sequelize.sync({force: false})
  .then(() => {
    console.log('Database sync successfully')
  })
  .catch(err => console.log('Oooh, did you enter wrong database credentials?'));

app.listen(config.port, function() {
  console.log(`Express is running on port ${config.port}`);
});