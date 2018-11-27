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
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
	<style>
body, html {
	height: 100%;
	margin: 0;
	font-family: Calibri, Calibri, sans-serif;
}


.hero-image {
	background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)) url("kroko.jpg");
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
	left: 70%;
	background-position: right;
	color: #C7986C;
}

	i{
	font-size: 25px;
    color: #C7986C
    }

.radio2 {
	text-align: left;
	position: fixed;
	top: 50%;
	left: 80%;
	background-position: right;
	color: #C7986C;
}

.btn-uloz {
	position: fixed;
	top: 90%;
	left: 70%;
	background-position: right;
}
	
.rating {	
	position: fixed;
	top: 44%;
	left: 30%;
	background-position: right;}

.rating { 
  border: none;
  float: left;
  font-size: 30px;
}

.rating > input { display: none; } 
.rating > label:before { 
  margin: 5px;
  font-size: 1.25em;
  font-family: FontAwesome;
  display: inline-block;
  content: "\f005";
}

.rating > .half:before { 
  content: "\f089";
  position: absolute;
}

.rating > label { 
  color: #ddd; 
  float: right; 
}

/***** CSS Magic to Highlight Stars on Hover *****/

.rating > input:checked ~ label, /* show gold star when clicked */
.rating:not(:checked) > label:hover, /* hover current star */
.rating:not(:checked) > label:hover ~ label { color: #FFD700;  } /* hover previous stars in list */

.rating > input:checked + label:hover, /* hover current star when changing rating */
.rating > input:checked ~ label:hover,
.rating > label:hover ~ input:checked ~ label, /* lighten current selection */
.rating > input:checked ~ label:hover ~ label { color: #FFED85;  } 
	
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
						placeholder="Vlož název místa, které jsi navštívil" name="nazev_vylet" required>
				</p>
				&nbsp;
				Vyber okres výletu 
   				<select name="okres">
     			<option value="Praha">Praha</option>
      			<option value="Benešov">Benešov</option>
      			<option value="Beroun">Beroun</option>
      			<option value="Kladno">Kladno</option>
   				</select>

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
			<p>Výlet je vhodný pro</p>
    <input type="radio" name="ikony_urceni" value="pes" title="pes"> <i class="fas fa-dog" title="pes"></i> <br>
    <br>
    <input type="radio" name="ikony_urceni" value="dite"> <i class="fas fa-child" title ="dítě"></i><br>
    <br>
    <input type="radio" name="ikony_urceni" value="invalida" > <i class="fab fa-accessible-icon" title="invalida"></i><br>
		</form>

	</div>
	<br>

	<div class="radio2">
		<form action="DenikServlet" method="get">
			<p>Hlavní atrakce výletu </p>
    <input type="radio" name="ikony_vylet" value="hrad"><i class="fab fa-fort-awesome" title="hrad/zámek"> </i> <br>
    <br>
    <input type="radio" name="ikony_vylet" value="kostel" ><i class="fas fa-church" title="kostel"></i><br>
    <br>
    <input type="radio" name="ikony_vylet" value="rozhledna">  <i class="fas fa-chess-rook" title="rozhledna"></i><br>
    <br>
    <input type="radio" name="ikony_vylet" value="les"> <i class="fas fa-tree" title="les"></i><i class="fas fa-tree" title="les"></i><br>
    <br>
    <input type="radio" name="ikony_vylet" value="hory"> <i class="fas fa-mountain" title="hory"></i><br>
    <br>
    <input type="radio" name="ikony_vylet" value="mesto"> <i class="fas fa-city" title="mesto"></i><br>
		</form>
	</div>
	<div class ="btn-uloz">
	<form action="DenikServlet" method="get">
		<button type="submit" name="action" value="insert" class ="btn-uloz">Ulož zápis <i class="fas fa-check-circle"></i></button>
	</form>
	</div>
 <fieldset class="rating">
      <input type="radio" id="star5" name="hodnoceni" value="5" /><label class = "full" for="star5" title="Musíte vidět"></label> <br>
      <br>
      <input type="radio" id="star4" name="hodnoceni" value="4" /><label class = "full" for="star4" title="Stojí za návštěvu"></label><br>
      <br>
      <input type="radio" id="star3" name="hodnoceni" value="3" /><label class = "full" for="star3" title="Dobré"></label><br>
      <br>
      <input type="radio" id="star2" name="hodnoceni" value="2" /><label class = "full" for="star2" title="Čekal jsem víc"></label><br>
      <br>
      <input type="radio" id="star1" name="hodnoceni" value="1" /><label class = "full" for="star1" title="Nestojí za návštěvu"></label>
    </fieldset>
</body>
</html>

