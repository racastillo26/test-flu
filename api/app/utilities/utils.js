'use strict';

exports.shorthands = undefined;

module.exports = {
  Set_Response: (data, status_code = 200) => {
    let response = {
      status: status_code,
      success: status_code === 200,
      message: status_code == 200 ? 'success' : 'error',
      data: data
    };
    return response;
  }
};
