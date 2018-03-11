<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/product">Online Shopping</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <div class="navbar-nav">
            <a class="nav-item nav-link <#if category?? && category.categoryType == 0>active</#if>" href="/category/0">Books</a>
            <a class="nav-item nav-link <#if category?? && category.categoryType == 1>active</#if>" href="/category/1">Food</a>
            <a class="nav-item nav-link <#if category?? && category.categoryType == 2>active</#if>" href="/category/2">Clothes</a>
            <a class="nav-item nav-link <#if category?? && category.categoryType == 3>active</#if>" href="/category/3">Drink</a>

        </div>
    </div>
</nav>