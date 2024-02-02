'use strict';
require('dotenv').config('.env');
const http = require('http');
const express = require('express');
const logger = require('morgan');
const bodyParser = require('body-parser');
const cors = require('cors');
const helmet = require('helmet');
var multipart = require('connect-multiparty');
var multipartMiddleware = multipart();

const compression = require('compression');
const app = express();
app.use(compression());

const hostname = process.env.API_HOST;
const port = process.env.API_PORT;

// Setting up express application
app.use(logger('dev'));

// Parse incoming requests data
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(multipartMiddleware);

app.use(function (error, req, res, next) {
  //Catch bodyParser error
  if (error) res.status(500).json({ status: 500, success: false, error: error.message });
  else next();
});

app.use(express.json());
app.use(helmet.frameguard());
const logRequestData = (req, res, next) => {
  console.log('*** Request registry***');
  console.log(`Date: ${new Date()}`);
  console.log(`Method: ${req.method}`);
  console.log(`URL: ${req.url}`);
  console.log(`Query params: ${JSON.stringify(req.query)}`);
  console.log(`Request body: ${JSON.stringify(req.body)}`);
  console.log('*****************************************\n');

  next();
};
app.use(logRequestData);
app.use(cors());
app.use((req, res, next) => {
  if (process.env.NODE_ENV === 'development') res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, PUT, POST, DELETE');
  res.setHeader('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
  next();
});

const server = http.createServer(app);
server.listen(port, hostname, () => console.log(`SERVER RUNNING AT http://${hostname}:${port}`));

//importing routes
var routes = require('./app/routes');

//register global directory
global.__basedir = __dirname;
routes(app);

app.get('/health', function (req, res) {
  res.json('Welcome to CEL API-REST');
});

app.use(function (req, res) {
  res.sendStatus(404);
  res.end();
});
