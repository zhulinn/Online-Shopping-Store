<html>
<#include "../partials/_header.ftl">
<body>
<div class="container ">
    <#include "../partials/_nav.ftl">
    <h1 align="center" class="display-4 mb-5">Get Whatever You Want!</h1>
    <form class="form-inline">
        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
    <#include "../partials/_cards.ftl">
    <#include "../partials/_pagination.ftl">
</div>
<#include "../partials/_footer.ftl">
</body>
</html>