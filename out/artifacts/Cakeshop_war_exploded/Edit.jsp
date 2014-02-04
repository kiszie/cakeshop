
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>DapurKue | Login</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" media="all" href="styles/960.css" />
    <link rel="stylesheet" type="text/css" media="all" href="styles/reset.css" />
    <link rel="stylesheet" type="text/css" media="all" href="styles/text.css" />
    <link rel="stylesheet" type="text/css" media="all" href="style.css" />
    <link rel="stylesheet" type="text/css" media="all" href="themes/brown/style.css" />
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
                        <a href="login(admin).jsp">Admin</a> / <a href="login.jsp">Sign up</a> / <a href="login.jsp">Login</a></h3>
                </c:if>
                <c:if test="${not empty sessionScope['loginUser']}">
                    <a href="logout.jsp">Logout
                        <c:out value="${sessionScope['loginUser']}" />
                    </a>
                </c:if>
                <p>Subtotal: $ 00.00</p>
                <p><span class="vChart"><a href="shoppingcart.jsp">View Cart</a></span> <span class="cOut"><a href="checkout.jsp">Checkout</a></span></p>
            </div>
        </div>
        <div id="mainMenu" class="grid_16">
            <ul>
                <li><a href="index(Admin).jsp" class="aActive">Home</a></li>
                <li><a href="AllProduct.jsp" target="_parent">All Product</a></li>
                <li><a href="update.jsp">Add new product</a></li>
                <li><a href="View-History(Admin).jsp">View history</a></li>

            </ul>
        </div>
        <div id="stickySearch" class="grid_16">
            <div class="stickyNews grid_12 alpha">
                <p>Valentine’s BrownieCheese Special Package. <em>Free Delivery.</em> <a href="#" class="bookMan">More &raquo;</a></p>
            </div>

            <div style="position: absolute; left: 750px; top: -160px; width: 49px; height: 42px;">
                <img src="images/products/"${sessionScope['loginAdmin']}"" alt="" width="50" height="50" /></div>

            <div class="search grid_4 omega">
                <form action="#" method="get">
                    <input type="text" value="Type your keyword" id="s" name="s" onfocus="if (this.value == 'Type your keyword') {this.value = '';}" onblur="if (this.value == '') {this.value = 'Type your keyword';}" />
                </form>
            </div>
        </div>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/Cakeshop"
                           user="root"  password="1234"/>

        <sql:query dataSource="${snapshot}" var="result">
            SELECT * from product where pid=${param.pid};
        </sql:query>
        <div class="checkout grid_16">
            <c:forEach var="row" items="${result.rows}">
            <div class="newAccount grid_8 alpha">
                <h4>Create New Account</h4>
                <form method="post" action="Editproduct.jsp">
                    <fieldset>

                        <label for="name">Product Name: </label>
                        <input type="hidden" tabindex="2" size="22" value="${param.pid}"  name="pid" class="text" />
                        <input type="text" tabindex="2" size="22" value="${row.name}" id="name" name="name" class="text" />
                        <br />
                        <label for="description">Product Description: </label>
                        <input type="text" tabindex="2" size="22" value="${row.description}" id="description" name="description" class="text" />
                        <br />  
                        <label for="price">Product price: </label>
                        <input type="text" tabindex="2" size="22" value="${row.price}" id="price" name="price" class="text" />
                        <br />
                        <label for="keyword">Keyword: </label>
                        <input type="text" tabindex="2" size="22" value="${row.keyword}" id="keyword" name="keyword" class="text" />
                        <br />
                        <label for="picture">Picture:</label>
                        <input type="text" tabindex="6" size="50" value="${row.picture}" id="picture" name="picture" class="text" />
                        <br />
                        <input type="file" name="datafile" size="40">
                        <div style="position: absolute; left: 372px; top: 355px;"><input type="submit" value="Edit" name="Edit" /></div>
                        <div class="clear"></div>
                    </fieldset>


                    <input type="hidden" value="30" />
                </form>
            </div>
            </c:forEach>
        </div>

    </div>

    <div class="clear"></div>
</div>
<div id="richContent2">
    <div class="container_16">
        <div class="lastTweet grid_4">
            <h4>Latest Tweets</h4>
            <p><a href="#">@someone</a> yes indeed this is one hell of a free css template! <a href="#">Read More</a> <span><em>15 minutes ago</em></span></p>
            <p><a href="#">@someone</a> yes indeed this is one hell of a free css template! <a href="#">Read More</a> <span><em>15 minutes ago</em></span></p>
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
                <li><a href="#">Delivery Terms &amp; Pricing</a></li>
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