const express = require("express");
const router = express.Router();
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
const User = require("../models/User");

router.get("/", (req, res) => {
  res.send("Hello");
});

// @desc register router
// @route /api/
router.post("/register", async (req, res) => {
  try {
    const user = await User.findOne({ email: req.body.email });

    if (user) {
      res.send({ success: false, msg: "User already exist" });
    } else {
      const salt = await bcrypt.genSalt(10);
      const hash = await bcrypt.hash(req.body.password, salt);
      const new_user = new User({
        name: req.body.name,
        email: req.body.email,
        password: hash,
        role: req.body.role,
      });

      await new_user.save();
      res.send({ success: true, msg: "Account created successfully" });
    }
  } catch (err) {
    console.error(err);
  }
});

// @desc POST request to login
// @route /api/login
router.post("/login", (req, res) => {
  User.findOne(
    {
      email: req.body.email,
    },
    (err, user) => {
      if (err) throw err;
      if (!user) {
        res.send({ msg: "User does not exists" });
      } else {
        user.comparePassword(req.body.password, (err, isMatch) => {
          if (isMatch && !err) {
            let token = jwt.sign(user, process.env.SECRET);
            req.headers("authtoken", token);
            console.log(req.headers);
            res.json({ success: true, token: token });
          } else {
            res.send({ msg: "Password incorrect" });
          }
        });
      }
    }
  );
});

module.exports = router;
