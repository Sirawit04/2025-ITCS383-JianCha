const mysql = require('mysql2/promise');
require('dotenv').config();

const pool = mysql.createPool({
  host: process.env.DB_HOST || 'localhost',
  port: process.env.DB_PORT || 3306,
  user: process.env.DB_USER || 'jiancha',
  password: process.env.DB_PASSWORD || 'jianchapassword',
  database: process.env.DB_NAME || 'jiancha_car_rental',
  waitForConnections: true,
  connectionLimit: 10
});

module.exports = pool;
