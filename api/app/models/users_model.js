require('dotenv').config('.env');
const path = require('path');
const utils = require(path.join(__basedir, 'app/utilities/utils'));

const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

class Model {
  static async Get_Users(req, result) {
    try {
      await prisma.users
        .findMany({
          select: {
            id: true,
            name: true,
            email: true,
            phone_number: true,
            created_at: true,
            updated_at: true
          },
          where: {
            deleted: false
          },
          orderBy: {
            name: 'desc'
          }
        })
        .then((users) => {
          return result(null, utils.Set_Response(users, 200));
        });
    } catch (err) {
      utils.Set_Response(err.message, 500);
    }
  }

  static async Save_User(req, result) {
    try {
      await prisma.users
        .create({
          data: {
            email: req.body.email,
            name: req.body.name,
            phone_number: req.body.phone_number,
            created_at: new Date(),
            updated_at: new Date()
          }
        })
        .then((users) => {
          return result(null, utils.Set_Response('Ok', 200));
        });
    } catch (err) {
      utils.Set_Response(err.message, 500);
    }
  }

  static async Update_User(req, result) {
    try {
      await prisma.users.create({
        where: { id: Number(req.params.id) },
        data: {
          email: req.body.email,
          name: req.body.name,
          phone_number: req.body.phone_number,
          updated_at: new Date()
        }
      });
    } catch (err) {
      utils.Set_Response(err.message, 500);
    }
  }

  static async Delete_User(req, result) {
    try {
      await prisma.users.update({
        where: { id: Number(req.params.id) },
        data: {
          deleted: true
        }
      });
    } catch (err) {
      utils.Set_Response(err.message, 500);
    }
  }
}

module.exports = Model;
