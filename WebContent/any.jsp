<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Page</title>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script>
console.log("Test");

function hideButton(){
document.getElementById("sub1").style.visibility = "hidden";
}

function logOut(){
	$.ajax({
	       url: '/Sportfest/session/logout.php',
	       data: {
	       },
	       type: "POST",
	       success: function(response){
	          console.log("SUCCESS: " + response);  
	      	    	alert("Sie wurden erfolgreich abgemeldet. Bis zum nächsten Mal!");	
	    	window.location.replace("index.html");	
	    	
	       },
	       error: function () {
	          console.log("Calling php script failed.");
	       }
	   });
}
function checkAuth(){
	
	$.ajax({
	       url: '/Sportfest/session/seite2.php',
	       data: {
	       },
	       type: "POST",
	       success: function(response){
	          console.log("SUCCESS: " + response);  
	      	if(response == "true"){
	    		console.log("allowed");
	    	}
	    	else{
	    	alert("Zugriff verweigert. Bitte melden Sie sich an.");	
	    	window.location.replace("logon.html");	
	    	}
	       },
	       error: function () {
	          console.log("Calling php script failed.");
	          window.location.replace("logon.html");	
	       }
	   });
	}
	
$(document).ready(function() {
	
    $('#sub').click(function(event) {  
    	console.log("Test Klick");
    	var nachname=$('#nachname').val();
    	var userid=$('#userid').val();
    	var time=$('#time').val();
    	var competition=$('#competition').val();
    
    	console.log(nachname, userid, time, competition);

    	$.ajax({
    	       url: '/Sportfest/db/DBAdmin.php',
    	       data: {
    	          sql: "insert_data",
    	          name: nachname,
    	          userid: userid,
    	          time: time,
    	          competition: competition
    	       },
    	       type: "POST",
    	       success: function(response){
    	          console.log("SUCCESS: " + response);
    	       },
    	       error: function () {
    	          console.log("Calling php script failed.");
    	
    	          console.log("fail")
    	       }
    	   });

    });
});
	
</script>
</head>
<body onload="checkAuth()">

	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="index.html">Goethe Sport</a>
			</div>
			<ul class="nav navbar-nav">
				<li ><a href="index.html">Home</a></li>
				<li class="active"><a href="any.jsp">Events</a></li>
				<li><a href="http://localhost:80/Sportfest/db/results.php">Results</a></li>
				<li><a href="http://localhost:8080/WebProgrammierung/maps.html">Maps</a></li>
				<li><a href="about.html">About</a></li>
			</ul>
		</div>
	</nav>
	
	<jsp:useBean id="ide" class="services.DateBeanJava" />
	
	
	

	<form class="form-horizontal" role="form">
		<div class="form-group">
			<label class="control-label col-sm-2" for="email">Nachname</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="nachname" placeholder="<%=ide.getToday().toString() %>">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="pwd">USERID</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="userid" placeholder="">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="pwd">Zeit</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="time" placeholder="">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="pwd">Disziplin</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="competition"
					placeholder="">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="button" id="sub" class="btn btn-default"><span class="glyphicon glyphicon-floppy-disk"></span>Submit</button>
			</div>
			<div class="col-sm-offset-2 col-sm-10">
				<button type="button" id="sub1" onclick="logOut()" class="btn btn-default">Log Out</button>
			</div>
		</div>
	</form>
	
	<div><svg width="100" height="100">
  <circle cx="50" cy="50" r="40" stroke="green" stroke-width="4" fill="yellow" />
</svg></div>

</body>
</html>