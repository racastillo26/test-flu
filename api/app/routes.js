'use strict';

module.exports = (app) => {
  const path = require('path');
  const users = require(path.join(__basedir, 'app/routes/users_routes.js'));
  users(app);
};
