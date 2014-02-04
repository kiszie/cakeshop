<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>DapurKue | ShoppingCart</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" media="all" href="styles/960.css" />
    <link rel="stylesheet" type="text/css" media="all" href="styles/reset.css" />
    <link rel="stylesheet" type="text/css" media="all" href="styles/text.css" />
    <link rel="stylesheet" type="text/css" media="all" href="style.css" />
    <link rel="stylesheet" type="text/css" media="all" href="themes/brown/style.css" />
    <s:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
                     url="jdbc:mysql://localhost/Cakeshop"
                     user="root" password="1234"/>
</head>
<body>
<div id="warp">
    <div id="main" class="container_16">
        <div id="header" class="grid_16">
            <div id="logo" class="grid_4 alpha">
                <h1><a href="index.jsp">DapurKue</a></h1>
                <h2>Famously Delicious</h2>
            </div>
            <div id="headright" class="grid_7 prefix_5 omega">
                <c:if test="${empty sessionScope['loginUser']}">
                    <h3 class="login">
                        <a href="login(admin).jsp">Admin/</a><a href="login.jsp">Sign up</a> / <a href="login.jsp">Login</a></h3>
                </c:if>
                <c:if test="${not empty sessionScope['loginUser']}">
                    <a href="logout.jsp">Logout</a>
                    <a href="View-history.jsp"><c:out value="${sessionScope['loginUser']}" /></a>
                    <div style="position: absolute; left: 500px; top: 2px; width: 49px; height: 42px;">
                        <img src="images/admin/${sessionScope['loginAdmin']}.jpg" alt="" width="50" height="50" /></div>
                    <p><span class="vChart"><a href="shoppingcart.jsp">View Cart</a></span> <span class="cOut"><a href="checkout.jsp">Checkout</a></span></p>
                </c:if>


            </div>
        </div>
        <div id="mainMenu" class="grid_16">
            <ul>
                <li><a href="index.jsp" class="aActive">Home</a></li>
                <li><a href="product-overview.jsp">Cakes</a></li>
                <li><a href="product-details.jsp">Order &amp; Delivery</a></li>

            </ul>
        </div>
        <div id="stickySearch" class="grid_16">
            <div class="stickyNews grid_12 alpha">
                <p>Valentine’s BrownieCheese Special Package. <em>Free Delivery.</em> <a href="#" class="bookMan">More &raquo;</a></p>
            </div>
            <div class="search grid_4 omega">
                <%
                    String keyword = "";
                    if(request.getParameter("txtKeyword") != null) {
                        keyword = request.getParameter("txtKeyword");
                    }
                %>
                <form action="Result.jsp" method="get">
                    <input type="text" value="<%=keyword%>" id="txtKeyword" name="txtKeyword"
                           onfocus="if (this.value == '<%=keyword%>') {this.value = '';}" onblur="if (this.value == '') {this.value = '<%=keyword%>';}" />
                    <div style="position: absolute; left: 150px; top: 2px; width: 49px; height: 42px;">
                        <input type="submit"  value="Search"></div>
                </form>
            </div>
        </div>
        <div class="prodNav grid_16">
            <div class="prodHeadline grid_16">
                <h3>Your Shopping Cart</h3>
            </div>
        </div>
        <div class="bodyContent grid_16">
            <s:query dataSource="${ds}" var="selectQ">
                select * from addcart
                where cartID=${sessionScope['cartID']}
            </s:query>

            <div class="CSSTableGenerator">
                <table>
                    <tr>
                        <th>Product ID</th>
                        <th>Product Name</th>
                        <th>Product Description</th>
                        <th>Price per unit</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th> </th>
                    </tr>
                    <c:set var="totalprice" value="0"></c:set>
                    <c:set var="totalquantity" value="0"></c:set>
                    <c:forEach items="${selectQ.rows}" var="addcart">
                        <s:query dataSource="${ds}" var="result">
                            select name,description from product
                            where pid=${addcart.pid}
                        </s:query>
                        <tr> <td>${addcart.pid}</td>
                            <c:forEach items="${result.rows}" var="product">
                                <td>${product.name}</td>
                                <td>${product.description}</td>
                            </c:forEach>

                            <td>${addcart.price}</td>

                            <td>${addcart.amount}</td>
                            <td>${addcart.price*addcart.amount}</td>
                            <c:set var="totalprice" value="${totalprice+addcart.price*addcart.amount}"></c:set>
                            <c:set var="totalquantity" value="${totalquantity+addcart.amount}"></c:set>
                            <td><a href="removeFromCart.jsp?addcartID=${addcart.addcartID}">remove</a></td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <th> </th>
                        <th> </th>
                        <th> </th>
                        <th>Total Price</th>
                        <th>${totalquantity}</th>
                        <th>${totalprice}</th>
                        <th> </th>
                    </tr>
                </table>
            </div>
            <div class="buttonCart grid_16 alpha">
                <div style="position: absolute; left: 3px; top: 0px; width: 173px;">
                    <a href="product-overview.jsp" target="_parent"><input type="button" value="Continue Shopping" name="Continue Shopping" class="continueShop" /></a></div>
                <div style="position: absolute; left: 176px; top: 0px; width: 126px;">
                    <a href="checkout.jsp?totalquantity=${totalquantity}&totalprice=${totalprice}"><input type="submit" value="Checkout" name="Checkout" class="checkoutCart" />
                </div>

                <div class="clear"></div>
            </div>
            <div id="chooseCake" class="grid_16">
                <div class="youLike grid_16">
                    <h3>You might also like</h3>
                </div>
            </div>
            <div class="newCakes">
                <div class="newCake"><a href="product-details.html" class="grid_4"><img src="images/freshCake1.jpg" alt="" width="220" height="120" /></a></div>
                <div class="newCake"><a href="product-details.html" class="grid_4"><img src="images/freshCake2.jpg" alt="" width="220" height="120" /></a></div>
                <div class="newCake"><a href="product-details.html" class="grid_4"><img src="images/freshCake3.jpg" alt="" width="220" height="120" /></a></div>
                <div class="newCake"><a href="product-details.html" class="grid_4"><img src="images/freshCake4.jpg" alt="" width="220" height="120" /></a></div>
            </div>
        </div>
    </div>
    <div class="clear"></div>
