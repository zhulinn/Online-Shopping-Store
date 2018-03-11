<html>
<#include "../partials/_header.ftl">
<body>
<div class="container  ">
    <#include "../partials/_nav.ftl">
    <h1 align="center" class="display-4 mb-5">Product Detail</h1>
    <div class="row text-center justify-content-md-center">
        <div class="col-lg-6 ">
            <div class="card mb-4 ">
                <img height="50%" class="card-img-top" src="${productInfo.getProductIcon()}">
                <div class="card-body">
                    <h4 class="card-title ">${productInfo.getProductName()}</h4>
                    <div class="text-left">
                        <p class="card-test"><strong>Description: </strong>${productInfo.getProductDescription()}</p>
                        <p class="card-text"><strong>Price: </strong>${"$"}<label
                                id="price">${productInfo.getProductPrice()}</label></p>
                        <p class="card-text"><strong>Stock: </strong>${productInfo.getProductStock()}</p>

                        <label class="card-text" for="quantity">
                            <strong>Quantity: </strong>
                        </label><input type="number"
                                       id="quantity"
                                       value="1"
                                       min="0"
                                       max="${productInfo.getProductStock()}"
                                       onchange="chageSubtotal()">
                        <p class="card-text"><strong>Subtotal: </strong><label id="subtotal">${productInfo.getProductPrice()}</label></p>
                    </div>
                    <a class="btn btn-primary btn-lg <#if productInfo.getProductStatus()==1>disabled</#if>"
                       href="/product/${productInfo.getProductId()}">Get It!</a>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function chageSubtotal() {
        document.getElementById("subtotal").innerHTML = parseFloat(document.getElementById("quantity").value) * parseFloat(document.getElementById("price").innerHTML);
    }
</script>
</body>
</html>