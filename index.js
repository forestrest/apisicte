const  express = require('express');
const consign = require('consign');
const cors = require('cors');

const app = express();
app.use(express.json({limit: '50mb'}))
app.use(cors())

consign()
  .include('libs/middlewares.js')
  .then('routes')
  .include('libs/start_server.js')
  .into(app);