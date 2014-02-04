<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
                <h1><a href="index(Admin).jsp">DapurKue</a></h1>
                <h2>Famously Delicious</h2>
            </div>

            <div id="headright" class="grid_7 prefix_5 omega">



                <c:if test="${empty sessionScope['loginUser']}">
                    <h3 class="login">
                        <a href="login(admin).jsp">Admin/</a><a href="login.jsp">Sign up</a> / <a href="login.jsp">Login</a></h3>

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

        <div id="stickySearch" class="grid_16">

        </div>
        <div class="checkout grid_16">
                <div class="loginPage grid_8 omega">
                <h4>Login</h4>
                <form method="post" action="loginAdminChecking.jsp">

                    <fieldset>
                        <label for="username2">Username:</label>
                        <input type="text" tabindex="1" size="50" value="" id="username2" name="username2" class="text" />
                        <br />
                        <label for="password2">Password:</label>
                        <input type="password" tabindex="2" size="22" value="" id="password2" name="password2" class="text" />
                        <br />


                        <div class="clear"></div>
                    </fieldset>
                    <p>
                        <input type="submit" value="Login" tabindex="3" name="update" class="userLogin" />
                    </p>
                    <input type="hidden" value="30" />
                </form>
            </div>
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