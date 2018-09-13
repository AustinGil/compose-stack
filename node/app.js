const path = require("path");
require("dotenv").config({ path: path.join(__dirname, "../.env") });

const app = require("express")();
const bodyParser = require("body-parser");

// Middlewares
app.use(require("helmet")()); // security headers
app.use(require("compression")()); // compression
app.use(require("morgan")("dev")); // logging
app.use(require("cors")()); // CORS
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

// Routes
app.get("/", (req, res) => {
  res.send("Somewhere, something incredible is waiting to be known. <br> - Carl Sagan");
});
app.get("/health-check", (req, res) => res.sendStatus(200));
app.use("/platform", require("./api/routes/platform"));
app.use("/tournaments", require("./api/routes/tournaments"));
app.use("/rounds", require("./api/routes/rounds"));
app.use("/submissions", require("./api/routes/submissions"));
// app.use('/activity', require('./api/routes/activity'))
app.use("/token", require("./api/routes/token"));
app.use("/ipfs", require("./api/routes/ipfs"));

console.log("стремиться к победе");

// Error handling
app.use((req, res, next) => {
  const error = new Error("Not Found");
  error.status = 404;
  next(error);
});

app.use((error, req, res, next) => {
  res.status(error.status || 500);
  res.json({
    error: {
      message: error.message
    }
  });
});

module.exports = app;
