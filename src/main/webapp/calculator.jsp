<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/calculator.css">
<link rel="stylesheet" href="js/calculator.js">
<title>Insert title here</title>
</head>
<body>
<div class="space"></div>
<div class="calculator">
	<div class="display">
		<input type="text" id="input" readonly>
	</div>
		<div class="buttons">
			<button onclick="handleClick('7')">7</button>
			<button onclick="handleClick('8')">8</button>
			<button onclick="handleClick('9')">9</button>
			<button onclick="handleClick('/')">÷</button>
			<button onclick="handleClick('4')">4</button>
			<button onclick="handleClick('5')">5</button>
			<button onclick="handleClick('6')">6</button>
			<button onclick="handleClick('*')">×</button>
			<button onclick="handleClick('1')">1</button>
			<button onclick="handleClick('2')">2</button>
			<button onclick="handleClick('3')">3</button>
			<button onclick="handleClick('-')">-</button>
			<button onclick="handleClick('0')">0</button>
			<button onclick="handleClick('.')">.</button>
			<button onclick="handleClick('+')">+</button>
			<button onclick="handleClick('=')">=</button>
			<button onclick="clearInput()">C</button>
		</div>
	<div class="history">
		<h2>History</h2>
		<ul id="history-list"></ul>
	</div>
	
	<div class="result">
		<h2>Result</h2>
		<div id="result-text"></div>
	</div>
</div>

<script src="./js/calculator.js"></script>
</body>
</html>