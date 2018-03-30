<#import "/spring.ftl" as spring />
<html>
<#include "../partials/_header.ftl">
<body>
<div class="container ">
    <#include "../partials/_nav.ftl">
    <h1 align="center" class="display-4 mb-5">Edit Product</h1>
<#--<div class="text-center justify-content-center">-->
    <div style="width:40%; margin: 25px auto">
        <form action="/seller/product/${product.getProductId()}/edit" method="post">
            <@spring.bind "product"/>
        <#--Id-->
            <div class="form-group">
                <label>Code</label>
                 <@spring.bind "product.productId"/>
                <input readonly value="${product.productId!}" type="text" class="form-control form-control-lg"
                       id="productId" name="productId" required="true">
                <span class="text-danger"><@spring.showErrors ""/></span>
            </div>
        <#--Photo-->
            <div class="form-group">
                <label>Photo Link</label>
                <@spring.bind "product.productIcon"/>
                <input value="${product.productIcon!}" type="text" class="form-control form-control-lg" id="productIcon"
                       name="productIcon" placeholder="Photo">
                <span class="text-danger"><@spring.showErrors ""/></span>
            </div>

        <#--Name-->
            <div class="form-group">
                <label>Name</label>
                 <@spring.bind "product.productName"/>
                <input value="${product.productName!}" type="text" class="form-control form-control-lg" id="productName"
                       name="productName" placeholder="Name" required="true">
                <span class="text-danger"><@spring.showErrors ""/></span>
            </div>

        <#--Category-->
            <div class="form-group">
                <label>Category</label>
                <select class="custom-select custom-select-lg " id="categoryType" name="categoryType"
                        required="true">
                    <option value="0">Books</option>
                    <option value="1">Food</option>
                    <option value="2">Clothes</option>
                    <option value="3">Drink</option>
                </select>
            </div>

        <#--Description-->
            <div class="form-group">
                <label>Description</label>
                <@spring.bind "product.productDescription"/>
                <textarea class="form-control form-control-lg text-left"
                          id="productDescription" name="productDescription"
                          placeholder="Description">${product.productDescription!}
                </textarea>
                <span class="text-danger"><@spring.showErrors ""/></span>
            </div>
        <#--Price-->
            <div class="form-group">
                <label>Price</label>
                <@spring.bind "product.productPrice"/>
                <input class="form-control form-control-lg"
                       type="number"
                       id="productPrice"
                       name="productPrice"
                       step="0.01"
                       value="${product.productPrice!}"
                       required="true">
                <span class="text-danger"><@spring.showErrors ""/></span>
            </div>
        <#--Stock-->
            <div class="form-group">
                <label>Stock</label>
                <@spring.bind "product.productStock"/>
                <input class="form-control form-control-lg"
                       type="number"
                       id="productStock"
                       name="productStock"
                       min="0"
                       value="${product.productStock!}"
                       required="true">
                <span class="text-danger"><@spring.showErrors ""/></span>
            </div>
        <#--Status-->
            <div class="form-group">
                <label>Status</label>
                <select class="custom-select custom-select-lg " id="productStatus" name="productStatus" required="true">
                    <option value="0">Available</option>
                    <option value="1">Unavailable</option>
                </select>
            </div>
            <div class="form-group">
                <input type="submit" class="btn btn-lg btn-primary btn-block" value="Submit"/>
            </div>
        </form>
    <#--</div>-->

    </div>
</div>
<#include "../partials/_footer.ftl">
</body>
<script>
    $('#categoryType option[value=${product.categoryType}]').attr('selected', 'selected');
    $('#productStatus option[value=${product.productStatus}]').attr('selected', 'selected');
</script>
</html>