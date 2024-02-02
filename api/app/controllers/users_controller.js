'use strict';

const path = require('path');
let Controller = {};
var Model = require(path.join(__basedir, 'app/models/users_model'));
const joi = require('joi-plus');

Controller.Get_Users = (req, res, next) => {
  Model.Get_Users(req, (err, response) => {
    if (err) res.status(500).json({ status: 500, success: false, error: err });
    else res.status(response.status).json(response);
  });
};

Controller.Save_User = (req, res, next) => {
  joi.object({}).validate({});
  Model.Save_User(req, (err, response) => {
    if (err) res.status(500).json({ status: 500, success: false, error: err });
    else res.status(response.status).json(response);
  });
};

Controller.Update_Users = (req, res, next) => {
  Model.Update_Users(req, (err, response) => {
    if (err) res.status(500).json({ status: 500, success: false, error: err });
    else res.status(response.status).json(response);
  });
};

Controller.Delete_Users = (req, res, next) => {
  Model.Delete_Users(req, (err, response) => {
    if (err) res.status(500).json({ status: 500, success: false, error: err });
    else res.status(response.status).json(response);
  });
};

module.exports = Controller;
