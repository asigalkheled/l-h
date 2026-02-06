const express = require('express')
const app = express()
const port = 3000

const dotenv = require("dotenv")
dotenv.config()

const mongoose = require('mongoose');

mongoose.connect(process.env.MONOG_URI)
  .then(() => console.log('Connected!'))
  .catch((error) => console.log("error", error))

app.get('/', (req, res) => {
  res.send('lab 5')
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})