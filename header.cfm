<!-- Header Area Start -->
        <header class="header-area clearfix">
            <!-- Close Icon -->
            <div class="nav-close">
                <i class="fa fa-close" aria-hidden="true"></i>
            </div>
            <!-- Logo -->
            <div class="logo">
                <a href="index.cfm"><img src="img/core-img/logo.png" alt=""></a>
            </div>
            <!-- Amado Nav -->
            <nav class="amado-nav">
                <ul>
                    <li><a href="index.cfm">Home</a></li>
                    <li><a href="/index.cfc?method=initCategorias">Shop</a></li>
                    <li class=""><a href="/Cart.cfc?method=init">Cart</a></li>
                    <li><a href="/Cart.cfc?method=initCheckout">Checkout</a></li>
                </ul>
            </nav>
            <!-- Button Group -->
            <div class="amado-btn-group mt-30 mb-100">
                <a href="#" class="btn amado-btn mb-15">Discounts</a>
                <a href="#" class="btn amado-btn active">New this week</a>
            </div>
            <!-- Cart Menu -->
            <div class="cart-fav-search mb-100">
                <cfif isDefined("Session.usuario") EQ False>
                    <a href="/index.cfc?method=login" class="search-nav"><img src="img/core-img/user.png" alt="" width="25px"> Log in</a>
                <cfelse>
                    <a href="/index.cfc?method=logout" class="search-nav"><img src="img/core-img/user.png" alt="" width="25px"> Log out</a>
                </cfif>
                <a href="/Cart.cfc?method=init" class="cart-nav"><img src="img/core-img/cart.png" alt=""> Cart <span>(<cfoutput>#Request.cartCount#</cfoutput>)</span></a>
                <a href="#" class="fav-nav"><img src="img/core-img/favorites.png" alt=""> Favourite</a>
                <a href="#" class="search-nav"><img src="img/core-img/search.png" alt=""> Search</a>
            </div>
            <!-- Social Button -->
            <div class="social-info d-flex justify-content-between">
                <a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
            </div>
        </header>
        <!-- Header Area End -->