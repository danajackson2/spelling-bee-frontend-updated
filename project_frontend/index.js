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
const container = document.getElementById("container");

function makeRows(rows, cols) {
  container.style.setProperty('--grid-rows', rows);
  container.style.setProperty('--grid-cols', cols);
  for (c = 0; c < (rows * cols); c++) {
    let cell = document.createElement("div");
    cell.innerText = Math.floor(Math.random() * 3) + 1
    cell.id = c;
    // cell.style.width = '100%' ;
    // cell.style.height = '100%';

    if (cell.innerText == '1'){
        cell.style.backgroundColor = '#f2f2f2';
        cell.style.color = 'black'
        cell.style.fontSize = '30px'
    }
    else if(cell.innerText == '2'){
        cell.style.backgroundColor = '#595959';
        cell.style.color = 'white'
        cell.style.fontSize = '30px'
    }
    else if
    (cell.innerText == '3'){
        cell.style.backgroundColor = '#000000'
        cell.style.color = 'white'
        cell.style.fontSize = '30px'
    }
    container.appendChild(cell).className = "grid-item";
  };
};



makeRows(6,6);

const FULL_DASH_ARRAY = 283;
const WARNING_THRESHOLD = 10;
const ALERT_THRESHOLD = 5;

const COLOR_CODES = {
  info: {
    color: "green"
  },
  warning: {
    color: "orange",
    threshold: WARNING_THRESHOLD
  },
  alert: {
    color: "red",
    threshold: ALERT_THRESHOLD
  }
};

const TIME_LIMIT = 20;
let timePassed = 0;
let timeLeft = TIME_LIMIT;
let timerInterval = null;
let remainingPathColor = COLOR_CODES.info.color;

document.getElementById("app").innerHTML = `
<div class="base-timer">
  <svg class="base-timer__svg" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
    <g class="base-timer__circle">
      <circle class="base-timer__path-elapsed" cx="50" cy="50" r="20"></circle>
      <path
        id="base-timer-path-remaining"
        stroke-dasharray="283"
        class="base-timer__path-remaining ${remainingPathColor}"
        d="
          M 50, 50
          m -20, 0
          a 20,20 0 1,0 40,0
          a 20,20 0 1,0 -40,0
        "
      ></path>
    </g>
  </svg>
  <span id="base-timer-label" class="base-timer__label">${formatTime(
    timeLeft
  )}</span>
</div>
`;

startTimer();

function onTimesUp() {
  clearInterval(timerInterval);
}

function startTimer() {
  timerInterval = setInterval(() => {
    timePassed = timePassed += 1;
    timeLeft = TIME_LIMIT - timePassed;
    document.getElementById("base-timer-label").innerHTML = formatTime(
      timeLeft
    );
    setCircleDasharray();
    setRemainingPathColor(timeLeft);

    if (timeLeft === 0) {
      onTimesUp();
    }
  }, 1000);
}

function formatTime(time) {
  const minutes = Math.floor(time / 60);
  let seconds = time % 60;

  if (seconds < 10) {
    seconds = `0${seconds}`;
  }

  return `${minutes}:${seconds}`;
}

function setRemainingPathColor(timeLeft) {
  const { alert, warning, info } = COLOR_CODES;
  if (timeLeft <= alert.threshold) {
    document
      .getElementById("base-timer-path-remaining")
      .classList.remove(warning.color);
    document
      .getElementById("base-timer-path-remaining")
      .classList.add(alert.color);
  } else if (timeLeft <= warning.threshold) {
    document
      .getElementById("base-timer-path-remaining")
      .classList.remove(info.color);
    document
      .getElementById("base-timer-path-remaining")
      .classList.add(warning.color);
  }
}

function calculateTimeFraction() {
  const rawTimeFraction = timeLeft / TIME_LIMIT;
  return rawTimeFraction - (1 / TIME_LIMIT) * (1 - rawTimeFraction);
}

function setCircleDasharray() {
  const circleDasharray = `${(
    calculateTimeFraction() * FULL_DASH_ARRAY
  ).toFixed(0)} 283`;
  document
    .getElementById("base-timer-path-remaining")
    .setAttribute("stroke-dasharray", circleDasharray);
}
