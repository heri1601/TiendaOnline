<html>
<head>
<title>Formulario</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<!---DataTable---------------------------------------------------------------------------->        
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script> 
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
<!---------------------------------------------------------------------------------------->  


  <!---<link rel="stylesheet"String type="text/css"String href="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.css"String/>
  <script type="text/javascript"String src="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.js"String></script>--->
  <style>
  .bg-1 { 
      background-color: #1abc9c; /* Green */
      background-size: cover;
  }
  .bg-2 { 
      background-color: #474e5d; /* Dark Blue */
      color: #ffffff;
  }
  .bg-3 { 
      background-color: #fff; /* White */
      color: #555555;
  }
  .centered-modal.in {
    display: flex !important;
}
.centered-modal .modal-dialog {
    margin: auto;
}
    .back{
        
        
        }
    body{
        background: url(/img/bg1.jpg) no-repeat center center fixed; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
        
    }


    html { 
      background: url(/img/bg.jpg) no-repeat center center fixed; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
  
}
    
     h1,p{
    color: #000000;  
     }

.myButton {
	background-color:#44c767;
	-moz-border-radius:28px;
	-webkit-border-radius:28px;
	border-radius:28px;
	border:1px solid #18ab29;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:16px;
	padding:13px 5px;
	text-decoration:none;
	text-shadow:1px 2px 1px #2f6627;
}
.myButton:hover {
	background-color:#5cbf2a;
}
.myButton:active {
	position:relative;
	top:1px;
}
.mySend {
  position: absolute;
  left: 200px;
  top: 150px;
}



  </style>

</head>
<body>

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="/index.cfm">Web</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="/Administradores/Productos/C_Productos.cfc?method=init">Productos</a></li>
      <li class="active"><a href="/Administradores/Inventarios/C_Inventarios.cfc?method=init">Inventarios</a></li>
      <li class="active"><a href="/Administradores/Duenos/C_Duenos.cfc?method=init">Due&ntilde;os</a></li>
      <li class="active"><a href="/Administradores/Categorias/C_Categorias.cfc?method=init">Categorias</a></li>
    </ul>
  </div>
</nav>