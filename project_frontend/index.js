//= require bootstrap

const container = document.getElementById("container");

function addEventListeners(){
    let rulesnav = document.getElementsByClassName('rulesnav')[0]
    let closeBtn = document.getElementsByClassName('close')[0]
    rulesnav.addEventListener('click',() => showRules())
    closeBtn.addEventListener('click',() => hideRules())
}

function showRules(){
    let rules = document.getElementById('rules')
    rules.style.display = 'block'
}

function hideRules(){
    let rules = document.getElementById('rules')
    rules.style.display = 'None'
}


addEventListeners()

function makeRows(rows, cols) {
  container.style.setProperty('--grid-rows', rows);
  container.style.setProperty('--grid-cols', cols);
  for (c = 0; c < (rows * cols); c++) {
    let button = document.createElement("button")
    let cell = document.createElement("div");
    cell.innerText = Math.floor(Math.random() * 3) + 1
    cell.id = c;
    button.append(cell)
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
