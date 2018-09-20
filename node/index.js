const app = require("express")();
const bodyParser = require("body-parser");

app.use(require("helmet")());
app.use(require("cors")());
app.use(require("morgan")("dev"));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));

app.get("/", (request, response) => {
  response.json({
    response: "hello world"
  });
});
app.get("/health-check", (req, res) => res.sendStatus(200));

const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`Listening on port: ${port}`);
});
