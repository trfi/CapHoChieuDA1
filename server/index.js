const express = require('express')
const bodyParser = require('body-parser')
const cors = require('cors')
const morgan = require('morgan')
const config = require('./config/config')
const router = require('./routes/routes')

const app = express()
app.use(morgan('combined'))
app.use(bodyParser.json())
app.use(cors())
app.use(router)

require('./passport')

app.listen(config.port, function() {
  console.log(`Express is running on port ${config.port}`);
});