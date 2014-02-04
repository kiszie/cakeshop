<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>DapurKue | Product Details</title>
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
                <h2>Famously Delicious </h2>
            </div>
            <div id="headright" class="grid_7 prefix_5 omega">
                <c:if test="${empty sessionScope['loginUser']}">
                    <h3 class="login">
                        <a href="login(admin).jsp">Admin</a> / <a href="login.jsp">Sign up</a> / <a href="login.jsp">Login</a></h3>
                </c:if>
                <c:if test="${not empty sessionScope['loginUser']}">
                    <a href="logout.jsp">Logout</a>
                    <a href="View-history.jsp"><c:out value="${sessionScope['loginUser']}" /></a>

                </c:if>
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
            <div class="breadcrumb grid_12 alpha"> <a href="#">Cakes</a> &raquo; <a href="#">Brownies</a> &raquo; Brownimissu</div>
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
        <div class="bodyContent grid_16">
            <div class="blogPage grid_11 alpha">
                <div class="post">
                    </p>
                </div>
                <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                                   url="jdbc:mysql://localhost/Cakeshop"
                                   user="root"  password="1234"/>

                <sql:query dataSource="${snapshot}" var="result">
                    SELECT * from product where pid=${param.pid};
                </sql:query>
                <div  class="text" STYLE="position: absolute; left: 26px; top: 106px; width: 590px; height: 619px;">

                    <img src="images/products/${param.pid}.jpg" alt=""/>
                </div>
            </div>
            <div class="sideBarProd grid_5 omega">
                <div class="sideBarWarp">
                    <form action="addToCart.jsp">
                        <c:forEach var="product" items="${result.rows}" >
                            <h3>${product.name}</h3>
                            <h4>${product.price}</h4>
                            <input type="hidden" name="price" value="${product.price}">
                        </c:forEach>
                        <p><c:out value="${param.name}"/>
                        </p>

                        <p>
                            <label for="qty">Select Qty: </label>

                            <input type="number" name="amount" step="1"/>
                        </p>
                        <p>

                            <input type="submit" value="Add to Cart" tabindex="2" name="submit" class="addCart button" />

                            <input type="hidden" value="${param.pid}" name="pid" />

                        </p>
                    </form>
                    <ul>
                        <li><a href="#"><img src="images/flickr1.jpg" alt="" /></a></li>
                        <li><a href="#"><img src="images/flickr2.jpg" alt="" /></a></li>
                        <li><a href="#"><img src="images/flickr3.jpg" alt="" /></a></li>
                        <li><a href="#"><img src="images/flickr4.jpg" alt="" /></a></li>
                    </ul>
                    <div class="clear"></div>
                </div>
                <div class="fiveStar">
                    <h4>Our Quality Guarantee</h4>
                    <p><img src="images/star.png" alt="" /> <img src="images/star.png" alt="" /> <img src="images/star.png" alt="" /> <img src="images/star.png" alt="" /> <img src="images/star.png" alt="" /></p>
                    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra.</p>
                </div>
                <p><a href="#" class="viewOrder">View Order &amp; delivery details &raquo;</a></p>
            </div>
            <div id="chooseCake" class="grid_16">
                <div class="youLike grid_16">
                    <h3>You might also like</h3>
                </div>
            </div>
            <div class="newCakes">
                <div class="newCake"><a href="#" class="grid_4"><img src="images/freshCake1.jpg" alt="" width="220" height="120" /></a></div>
                <div class="newCake"><a href="#" class="grid_4"><img src="images/freshCake2.jpg" alt="" width="220" height="120" /></a></div>
                <div class="newCake"><a href="#" class="grid_4"><img src="images/freshCake3.jpg" alt="" width="220" height="120" /></a></div>
                <div class="newCake"><a href="#" class="grid_4"><img src="images/freshCake4.jpg" alt="" width="220" height="120" /></a></div>
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