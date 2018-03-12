<html>
<#include "../partials/_header.ftl">
<body>
<div class="container ">
    <#include "../partials/_nav.ftl">
    <h1 align="center" class="display-4 mb-5">My Cart</h1>

    <#--Cart Detail Table-->
    <table class="table table-striped text-center">
        <thead>
        <tr>
            <th scope="col">Photo</th>
            <th scope="col">Name</th>
            <th scope="col">Price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Subtotal</th>
            <th scope="col">Action</th>

        </tr>
        </thead>
        <tbody>
        <#list items as item>
        <tr>
            <th class="align-middle" scope="row">
                <img height="100px" src="${item.getProductInfo().getProductIcon()}">
            </th>
            <td class="align-middle">${item.getProductInfo().getProductName()}</td>
            <td class="align-middle">${"$" + item.getProductInfo().getProductPrice()}</td>
            <td class="align-middle">${item.getQuantity()}</td>
            <td class="align-middle">${"$" + item.getProductInfo().getProductPrice() * item.getQuantity()}</td>
            <td class="align-middle">
                <a href="/cart/remove?product_id=${item.getProductInfo().getProductId()}">Remove</a>
            </td>

        </tr>
        </#list>
        </tbody>
    </table>

    <#--Empty Cart-->
    <#if !items?has_content >
        <div>
            <h4 class="text-muted text-center">Cart is empty. Go to get something! :)</h4>
        </div>
    <#else>
    <#--Check Out -->
        <div>
            <h5 style="display: inline;">Total: $${total}</h5>
            <a class="btn btn-warning float-right" href="/cart/checkout">Checkout</a>
        </div>

    </#if>
</div>
</body>
</html>