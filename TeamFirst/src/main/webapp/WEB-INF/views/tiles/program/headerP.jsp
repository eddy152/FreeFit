<!-- W3hubs.com - Download Free Responsive Website Layout Templates designed on HTML5 CSS3,Bootstrap which are 100% Mobile friendly. w3Hubs all Layouts are responsive cross browser supported, best quality world class designs. -->
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Responsive Navbar In Bootstrap 4</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<style type="text/css">
header{
  background:#6978c7!important;
}
ul{
  padding: 0 60px;
  list-style-type: none;
}
  li{
    padding: 0px 20px;
    line-height: 3;
  }
  li a{
    font-size: 15px;
    color: #fff;


  }
  .navbar-expand-md .navbar-nav .nav-link{
    padding: 5px 15px 5px 15px;
  }
  li a:hover{
    color: #fff;
    background: #9c9999;
  }
  .navbar{
    padding: 0;
  }
  #top li{
    padding: 0;
    line-height: 1.8;

  }
  #top li a{
    font-size: 11px;
    padding: 0;
  }
  #top li a:hover{
    background: none;
    text-decoration: none;
  }
  .col-md-2 .fab{
    font-size: 20px;
    padding-right: 10px;
    padding-top: 5px;
    padding-left: 10px;
    
  }
  .navbar-brand img{
    height: 60px;

  }
  .navbar-toggler{
    color: #fff;
  }
  .fas:hover,.fab:hover{
    color: #E5E7E9;

  }
  .ownbg{
    background: #3f51b5!important;

  }
  @media(max-width: 992px){
  .col-md-2 .fab{
    font-size: 18px;
    padding-right: 0;

    
  }
  }
  @media(max-width: 768px){
    #top{
      display: none;
    }
     .navbar-brand img{
    height: 50px;

  }
    .navbar-dark .navbar-toggler{
      outline: none;
      border-color: rgba(255, 255, 255, 0);
    }
    ul,li{
      padding: 0;
      text-align: center;

    }
    .navbar-nav{
      padding-bottom: 40px;
    }
 
  }
</style>
<body>
<header>
<div class="container" id="top">
  <div class="row">
    <div class="col-md-10 col-sm-12 col-xs-12">
      <ul class=" list-group list-group-horizontal">
        <li><i class='fas fa-envelope-open pr-2'></i><a href="#" class="pr-5"> YDYD@mail.com</a></li>
        <li><i class='fas fa-phone pr-2'></i><a href="#" class="pr-3"> 053 123 1234</a></li>
      </ul>
     </div>
    <div class="col-md-2 col-sm-12 col-xs-12 text-left">
      <i class='fab fa-facebook'></i>
      <i class='fab fa-twitter-square'></i>
      <i class='fab fa-google-plus-square'></i>
    </div>
  </div>
</div>
<nav class="navbar navbar-expand-md navbar-dark ownbg">
  <a class="navbar-brand text-white pl-5" href="#"><img src="/spring/resourcesimages/2.png"></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
        <a class="nav-link" href="#">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">About</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Service</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="#">Contact</a>
      </li>     
    </ul>
  </div>  
</nav>
</header>
</body>
</html>


