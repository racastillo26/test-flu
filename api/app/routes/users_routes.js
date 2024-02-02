'use strict';

module.exports = (app) => {
  var router = require('express').Router();
  const path = require('path');
  const auth = require(path.join(__basedir, 'app/middleware/auth'));

  const controller = require(path.join(__basedir, 'app/controllers/users_controller'));
  router.route('/v1/users').get(auth(), controller.Get_Users).post(auth(), controller.Save_User);
  router.route('/v1/users/:id').put(auth(), controller.Update_Users).post(auth(), controller.Delete_Users);
  app.use('/api', router);
};
