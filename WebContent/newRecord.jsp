<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nový zápis</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body, html {
	height: 100%;
	margin: 0;
	font-family: Calibri, Calibri, sans-serif;
}

.hero-image {
	background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),
		url("kroko.jpg");
	height: 50%;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
	position: relative;
}

.hero-text {
	text-align: center;
	position: fixed;
	top: 25%;
	left: 50%;
	transform: translate(-50%, -50%);
	color: white;
}

.hero-textmimo {
	text-align: center;
	position: fixed;
	top: 25%;
	left: 50%;
	transform: translate(-50%, -50%);
	color: #C7986C;
}

.hero-zaznam {
	text-align: center;
	position: absolute;
	top: 50%;
	left: 20%;
	transform: translate(-60%, -30%);
	color: white;
	margin: 75px 0 0 0;
	background-position: right;
	background-repeat: no-repeat;
	background-size: cover;
}

.hero-odkaz {
	text-align: inherit;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	color: black;
	margin: 90px 150px 10px 10px;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}

.hero-text button:hover {
	background-color: #3d3d5c;
	color: white;
}

.hero-text button {
	background-color: transparent;
	color: floralwhite;
}

.btn {
	background-color: #E1CAB1;
	border: none;
	color: #604124;
	padding: 12px 16px;
	font-size: 16px;
	cursor: pointer;
}

.btn:hover {
	background-color: #7F7A75;
}

.radio {
	text-align: left;
	position: fixed;
	top: 50%;
	left: 90%;
	background-position: right;
	color: #C7986C;
}

.radio2 {
	text-align: left;
	position: fixed;
	top: 60%;
	left: 90%;
	background-position: right;
	color: #C7986C;
}
</style>
</head>

<body>
	<form action="DenikServlet" method="get">

		<div class="hero-image">
			<div class="hero-text">
				<h1 style="font-size: 25px">Nový zápis</h1>
				&nbsp;
				<p>Řekni nám o svém výletu o místě, které stojí za to ho
					navštívit... Pověz co tam bylo nejlepší nebo nejhezčí? Doporuč nám
					kde ti chutnalo ...</p>

				<label><b>Autor</b></label> <input type="text"
					placeholder="Vlož svou přezdívku/jméno" name="jmeno_autor" required>
				&nbsp;
				<p>
					<label><b>Název výletu</b></label> <input type="text"
						placeholder="Vlož název místa výletu" name="nazev_vylet" required>
				</p>

			</div>
		</div>

		<div class="hero-zaznam">
			&nbsp;
			<textarea name="zapis" style="width: 300px; height: 300px">
    Milý deníčku,
  </textarea>
		</div>

		<div class="hero-odkaz">
			<div class="hero-textmimo">
				Máš webové stránky MÍSTA, o kterém vyprávíš? Vlož je zde: <input
					type="url" name=odkaz_misto>
				<p></p>
				Máš webové stránky RESTAURACE/HOSPŮDKY,kde ti chutnalo? Vlož je zde:
				<input type="url" name=odkaz_restaurace>
			</div>
		</div>
	</form>
	<div class="radio">
		<form action="DenikServlet" method="get">
			<input type="radio" name="ikony_urceni" value="pes"> Pes<br>
			<input type="radio" name="ikony_urceni" value="dite">Dítě <br>
			<input type="radio" name="ikony_urceni" value="invalida">
			Invalida<br>

		</form>

	</div>

	<div class="radio2">
		<form action="DenikServlet" method="get">
			<input type="radio" name="ikony_vylet" value="hrad"> Hrad<br>
			<input type="radio" name="ikony_vylet" value="zamek"> Zámek<br>
			<input type="radio" name="ikony_vylet" value="rozhledna">
			rozhledna<br> <input type="radio" name="ikony_vylet" value="les">
			Les<br> <input type="radio" name="ikony_vylet" value="hory">
			Hory<br>

		</form>
	</div>
	<form action="DenikServlet" method="get">
		<button type="submit" name="action" value="insert">Ulož</button>

	</form>

</body>
</html>

