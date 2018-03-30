<table id="table" class="table table-striped text-center" style="width:100%;">
    <thead>
    <tr>

        <th scope="col">Photo</th>
        <th scope="col">Code</th>
        <th scope="col">Name</th>
        <th scope="col">Type</th>
        <th scope="col">Description</th>
        <th scope="col">Price</th>
        <th scope="col">Stock</th>
        <th scope="col">Status</th>
        <th scope="col">Action</th>

    </tr>
    </thead>
    <tbody>
        <#list products.content as productInfo>
        <tr>
            <th class="align-middle" scope="row">
                <img height="100px" src="${productInfo.getProductIcon()}">
            </th>
            <td class="align-middle">${productInfo.getProductId()}</td>
            <td class="align-middle">${productInfo.getProductName()}</td>
            <td class="align-middle">${categoryArray[productInfo.getCategoryType()]}</td>
            <td class="align-middle">${productInfo.getProductDescription()}</td>
            <td class="align-middle">${productInfo.getProductPrice()?string.currency}</td>
            <td class="align-middle">${productInfo.getProductStock()}</td>
            <td class="align-middle">${statusArray[productInfo.getProductStatus()]}</td>
            <td class="align-middle">
                <a style="display: block" href="/seller/product/${productInfo.getProductId()}/edit">
                    Edit</a>
                <#if currentUser.role=="ROLE_MANAGER">
                    <a style="display: block" href="/seller/product/${productInfo.getProductId()}/delete">
                        Remove</a>
                </#if>

            </td>

        </#list>
    </tbody>
</table>

