const express = require('express')
const app = express()
const port = 3000
const bodyParser = require('body-parser')
const urlencodedParser = bodyParser.urlencoded({ extended: false })
const hostname = '127.0.0.1';

app.use(express.static('public'))
app.use(express.json())

// respond with "hello world" when a GET request is made to the homepage
app.get('/project/python', (req, res) => {
    res.statusCode = 200;
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.json(
        {"name": "Python project", 
        "description": "Creation of a personal finance management program. With  this application, it is possible to record all the users income and expenses, generating graphs and reports that allow a better visualization of the budget. The development of this project requires knowledge in python, manipulation of databases and creation of graphical interfaces.",
        "Area": "Automations",
        "Positions": "Back-end",
        "Duration": "14/02/23 à 25/03/23",
        "Team": "Angela K., Gabriel F., Marcio H.",
        "Attachments": null,
        "Question": "Why would you like to participate in the project?", "Technologies": "Python, AI, Database"});
})

app.post('/login', (req, res) => {
    const {username, password} = req.body;

    if (username === 'admin' && password === 'senha') {
        res.send('Login bem-sucedido!');
      } else {
        res.send('Nome de usuário ou senha inválidos!');
        }
})

app.get('/feed', (req, res) => {
    res.statusCode = 200;
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.json(
        {"publiName": "Machine Larning for medicine", 
        "publiDate": "03/09/2023",
        "link":"https://www.youtube.com/watch?v=dQw4w9WgXcQ&ab_channel=RickAstley",
        "skills": {
            "skill1": "Python",
            "skill2": "AI",
            "skill3": "Automation"
        },
        "Profile":{
            "name": "Sofia Pimazzoni",
            "photo": "sofia.png",
        }
        });
})


app.listen(port, hostname, () => {
    console.log(`Server running at http://${hostname}:${port}/`);
  });


app.post('/project/python', urlencodedParser, (req, res) => {
    res.statusCode = 201;
    let data = req.body;
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.json({"answer": data.answer})

})