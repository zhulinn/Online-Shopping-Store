<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="/">
        <img src="/images/brand.png" width="30" height="30" class="d-inline-block align-top" alt="">
        E-Shop
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup"
            aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">

        <div class="navbar-nav">
            <#if !currentUser?? || currentUser.role=="ROLE_CUSTOMER">
                <a class="nav-item nav-link <#if category?? && category.categoryType == 0>active</#if>"
                   href="/category/0">
                    Books
                </a>
                <a class="nav-item nav-link <#if category?? && category.categoryType == 1>active</#if>"
                   href="/category/1">
                    Food
                </a>
                <a class="nav-item nav-link <#if category?? && category.categoryType == 2>active</#if>"
                   href="/category/2">
                    Clothes
                </a>
                <a class="nav-item nav-link <#if category?? && category.categoryType == 3>active</#if>"
                   href="/category/3">
                    Drink
                </a>
            </#if>
        </div>

        <div class="navbar-nav ml-auto">
            <#if !currentUser?? || currentUser.role=="ROLE_CUSTOMER"  >
                <a class="nav-item nav-link " href="/cart">
                    <i class="fa fa-shopping-cart"></i>
                    Cart
                </a>
            </#if>
            <#if currentUser?? >
                <a class="nav-item nav-link " href="/order">
                    <i class="fa fa-list-ul"></i>
                    Orders
                </a>
                <a class="nav-item nav-link " href="/profiles">
                    ${currentUser.name}
                </a>
                <a class="nav-item nav-link " href="/logout">
                    Sign Out
                </a>
            <#else>
                <a class="nav-item nav-link " href="/login">
                    Sign In
                </a>
                <a class="nav-item nav-link " href="/register">
                    Sign Up
                </a>
            </#if>
        </div>
    </div>
</nav>

<#--set all integer without comma-->
<#setting number_format="computer">
