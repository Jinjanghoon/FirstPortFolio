const input = document.getElementById('input');
const historyList = document.getElementById('history-list');
const resultText = document.getElementById('result-text');

function handleClick(value) {
  switch (value) {
    case '=':
      const expression = input.value;
      const result = eval(expression);
      addToHistory(expression, result);
      input.value = result;
      resultText.textContent = result;
      break;
    case 'C':
      clearInput();
      break;
    default:
      input.value += value;
  }
}

function clearInput() {
  input.value = '';
  resultText.textContent = '';
  historyList.innerHTML = '';
}

function addToHistory(expression, result) {
  const li = document.createElement('li');
  li.textContent = `${expression} = ${result}`;
  historyList.appendChild(li);
}