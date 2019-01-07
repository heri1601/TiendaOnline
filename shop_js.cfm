<script>
    $(document).ready(function(){
        
    });


    function addToCart(p){
        var myData = new FormData();
        var miUrl='/index.cfc'
            myData.append("method","addToCart")
			myData.append("p",p)
            $.ajax({
                url:miUrl,
                type:"POST",
				contentType: false, // NEEDED, DON'T OMIT THIS (requires jQuery 1.6+)
    			processData: false, // NEEDED, DON'T OMIT THIS
				data:myData,
                complete: function (response) {
                    var reposnseObject=eval("("+response.responseText+")");
                    console.log(reposnseObject);
                    if(reposnseObject=="redirect"){
                        location.href = "/index.cfc?method=login"
                    }
                    else{
                        if(reposnseObject==true){
                            alert("El producto fue agregado a su carrito");
                            location.href = "/Cart.cfc?method=init"
                        }
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