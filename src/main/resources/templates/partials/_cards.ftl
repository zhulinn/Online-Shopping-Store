    <div class="row card-deck text-center">
        <#list products.content as productInfo>
            <div class="col-lg-4 ">
                <div class="card mb-4 ">
                    <img height="50%" class="card-img-top" src="${productInfo.getProductIcon()}">
                    <div class="card-body">
                        <h4 class="card-title ">${productInfo.getProductName()}</h4>
                        <div class="text-left">
                            <p class="card-test"><strong>Description: </strong>${productInfo.getProductDescription()}</p>
                            <p class="card-text"><strong>Price: </strong>${productInfo.getProductPrice()?string.currency}</p>
                            <p class="card-text"><strong>Stock: </strong>${productInfo.getProductStock()}</p>
                        </div>
                        <a class="btn btn-primary btn-lg <#if productInfo.getProductStatus()==1>disabled</#if>"
                           href="/product/${productInfo.getProductId()}">Get It!</a>
                    </div>
                </div>
            </div>
        </#list>
    </div>