const mongoose = require("mongoose");

const connectDB = async () => {
  try {
    mongoose.connect(
      process.env.DB_CONNECTION,
      {
        useUnifiedTopology: true,
        useNewUrlParser: true,
      },
      () => {
        console.log("Successfully connected to db");
      }
    );
  } catch (err) {
    console.error(err);
    process.exit(1);
  }
};

module.exports = connectDB;
