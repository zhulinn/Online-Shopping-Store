<div class="row text-center card-deck">
<#list products.content as productInfo>
    <div class=" col-md-4 col-sm-6 "">
    <div class="card mb-4 ">
        <img  height="400" class="card-img-top" src="${productInfo.getProductIcon()}">
        <div class="card-body">
            <h4 class="card-title">${productInfo.getProductName()}</h4>
            <p class="card-subtitle">${productInfo.getProductDescription()}</p>
            <p class="card-text">${"$"}${productInfo.getProductPrice()}</p>
            <a class="btn btn-primary btn-lg" href="/product/${productInfo.getProductId()}">Get It!</a>
        </div>
    </div>
         </div>
</#list>
    </div>