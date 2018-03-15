<html>
<#include "../partials/_header.ftl">
<body>
<div class="container ">
    <#include "../partials/_nav.ftl">
    <h1 align="center" class="display-4 mb-5">Orders</h1>

    <table class="table table-striped text-center">
        <thead>
        <tr>
            <th scope="col">Order #</th>
            <th scope="col">Customer Name</th>
            <th scope="col">Customer Email</th>
            <th scope="col">Customer phone</th>
            <th scope="col">Shipping Address</th>
            <th scope="col">Total</th>
            <th scope="col">Order Data</th>
            <th scope="col">Status</th>
            <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <#list orders.content as order>
        <tr>
            <th class="align-middle" scope="row">
                ${order.getOrderId()?c}
            </th>
            <td class="align-middle">${order.getBuyerName()}</td>
            <td class="align-middle">${order.getBuyerEmail()}</td>
            <td class="align-middle">${order.getBuyerPhone()}</td>
            <td class="align-middle">${order.getBuyerAddress()}</td>
            <td class="align-middle">${order.getOrderAmount()?string.currency}</td>
            <td class="align-middle">${order.getCreateTime()}</td>
            <td class="align-middle">${statusArray[order.getOrderStatus()]}</td>
            <td class="align-middle">
                <#--New Order has actions-->
                    <#if !(currentUser.role == "ROLE_CUSTOMER" && currentUser.email != order.getBuyerEmail())>
                        <a style="display: block" href="/order/show/${order.getOrderId()}">
                            Show</a>
                        <#if order.getOrderStatus() == 0>
                            <a style="display: block" href="/order/cancel/${order.getOrderId()}">
                                Cancel</a>
                        </#if>
                    </#if>

                    <#if currentUser.role != "ROLE_CUSTOMER" && order.getOrderStatus() == 0>
                        <a style="display: block" href="/order/finish/${order.getOrderId()}">
                            Finish</a>
                    </#if>


            </td>

        </tr>
        </#list>
        </tbody>
    </table>

    <#--pagination-->
    <div class="col-md-12 column">
        <ul class="pagination justify-content-end">
                    <#if currentPage lte 1>
                           <li class="page-item disabled">
                               <a class="page-link" href="#">Previous</a>
                           </li>
                    <#else>
                           <li class="page-item">
                               <a class="page-link" href="?page=${currentPage - 1}&size=${size}">Previous</a>
                           </li>
                    </#if>


                    <#list 1..orders.getTotalPages() as index>
                        <#if currentPage == index>
                           <li class="page-item active ">
                               <a class="page-link" href="#">${index}</a>
                           </li>
                        <#elseif index != 0>
                            <li class="page-item">
                                <a class="page-link" href="?page=${index}&size=${size}">${index}</a>
                            </li>
                        </#if>
                    </#list>

                    <#if currentPage gte orders.getTotalPages()>
                            <li class="page-item disabled">
                                <a class="page-link" href="#">Next</a>
                            </li>
                    <#else>
                            <li class="page-item">
                                <a class="page-link" href="?page=${currentPage + 1}&size=${size}">Next</a>
                            </li>
                    </#if>
        </ul>
    </div>
</div>
<#include "../partials/_footer.ftl">
</body>
</html>