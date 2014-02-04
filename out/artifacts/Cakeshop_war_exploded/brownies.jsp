
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>DapurKue | Product Overview</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" media="all" href="styles/960.css" />
    <link rel="stylesheet" type="text/css" media="all" href="styles/reset.css" />
    <link rel="stylesheet" type="text/css" media="all" href="styles/text.css" />
    <link rel="stylesheet" type="text/css" media="all" href="style.css" />
    <link rel="stylesheet" type="text/css" media="all" href="themes/brown/style.css" />
</head>
<%
    String keyword = "";
    if(request.getParameter("txtKeyword") != null) {
        keyword = request.getParameter("txtKeyword");
    }
%>
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
                </c:if>
                <p>Subtotal: $ 00.00</p>
                <p><span class="vChart"><a href="shoppingcart.jsp">View Cart</a></span> <span class="cOut"><a href="checkout.jsp">Checkout</a></span></p>
            </div>
        </div>
        <div id="mainMenu" class="grid_16">
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="product-overview.jsp">Cakes</a></li>
                <li><a href="product-details.jsp">Order &amp; Delivery</a></li>

            </ul>
        </div>
        <div id="stickySearch" class="grid_16">
            <div class="stickyNews grid_12 alpha">
                <p>Valentine’s BrownieCheese Special Package. <em>Free Delivery.</em> <a href="#" class="bookMan">More &raquo;</a></p>
            </div>

            <div style="position: absolute; left: 750px; top: -160px; width: 49px; height: 42px;">
                <img src="images/products/${sessionScope['loginUser']}.jpg" alt="" width="50" height="50" /></div>
            <div class="search grid_4 omega">
                <form action="Result.jsp" method="get">
                    <input type="text" value="<%=keyword%>" id="txtKeyword" name="txtKeyword"
                    onfocus="if (this.value == '<%=keyword%>') {this.value = '';}" onblur="if (this.value == '') {this.value = '<%=keyword%>';}" />
                <div style="position: absolute; left: 150px; top: 2px; width: 49px; height: 42px;">
                        <input type="submit"  value="Search"></div>
            </form>
            </div>
        </div>
        <div class="prodNav grid_16">
            <div class="prodHeadline grid_12 alpha">
                <h3>Cakes</h3>
            </div>
            <div class="browseCategory grid_4 omega">
                <form action="#" method="get">
                    <select>
                        <option>All Category</option>
                        <option>Brownimissu</option>
                        <option>Kue Tete</option>
                        <option>Bagelan</option>
                    </select>
                </form>
            </div>
        </div>

        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/Cakeshop"
                           user="root"  password="1234"/>

        <sql:query dataSource="${snapshot}" var="result">



            SELECT pid,name from product ;
        </sql:query>



        <div class="bodyContent grid_16">
            <div class="products grid_16 alpha">
                <div class="prodMenu">

                            <h4>Brownies <a href="#" class="viewAll">View All &raquo;</a></h4>
                            <c:forEach var="row" items="${result.rows}">
                            <div class="menu grid_4 alpha">
                                <p><a href="product-details.jsp?pid=${row.pid}" target="_parent" class="grid_4 alpha">
                                    <img src="images/products/${row.pid}.jpg" alt=""/></a>
                                    <a href="product-details.jsp?pid=${row.pid}" target="_parent"> <c:out value="${row.name}"/></a></p>
                            </div>

                            </c:forEach>
                    </form>









                </div>
            </div>


            <div class="commentPages grid_16">
                <ul>
                    <li><a href="#">&laquo; Prev</a></li>
                    <li><a href="#" class="commentPageActive">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">Next &raquo;</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="clear"></div>
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
<div align=center>This template  downloaded form <a href='http://all-free-download.com/free-website-templates/'>free website templates</a></div>


<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost/Cakeshop"
                   user="root"  password="1234"/>

<sql:query dataSource="${dbsource}" var="result">
    SELECT * from product;
</sql:query>


</body>
</html>