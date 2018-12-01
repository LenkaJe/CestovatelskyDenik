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
	background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)) URL('kroko.jpg')));
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
				<p>Řekni nám o svém výletu na místo, které stojí za to
					navštívit... Pověz, co tam bylo nejlepší nebo nejhezčí? Doporuč nám
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
     			<option value="Benešov">Benešov</option>
				<option value="Beroun">Beroun</option>
				<option value="Blansko">Blansko </option>
				<option value="Brno-město">Brno-město</option>
				<option value="Brno-venkov">Brno-venkov</option>
				<option value="Bruntál">Bruntál</option>
				<option value="Česká Lípa">Česká Lípa</option>
				<option value="České Budějovice">České Budějovice</option>
				<option value="Český Krumlov">Český Krumlov</option>
				<option value="Děčín">Děčín</option>
				<option value="Domažlice">Domažlice</option>
				<option value="Frýdek-Místek">Frýdek-Místek</option>
				<option value="Havlíčkův Brod">Havlíčkův Brod</option>
				<option value="Hradec Králové">Hradec Králové</option>
				<option value="Cheb">Cheb</option>
				<option value="Chomutov">Chomutov</option>
				<option value="Chrudim">Chrudim</option>
				<option value="Jablonec nad Nisou">Jablonec nad Nisou</option>
				<option value="Jeseník">Jeseník</option>
				<option value="Jičín">Jičín</option>
				<option value="Jihlava">Jihlava</option>
				<option value="Jindřichův Hradec">Jindřichův Hradec</option>
				<option value="Karlovy Vary">Karlovy Vary</option>
				<option value="Kladno">Kladno</option>
				<option value="Klatovy">Klatovy</option>
				<option value="Kolín">Kolín</option>
				<option value="Kroměříž">Kroměříž</option>
				<option value="Kutná Hora">Kutná Hora</option>
				<option value="Liberec">Liberec</option>
				<option value="Litoměřice">Litoměřice</option>
				<option value="Louny">Louny</option>
				<option value="Mladá Boleslav">Mladá Boleslav</option>
				<option value="Most">Most</option>
				<option value="Náchod">Náchod</option>
				<option value="Nový Jičín">Nový Jičín</option>
				<option value="Nymburk">Nymburk</option>
				<option value="Opava">Opava</option>
				<option value="Ostrava-město">Ostrava-město</option>
				<option value="Pardubice">Pardubice</option>
				<option value="Pelhřimov">Pelhřimov</option>
				<option value="Písek">Písek</option>
				<option value="Plzeň-jih">Plzeň-jih</option>
				<option value="Plzeň-město">Plzeň-město</option>
				<option value="Plzeň-sever">Plzeň-sever</option>
				<option value="Praha-východ"> Praha-východ</option>
				<option value="Praha-západ">Praha-západ</option>
				<option value="Prachatice">Prachatice</option>
				<option value="Prostějov">Prostějov</option>
				<option value="Přerov">Přerov</option>
				<option value="Příbram">Příbram</option>
				<option value="Rakovník">Rakovník</option>
				<option value="Rokycany">Rokycany </option>
				<option value="Rychnov nad Kněžnou">Rychnov nad Kněžnou</option>
				<option value="Semily">Semily</option>
				<option value="Sokolov">Sokolov</option>
				<option value="Strakonice">Strakonice</option>
				<option value="Svitavy">Svitavy</option>
				<option value="Tábor">Tábor</option>
				<option value="Tachov">Tachov</option>
				<option value="Teplice">Teplice</option>
				<option value="Trutnov">Trutnov</option>
				<option value="Třebíč">Třebíč</option>
				<option value="Uherské Hradiště">Uherské Hradiště</option>
				<option value="Ústí nad Labem">Ústí nad Labem</option>
				<option value="Ústí nad Orlicí">Ústí nad Orlicí</option>
				<option value="Vsetín">Vsetín</option>
				<option value="Vyškov">Vyškov</option>
				<option value="Zlín">Zlín</option>
				<option value="Znojmo">Znojmo</option>
				<option value="Žďár nad Sázavou">Žďár nad Sázavou</option>
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
					type="text" name=odkaz_misto>
				<p></p>
				Máš webové stránky RESTAURACE/HOSPŮDKY,kde ti chutnalo? Vlož je zde:
				<input type="text" name=odkaz_restaurace>
			</div>
		</div>
	
	<div class="radio">
		
			<p>Výlet je vhodný pro</p>
    <input type="radio" name="ikona_urceni" value="pes" title="pes"> <i class="fas fa-dog" title="pes"></i> <br>
    <br>
    <input type="radio" name="ikona_urceni" value="dite"> <i class="fas fa-child" title ="dítě"></i><br>
    <br>
    <input type="radio" name="ikona_urceni" value="invalida" > <i class="fab fa-accessible-icon" title="invalida"></i><br>
	

	</div>
	<br>

	<div class="radio2">
		
			<p>Hlavní atrakce výletu </p>
    <input type="radio" name="ikona_vylet" value="hrad"><i class="fab fa-fort-awesome" title="hrad/zámek"> </i> <br>
    <br>
    <input type="radio" name="ikona_vylet" value="kostel" ><i class="fas fa-church" title="kostel"></i><br>
    <br>
    <input type="radio" name="ikona_vylet" value="rozhledna">  <i class="fas fa-chess-rook" title="rozhledna"></i><br>
    <br>
    <input type="radio" name="ikona_vylet" value="les"> <i class="fas fa-tree" title="les"></i><i class="fas fa-tree" title="les"></i><br>
    <br>
    <input type="radio" name="ikona_vylet" value="hory"> <i class="fas fa-mountain" title="hory"></i><br>
    <br>
    <input type="radio" name="ikona_vylet" value="mesto"> <i class="fas fa-city" title="mesto"></i><br>
		
	</div>
	<div class ="btn-uloz">
	
		<button type="submit" name="action" value="insert" class ="btn-uloz">Ulož zápis <i class="fas fa-check-circle"></i></button>
	
	
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
    </form>
</body>
</html>

