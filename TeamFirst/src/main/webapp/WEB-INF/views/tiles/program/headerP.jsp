<!-- W3hubs.com - Download Free Responsive Website Layout Templates designed on HTML5 CSS3,Bootstrap which are 100% Mobile friendly. w3Hubs all Layouts are responsive cross browser supported, best quality world class designs. -->
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Responsive Navbar In Bootstrap 4</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<style type="text/css">
body{
	margin: 0;
	font-family: 'Source Sans Pro';
}

a {
	text-decoration: none;
	color: white;
}

.navbar{
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-color: #263343;
	padding: 8px 12px;
}

.navbar_logo{
	font-size: 24px;
	color: white;
}

.navbar_logo i{
	color: #d49466;
}

.navbar_menu{
	display: flex;
	list-style: none;
	padding-left: 0; 
}

.navbar_menu li{
	padding: 8px 12px;
}

.navbar_menu li:hover{
	background-color: #d49466;
	border-radius: 4px;
}

.navbar_icons{
	list-style: none;
	color: white;
	display: flex;
}

.navbar_icons li{
	padding: 8px 12px;
}
.navbar_toogleBtn {
	position: absolute;
	right: 32px;
	font-size: 24px;
	color: #d49466; 
}

@media screen and (max-width: 768x){
	.navbar{
		flex-direction: column;
		align-items: flex-start;
		padding: 8px 24px;
	}
	.navbar_menu{
		flex-direction: column;
		align-items: center;
		width: 100%;
	}
	.navbar_menu li{
		width: 100%;
		text-align: center;
	}
	.navbar_icons{
		justify-content: center;
		width: 100%;
		padding-left: 0;
	}
	
}
</style>
<body>
<header>
<nav class="navbar">
  <div class="navbar_logo">
	  <i class="fab fa-accusoft"></i>
  	  <a href="#">Fitness</a>
  </div>
    
    <ul class="navbar_menu">
      <li><a href="#">Home</a></li>
      <li><a href="#">About</a></li>
      <li><a href="#">Service</a></li>
      <li><a href="#">Contact</a></li>     
    </ul>
    
    <ul class="navbar_icons">
    	<li><i class="fas fa-dumbbell"></i></li>
    	<li><i class="fas fa-running"></i></li>
    </ul>
</nav>
</header>
</body>
</html>


