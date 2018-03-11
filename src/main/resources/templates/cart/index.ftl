<html>
<#include "../partials/_header.ftl">
<body>
<div class="container ">
    <#include "../partials/_nav.ftl">
    <h1 align="center" class="display-4 mb-5">My Cart</h1>
    <table class="table table-striped text-center">
        <thead>
        <tr>
            <th scope="col">Photo</th>
            <th scope="col">Name</th>
            <th scope="col">Price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Subtotal</th>
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
        </tr>
        </#list>
        </tbody>
    </table>
</div>
<#function subTotal price quantity>
    <#return price*quantity>
</#function>
</body>
</html>