<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>Amado - Furniture Ecommerce Template | Cart</title>

    <!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="css/core-style.css">
    <link rel="stylesheet" href="style.css">
    <script>
        function affectProduct(p,sign){
            var myData = new FormData();
            var miUrl='/Cart.cfc'
                myData.append("method","affectProduct")
                myData.append("p",p)
                myData.append("sign",sign)
                $.ajax({
                    url:miUrl,
                    type:"POST",
                    contentType: false, // NEEDED, DON'T OMIT THIS (requires jQuery 1.6+)
                    processData: false, // NEEDED, DON'T OMIT THIS
                    data:myData,
                    complete: function (response) {
                        location.reload(true);
                        var reposnseObject=eval("("+response.responseText+")");
                        console.log(reposnseObject);
                        location.reload(true);
                        if(reposnseObject==true){
                            
                        }
                        else{
                            alert("Error al procesar su solicitud. Por favor intentelo nuevamente.");
                            location.reload(true);
                        }
                    },
                    error: function () {
                        alert("Error al procesar su solicitud. Por favor intentelo nuevamente.");
                        location.reload(true);
                    },
                });
        }
    </script>
</head>

<body>
    <!-- Search Wrapper Area Start -->
    <div class="search-wrapper section-padding-100">
        <div class="search-close">
            <i class="fa fa-close" aria-hidden="true"></i>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="search-content">
                        <form action="#" method="get">
                            <input type="search" name="search" id="search" placeholder="Type your keyword...">
                            <button type="submit"><img src="img/core-img/search.png" alt=""></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Search Wrapper Area End -->

    <!-- ##### Main Content Wrapper Start ##### -->
    <div class="main-content-wrapper d-flex clearfix">

        <!-- Mobile Nav (max width 767px)-->
        <div class="mobile-nav">
            <!-- Navbar Brand -->
            <div class="amado-navbar-brand">
                <a href="index.cfm"><img src="img/core-img/logo.png" alt=""></a>
            </div>
            <!-- Navbar Toggler -->
            <div class="amado-navbar-toggler">
                <span></span><span></span><span></span>
            </div>
        </div>

        <cfinclude template="header.cfm">

        <div class="cart-table-area section-padding-100">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12 col-lg-8">
                        <div class="cart-title mt-50">
                            <h2>Shopping Cart</h2>
                        </div>

                        <div class="cart-table clearfix">
                            <table class="table table-responsive">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>Name</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <cfloop index="i" from="1" to="#Request.elementosCarrito.recordcount#">
                                        <cfoutput>
                                        <tr>
                                            <td class="cart_product_img">
                                                <cfset myImage=ImageNew("#Request.elementosCarrito.TPR_IMAGEN[i]#")> 
                                                <cfimage source="#myImage#" action="writeToBrowser" class="img-fluid">
                                                <!---<img src="#Request.productos.TPR_IMAGEN[i]#" alt="">--->
                                                <a href="##"><img src="#Request.elementosCarrito.TPR_IMAGEN[i]#" alt="Product"></a>
                                            </td>
                                            <td class="cart_product_desc">
                                                <h5>#Request.elementosCarrito.TPR_NOMBRE[i]#</h5>
                                            </td>
                                            <td class="price">
                                                <span>$#Request.elementosCarrito.TPR_PRECIO[i]#</span>
                                            </td>
                                            <td class="qty">
                                                <div class="qty-btn d-flex">
                                                    <p>Qty</p>
                                                    <div class="quantity">
                                                        <span class="qty-minus" onclick="affectProduct(#Request.elementosCarrito.TEC_PK_ELEMENTO_CARRITO[i]#,'decrement'); var effect = document.getElementById('qty#i#'); var qty = effect.value; if( !isNaN( qty ) &amp;&amp; qty &gt; 1 ) effect.value--;return false;"><i class="fa fa-minus" aria-hidden="true"></i></span>
                                                        <input type="number" class="qty-text" id="qty#i#" step="1" min="1" max="300" name="quantity" value="#Request.elementosCarrito.TEC_CANTIDAD[i]#">
                                                        <span class="qty-plus" onclick="affectProduct(#Request.elementosCarrito.TEC_PK_ELEMENTO_CARRITO[i]#,'increment'); var effect = document.getElementById('qty#i#'); var qty = effect.value; if( !isNaN( qty )) effect.value++;return false; "><i class="fa fa-plus" aria-hidden="true"></i></span>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>    
                                        </cfoutput>
                                    </cfloop>
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-12 col-lg-4">
                        <div class="cart-summary">
                            <h5>Cart Total</h5>
                            <ul class="summary-table">
                                <cfoutput>
                                <li><span>subtotal:</span> <span>$#Request.subtotal#</span></li>
                                <li><span>delivery:</span> <span>$#Request.delivery#</span></li>
                                <li><span>total:</span> <span>$#Request.total#</span></li>
                                </cfoutput>
                            </ul>
                            <div class="cart-btn mt-100">
                                <a href="/Cart.cfc?method=initCheckout" class="btn amado-btn w-100">Checkout</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Main Content Wrapper End ##### -->

    <!-- ##### Newsletter Area Start ##### -->
    <section class="newsletter-area section-padding-100-0">
        <div class="container">
            <div class="row align-items-center">
                <!-- Newsletter Text -->
                <div class="col-12 col-lg-6 col-xl-7">
                    <div class="newsletter-text mb-100">
                        <h2>Subscribe for a <span>25% Discount</span></h2>
                        <p>Nulla ac convallis lorem, eget euismod nisl. Donec in libero sit amet mi vulputate consectetur. Donec auctor interdum purus, ac finibus massa bibendum nec.</p>
                    </div>
                </div>
                <!-- Newsletter Form -->
                <div class="col-12 col-lg-6 col-xl-5">
                    <div class="newsletter-form mb-100">
                        <form action="#" method="post">
                            <input type="email" name="email" class="nl-email" placeholder="Your E-mail">
                            <input type="submit" value="Subscribe">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Newsletter Area End ##### -->

    <cfinclude template="footer.cfm">

    <!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="js/plugins.js"></script>
    <!-- Active js -->
    <script src="js/active.js"></script>

</body>

</html>