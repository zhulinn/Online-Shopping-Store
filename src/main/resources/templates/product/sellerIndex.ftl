<html>
<#include "../partials/_header.ftl">
<body>
<div class="container ">
    <#include "../partials/_nav.ftl">
    <h1 align="center" class="display-4 ">Products</h1>
    <#if currentUser.role=="ROLE_MANAGER">

        <a style="color: inherit" href="/seller/product/new" class="float-right mb-3"><i class="fas fa-plus fa-2x">Add</i>
        </a>
    </#if>
    <#include "../partials/_table.ftl">
    <#include "../partials/_pagination.ftl">

</div>
<#include "../partials/_footer.ftl">
</body>
</html>