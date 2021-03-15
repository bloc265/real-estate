const express = require("express");
const morgan = require("morgan");
const dotenv = require("dotenv");
const app = express();
const connectDB = require("./config/db");

dotenv.config({
  path: "./config/config.env",
});

connectDB();

if (process.env.NODE_ENV == "development") {
  app.use(morgan("dev"));
}

const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(
    `Server started in ${process.env.NODE_ENV} on port ${process.env.PORT}`
  );
});
