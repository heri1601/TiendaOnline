<html>
  <head>

<link href="/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="/js/jquery/jquery-2.2.4.min.js"></script>
<style>
body#LoginForm{ background-image:url("/img/bg.jpg"); background-repeat:no-repeat; background-position:center; background-size:cover; padding:10px;}

.form-heading { color:#fff; font-size:23px;}
.panel h2{ color:#444444; font-size:18px; margin:0 0 8px 0;}
.panel p { color:#777777; font-size:14px; margin-bottom:30px; line-height:24px;}
.login-form .form-control {
  background: #f7f7f7 none repeat scroll 0 0;
  border: 1px solid #d4d4d4;
  border-radius: 4px;
  font-size: 14px;
  height: 50px;
  line-height: 50px;
}
.main-div {
  background: #ffffff none repeat scroll 0 0;
  border-radius: 2px;
  margin: 10px auto 30px;
  max-width: 38%;
  padding: 50px 70px 70px 71px;
}

.login-form .form-group {
  margin-bottom:10px;
}
.login-form{ text-align:center;}
.forgot a {
  color: #777777;
  font-size: 14px;
  text-decoration: underline;
}
.login-form  .btn.btn-primary {
  background: #f0ad4e none repeat scroll 0 0;
  border-color: #f0ad4e;
  color: #ffffff;
  font-size: 14px;
  width: 100%;
  height: 50px;
  line-height: 50px;
  padding: 0;
}
.forgot {
  text-align: left; margin-bottom:30px;
}
.botto-text {
  color: #ffffff;
  font-size: 14px;
  margin: auto;
}
.login-form .btn.btn-primary.reset {
  background: #ff9900 none repeat scroll 0 0;
}
.back { text-align: left; margin-top:10px;}
.back a {color: #444444; font-size: 13px;text-decoration: none;}

</style>

<script>
  $(document).ready(function(){
    });
  function login(){
    var email=$("#inputEmail").val();
    var password=$("#inputPassword").val();

    var myData = new FormData();
        var miUrl='/index.cfc'
            myData.append("method","loginCheck")
			myData.append("e",email)
      myData.append("p",password)
            $.ajax({
                url:miUrl,
                type:"POST",
				contentType: false, // NEEDED, DON'T OMIT THIS (requires jQuery 1.6+)
    			processData: false, // NEEDED, DON'T OMIT THIS
				data:myData,
                complete: function (response) {
                    var reposnseObject=eval("("+response.responseText+")");
                    console.log(reposnseObject);
                    if(reposnseObject=="accept"){
                        location.href = "/index.cfc?method=goProduct"
                        return ;
                    }
                    if(reposnseObject=="bad"){
                      alert("Credenciales incorrectas. Acceso denegado.");
                      return ;
                    }
                    

                    //Mostrar el seguir comprando o ir al carrito.
                    //location.reload(true);
                     
                },
                error: function () {
                    alert("Error de conexion. Por favor intentelo nuevamente.");
                },
            });
    
  }
</script>
<!------ Include the above in your HEAD tag ---------->
  </head>
<body id="LoginForm">
<div class="container">

<div class="login-form">
<div class="main-div">
    <div class="panel">
   <h2>Login</h2>
   <p>Please enter your email and password</p>
   </div>
    <form action="javascript:login();" id="Login">

        <div class="form-group">


            <input type="email" class="form-control" id="inputEmail" placeholder="Email Address">

        </div>

        <div class="form-group">

            <input type="password" class="form-control" id="inputPassword" placeholder="Password">

        </div>
        <div class="forgot">
        <a href="reset.html">Register for free here</a>
</div>
        <button type="submit" class="btn btn-primary">Login</button>

    </form>
    </div>
<p class="botto-text"> Designed by Sunil Rajput</p>
</div></div></div>


</body>
</html>