</div>
<div id="richContent">
    <div class="container_16">
        <div class="popularCakes grid_4">
            <h4>Popular Cakes</h4>
            <ul>
                <li><a href="#">Ultimate Choco Brownie</a></li>
                <li><a href="#">Mokakokoa Brownie</a></li>
                <li><a href="#">CoffeeBrown</a></li>
                <li><a href="#">Delicacheese</a></li>
                <li><a href="#">Berries Cheesecake</a></li>
            </ul>
        </div>
        <div class="recommended grid_4">
            <h4>Recommended</h4>
            <ul>
                <li><a href="#">Ultimate Choco Brownie</a></li>
                <li><a href="#">Mokakokoa Brownie</a></li>
                <li><a href="#">CoffeeBrown</a></li>
                <li><a href="#">Delicacheese</a></li>
                <li><a href="#">Berries Cheesecake</a></li>
            </ul>
        </div>
        <div class="specialOffer grid_4">
            <h4>Special Offer</h4>
            <ul>
                <li><a href="#">Ultimate Choco Brownie</a></li>
                <li><a href="#">Mokakokoa Brownie</a></li>
                <li><a href="#">CoffeeBrown</a></li>
                <li><a href="#">Delicacheese</a></li>
                <li><a href="#">Berries Cheesecake</a></li>
            </ul>
        </div>
        <div class="orderPhone grid_4">
            <h4><em>Order by Phone</em> <span>987-654-321</span></h4>
        </div>
        <div class="clear"></div>
    </div>
</div>
<div id="richContent2">
    <div class="container_16">
        <div class="fromBlog grid_4">
            <h4>From the blog</h4>
            <h5>New Recipes in Our Basket</h5>
            <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum... <a href="#" class="bookMan">more &raquo;</a></p>
        </div>
        <div class="corporateInfo grid_4">
            <h4>Corporate Info</h4>
            <ul>
                <li><a href="#">Privacy Policy</a></li>
                <li><a href="#">Term &amp; Conditions</a></li>
                <li><a href="#">Franchise</a></li>
                <li><a href="#">About us</a></li>
                <li><a href="#">FAQ</a></li>
            </ul>
        </div>
        <div class="storeDelivery grid_4">
            <h4>Store &amp; Delivery</h4>
            <ul>
                <li><a href="#">Store Locator</a></li>
                <li><a href="#">Delivery Terms &amp;amp Pricing</a></li>
                <li><a href="#">Delivery Coverage</a></li>
                <li><a href="#">Gift Services</a></li>
                <li><a href="#">Track my order</a></li>
            </ul>
        </div>
        <div class="socialNet grid_4">
            <h4>Keep in touch</h4>
            <ul>
                <li><a href="#" class="facebook">Facebook</a></li>
                <li><a href="#" class="twitter">Twitter</a></li>
                <li><a href="#" class="feed">Feed</a></li>
            </ul>
        </div>
        <div class="clear"></div>
    </div>
</div>
<div id="footer">
    <div class="container_16">
        <div class="copyright grid_16">
            <p class="left">Copyright &copy; 2010, Your Company Here, All Rights Reserved</p>
            <p class="right"><a href="http://all-free-download.com/free-website-templates/">Free CSS Templates</a> by <a href="http://tokokoo.com/">Tokokoo</a> &amp; <a href="http://www.instantshift.com/">instantShift</a></p>
            <div class="clear"></div>
        </div>
        <div class="clear"></div>
    </div>
</div>
<div align=center>This template  downloaded form <a href='http://all-free-download.com/free-website-templates/'>free website templates</a></div></body>
</html>