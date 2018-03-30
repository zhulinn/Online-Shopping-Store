<html>
<#include "../partials/_header.ftl">
<body>
<div class="container ">
    <#include "../partials/_nav.ftl">
    <h1 align="center" class="display-4 mb-5">Order Detail</h1>

<#--Cart Detail Table-->
    <table class="table table-striped text-center">
        <thead>
        <tr>
            <th scope="col">Photo</th>
            <th scope="col">Name</th>
            <th scope="col">Description</th>
            <th scope="col">Price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Subtotal</th>

        </tr>
        </thead>
        <tbody>
        <#list items as item>
        <tr>
            <th class="align-middle" scope="row">
                <img height="100px" src="${item.getProductIcon()}">
            </th>
            <td class="align-middle">${item.getProductName()}</td>
            <td class="align-middle">${item.getProductDescription()}</td>
            <td class="align-middle">${item.getProductPrice()?string.currency}</td>
            <td class="align-middle">${item.getProductQuantity()}</td>
            <td class="align-middle">${(item.getProductPrice() * item.getProductQuantity())?string.currency}</td>
        </tr>
        </#list>
        </tbody>
    </table>
</div>
<#include "../partials/_footer.ftl">
</body>
</html>