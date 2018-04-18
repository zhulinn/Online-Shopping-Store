# Online-Shopping-Store
A web application for online shopping with Spring Boot, FreeMarker &amp; Hibernate

<strong>Stacks: </strong>Spring Boot, Spring Security, FreeMarker, Spring Data JPA...
<img src="https://raw.githubusercontent.com/zhulinn/zhulinn.github.io/hexo/source/uploads/post_pics/shop-cart.png">

## How to run
1. Configue datasource in `application.yml`. Here I use PostgreSQL.
2. The inial data is be imported automatically by `import.sql`
3. Run `OnlineShoppingApplication.java`.


## About
There is a login and registration functionality included.  
There are three roles for user, such as customer, employee, mangager.  
**Customer**: The users with this role can shop for products. Each user has his own shopping cart (session functionality).add items into cart, view list of items and checkout. Checkout is transactional.  
**EMPLOYEE**: The users with this role can view list of  orders, details of an orderMain and their profile.  
**MANAGER**: The users with this role can view list of orders, details of an orderMain and their profile, add and edit products.  
  
Demo :point_right: [E-Shop](https://e-shop-.herokuapp.com/)  
The demo is deployed on [Heroku](https://www.heroku.com/), using PostgreSQL as database.  
  
**Optimise**
1. Memory Optimazation with Redis  
2. Distributed Lock with Redis for concurrency  
  
## Still on process...
