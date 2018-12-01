<%@page import="cz.czechitas.denik.bean.Record"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cz.czechitas.denik.bean.RecordList"%>
<%@page import="cz.czechitas.denik.enums.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Seznam cestovatelských zápisů</title>
<style>
<
style>body, html {
	height: 100%;
	margin: 0;
	font-family: Calibri, Calibri, sans-serif;
}

.hero-image {
	background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),
		url("bus.jpg");
	height: 50%;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
	position: relative;
}

.hero-text {
	text-align: center;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	color: white;
}

.hero-obsah {
	text-align: center;
	position: absolute;
	top: 80%;
	left: 22%;
	transform: translate(-100%, -50%);
	color: #61544E;
}

.hero-text button {
	border: 2px solid;
	display: inline-block;
	padding: 10px 25px;
	color: transparent;
	background-color: transparent;
	text-align: center;
	cursor: pointer;
}

.hero-text button:hover {
	background-color: #61544E;
	color: white;
}

.hero-text button {
	background-color: transparent;
	color: floralwhite;
}

.navbar {
	overflow: hidden;
	background-color: #61544E;
	font-family: calibri, calibri, sans-serif;
}

.navbar a {
	float: right;
	font-size: 16px;
	color: lightcoral;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

.dropdown {
	float: left;
	overflow: hidden;
}

.dropdown .dropbtn {
	font-size: 16px;
	border: none;
	outline: none;
	color: white;
	padding: 14px 16px;
	background-color: #61544E;
	font-family: inherit;
	margin: 0;
}

.navbar a:hover, .dropdown:hover .dropbtn {
	background-color: transparent;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #61544E;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	float: none;
	color: whitesmoke;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	text-align: left;
}

.dropdown-content a:hover {
	background-color: black;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.tableclass {
	border: 1px solid black;
}

.tableposition {
	position: absolute;
	top: 50%;
	left: 50%;
}

.tdclass {
	border: 1px solid black
}
</style>
</head>
<body>

	<div class="hero-image">
		<div class="hero-text">
			<h1 style="font-size: 25px">Seznam cestovatelských zápisů</h1>
			&nbsp;
			<p>Komunita vybudovaná cestovateli a výletníky pro cestovatele,
				kteří se chtějí podělit o své zážitky</p>

			<button>Nový záznam</button>
		</div>
	</div>
	<p></p>

	<div class="tableposition">
		Projdete si záznamy a inspirujte se na cesty <br>
		<form action="DenikServlet" method="get">
			<select name="okres">
				<option value="default">Vyber okres</option>
				<option value="Benešov">Benešov</option>
				<option value="Beroun">Beroun</option>
				<option value="Blansko">Blansko</option>
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
				<option value="Praha-východ">Praha-východ</option>
				<option value="Praha-západ">Praha-západ</option>
				<option value="Prachatice">Prachatice</option>
				<option value="Prostějov">Prostějov</option>
				<option value="Přerov">Přerov</option>
				<option value="Příbram">Příbram</option>
				<option value="Rakovník">Rakovník</option>
				<option value="Rokycany">Rokycany</option>
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
			</select> <select name="ikony_urceni">
				<option value="default">Vhodné pro</option>
				<option value="pes">PES</option>
				<option value="dite">DÍTĚ</option>
				<option value="invalida">INVALIDA</option>
			</select> <select name="ikony_vylet">
				<option value="default">Hlavní atrakce výletu</option>
				<option value="hrad">HRAD</option>
				<option value="kostel">KOSTEL</option>
				<option value="rozhledna">ROZHLEDNA</option>
				<option value="les">LES</option>
				<option value="hory">HORY</option>
				<option value="mesto">MESTO</option>
			</select> <select name="hodnoceni">
				<option value="0">Hodnocení</option>
				<option value="1">1 hvězda</option>
				<option value="2">2 hvězdy</option>
				<option value="3">3 hvězda</option>
				<option value="4">4 hvězdy</option>
				<option value="5">5 hvězd</option>
			</select>
			<button type="submit" name="action" value="filter">Filtruj</button>

			<table class="tableclass">
				<tr>
					<th class="tdclass">Název výletu</th>
					<th class="tdclass">Jméno autora</th>
					<th class="tdclass">Okres</th>
					<th class="tdclass">Hodnocení</th>
					<th class="tdclass">Výlet vhodný pro</th>
					<th class="tdclass">Hlavní atrakce výletu</th>
					<th class="tdclass">Zobraz detail</th>
				</tr>
				<%
					RecordList recordList = (RecordList) request.getAttribute("recordList");
					if (recordList != null) {
						ArrayList<Record> list = recordList.getListOfRecordsFromDb();
						for (Record zapis : list) {
				%>
				<tr>
					<td class="tdclass"><%=zapis.getNazev_vylet()%></td>
					<td class="tdclass"><%=zapis.getJmeno_autor()%></td>
					<td class="tdclass"><%=zapis.getOkres()%></td>
					<td class="tdclass"><%=zapis.getHodnoceni()%></td>
					<td class="tdclass">
						<%
							if (zapis.getIkony_urceni().toString() != "DEFAULT") {
						%> <%=zapis.getIkony_urceni()%> <%
 	}
 %>
					</td>

					<td class="tdclass">
						<%
							if (zapis.getIkony_vylet().toString() != "DEFAULT") {
						%> <%=zapis.getIkony_vylet()%> <%
 	}
 %>
					</td>
					<td class="tdclass"><input type="radio" id="id_zapis"
						name="id_zapis" value="<%=zapis.getIdzapis()%>"></td>
					<%
						}
						}
					%>

				</tr>

			</table>

			<button type="submit" name="action" value="detail">Zobraz
				detail zápisu</button>
		</form>
	</div>
</body>
</html>