<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Case</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>

	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="index.html">Goethe Sport</a>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="http://localhost/WebProgrammierung/index.html">Home</a></li>
				<li><a href="logon.html">Events</a></li>
				<li class="active"><a href="results.html">Results</a></li>
				<li><a href="maps.html">Maps</a></li>
				<li><a href="about.html">About</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="register.html"><span
						class="glyphicon glyphicon-user"></span> Sign Up</a></li>
				<li><a href="logon.html"><span
						class="glyphicon glyphicon-log-in"></span> Login</a></li>
			</ul>
		</div>
	</nav>


	<div class="container">
		<h2>Contextual Classes</h2>
		<p>Contextual classes can be used to color table rows or table
			cells. The classes that can be used are: .active, .success, .info,
			.warning, and .danger.</p>
		<table class="table">
			<thead>
				<tr>
					<th>Firstname</th>
					<th>Lastname</th>
					<th>Email</th>
				</tr>
			</thead>
			<tbody>
				<tr class="success">
					<td>John</td>
					<td>Doe</td>
					<td>john@example.com</td>
				</tr>
				<tr class="danger">
					<td>Mary</td>
					<td>Moe</td>
					<td>mary@example.com</td>
				</tr>
				<tr class="info">
					<td>July</td>
					<td>Dooley</td>
					<td>july@example.com</td>
				</tr>
			</tbody>
		</table>
	</div>



<?php
			echo "fetch";
 			$pdo = new PDO ( 'mysql:host=127.0.0.1;dbname=sport', 'root', '' );
			$sql = $pdo->prepare ( "SELECT * FROM running" );
			
			if ($sql->execute ()) {
				$sql->setFetchMode ( PDO::FETCH_ASSOC );
				echo "if";
			}
			echo "endfetch"; 
?>

	<div id="content">

		<table>
			<?php while($row = $sql->fetch()) { ?>
			<tr>
				<td>
					<?php echo $row['name']; ?>
				</td>
				<td>
					<?php echo $row['time']; ?>
				</td>
				<td>
					<?php echo $row['competition']; ?>
				</td>

			</tr>
			<?php } ?>
		</table>

	</div>

<script type="text/javascript">    

$.ajax({
    url: '/Sportfest/db/DBAdmin.php',
    data: {
       sql: "fetch_all"
    },
    type: "POST",
    success: function(response){
       console.log("SUCCESS: " + response);
    },
    error: function () {
       console.log("Calling php script failed.");
    }
});
</script>

</body>
</html>