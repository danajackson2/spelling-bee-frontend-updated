//= require bootstrap
let user1 = ""
let user2 = ""

//API Calls
function getWords(){
    fetch('https://api.wordnik.com/v4/words.json/randomWords?hasDictionaryDef=true&maxCorpusCount=-1&minDictionaryCount=1&maxDictionaryCount=-1&minLength=5&maxLength=12&limit=25&api_key=cu7u7wkgtpw6qy1dk3dntx8j5mg44xqx87painf5jh5k8blrm')
    .then(res => res.json())
    .then(words => manageWords(words))
}

function getAudio(word){
    fetch(`https://api.wordnik.com/v4/word.json/${word}/audio?useCanonical=false&limit=50&api_key=cu7u7wkgtpw6qy1dk3dntx8j5mg44xqx87painf5jh5k8blrm`)
    .then(res => res.json())
    .then(object => {return object[0].fileUrl})
}

function getDefinition(word){
    fetch(`https://api.wordnik.com/v4/word.json/${word}/definitions?limit=200&includeRelated=false&sourceDictionaries=all&useCanonical=false&includeTags=false&api_key=cu7u7wkgtpw6qy1dk3dntx8j5mg44xqx87painf5jh5k8blrm`)
    .then(res => res.json())
    .then(object => {return object[1].text})
}

//Backend Fetches
const BASE_URL = 'http://localhost:3000'
const USERS_URL = `${BASE_URL}/users`
const GAMES_URL = `${BASE_URL}/games`
const SESSIONS_URL = `${BASE_URL}/sessions`

function newUser(e){
    e.preventDefault()
    document.getElementById('new-user-form').remove()
    fetch(USERS_URL, {
        method: 'POST',
        headers: {'content-type':'application/json'},
        body: JSON.stringify({
            name: e.target.querySelector('input').value,
        })
    })
    .then(res => res.json())
    .then(user => {
        if (user.id == null){
            alert('Username already taken.')
        } else {
            alert(`Player "${user.name}" has been created!`)
        }
    })
}

function login(e, num){
    e.preventDefault()
    let name = e.target.querySelector('input').value
    fetch(USERS_URL)
    .then(res => res.json())
    .then(users => {
        if (users.find(user => user.name === name) === undefined){
            alert("User does not exist.")
        } else {
            populateUser(name, num)
        }
    })
}

function newGame(u1, u2){
    fetch(GAMES_URL, {
        method: 'POST',
        headers: {'content-type':'application/json'},
        body: JSON.stringify({
            user1: u1,
            user2: u2
        })
    })
    .then(res => res.json())
    // .then(object => getWords())
}

//DOM Changes

function manageWords(words){
    words.forEach(word => {
        let url = getAudio(word)
        let def = getDefinition(word)
        populateBox(word, url, def)
    })        
}

function populateBox(word, url, def){
    //add elements to DOM
}

function newUserMenu(){
    if (!document.getElementById('new-user-form')){
        let form = document.createElement('form')
        form.id = 'new-user-form'
        let label = document.createElement('label')
        label.textContent = "Username: "
        let input = document.createElement('input')
        input.placeholder = "Joe Schmoe"
        let button = document.createElement('button')
        button.type = 'submit'
        button.textContent = "Submit"
        form.append(label, input, button)
        document.getElementById('new-user-div').appendChild(form)
        form.addEventListener('submit', newUser)
    }
}

function populateUser(name, num){
    //add username to left or right pane depending on which player they are
    //assign user1 or user2
}

//Event Listeners
document.getElementById('new-user-button').addEventListener('click', newUserMenu)
document.getElementById('player-1-login').addEventListener('submit', (e) => login(e, 1))
document.getElementById('player-2-login').addEventListener('submit', (e) => login(e, 2))
document.getElementById('new-game').addEventListener('click', () => newGame(user1, user2))