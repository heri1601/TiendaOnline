<script>
    $(document).ready(function(){
        
    });


    function addToCart(p){
        var myData = new FormData();
        var miUrl='/index.cfc'
            myData.append("method","addToCart")
			myData.append("pkRegistro",p)
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
                        if(reposnseObject==True){
                            alert("El producto fue agregado a su carrito");
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