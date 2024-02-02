'use strict';

exports.shorthands = undefined;

const path = require('path');

const auth = () => {
  let validate = async (req, res, next) => {
    if (typeof req.headers['x-access-token'] != 'undefined') {
      var token_string = req.headers['x-access-token'];
      // verifico la palabra secreta y si el token de seguridad no ha expirado

      if (token_string != 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9')
        res.status(401).json({ success: false, message: 'Error al validar el token de seguridad' });
      else next();
    } else res.status(401).json({ success: false, message: 'El token de seguridad no se ha proporcionado' });
  };
  return validate;
};

module.exports = auth;
