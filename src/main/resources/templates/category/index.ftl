<h1>Categories</h1>

<tr>
    <#list categoryList as category>
        <td>
            <a href="/category/${category.categoryType}">
                ${category.categoryName}
            </a>
        </td>
    </#list>
</tr>
