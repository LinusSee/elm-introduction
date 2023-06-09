const { v4: uuidv4 } = require('uuid');

const express = require('express');
const cors = require('cors');
const app = express();

const port = 8080;



app.use(cors());


app.post('/users', (req, res) => {
	response = { "id": uuidv4() }
	res.send(response)
});



app.listen(port, () => {
	console.log(`App running at port ${port}`);
});
