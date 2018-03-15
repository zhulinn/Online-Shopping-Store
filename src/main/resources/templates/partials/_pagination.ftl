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

                    <#list 1..products.getTotalPages() as index>
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

                    <#if currentPage gte products.getTotalPages()>
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