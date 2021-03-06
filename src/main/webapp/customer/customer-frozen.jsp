<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>



<!DOCTYPE html>
<html>
<style>
	.grid-container {
	  display: grid;
	  grid-template-columns: auto auto auto auto auto ;
	  padding: 10px;
		}
		
	.grid-item {
	  background-color: #ffffff;
	  border: 1px solid #000;
	  padding: 20px;
	  font-size: 13px;
	  text-align: center;
	  margin: 30px 20px;
	  padding: 5px 5px;
	  width: 220px;
	}
</style>
<head>
    <meta charset="UTF-8">
    <title>Giant Hypermarket | Pick-Up</title>
    <!--google font-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <!--user icon-->
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
	<link rel="stylesheet" href="../style/style.css" />
</head>
<body>
<% String custEmail = session.getAttribute("custEmail").toString();%>
   <!-- header -->
    <div class="header">
        <div class="c1">
                <div class="navigationbar">
                        <div class="logo">
                            <img src="../images/Giant_logo.png" width="85px"> &nbsp;
                        </div>
                        <div class="title">
						     <h1>Giant Hypermarket Pick-Up System</h1>
                            
                        </div>
                        <nav>
                            <ul>
                                <li><a href="customer-home.jsp">Home</a></li>
                                <li><a href="customer-about.jsp">About</a></li>
                                <li><a href="customer-contact.jsp">Contact</a></li>
                                <li><a href="customer-cart.jsp">My Cart<i class='fas fa-cart-arrow-down'></i></a>
                                  <li><%out.println(custEmail); %><i class='fas fa-user-alt'></i>
                                  <li><a href="../index.jsp">Logout<i class="fas fa-sign-out-alt"></i></a>
                                </li>                               
                            </ul>
                        </nav>
                    </div>
                    </div>
                    </div>
                    
                    <!-- nav bar menu -->
		<div class="navbar">
 			 <a href="customer-status.jsp">Order</a>
  			 <a href="customer-account.jsp">Account</a>
  			<div class="dropdown">
    			<button class="dropbtn">Product
     			 <i class="fa fa-caret-down"></i>
   			    </button>
    		<div class="dropdown-content">
    		 <a href="customer-all-product.jsp">All Product</a>
     		 <a href="customer-grocery.jsp">Grocery</a>
    		 <a href="customer-fresh.jsp">Fresh</a>
    		 <a href="customer-frozen.jsp">Frozen</a>
  		  	</div>
 		 	</div>
		</div>
					
	<!-- body page -->
		<br>
		<center><h2>Frozen Product List</h2></center>
		<div class="grid-container">
	     <%
       
	     String DB_DRIVER = "com.mysql.jdbc.Driver";
	     String DB_HOST = "jdbc:mysql://us-cdbr-east-05.cleardb.net:3306/heroku_2dc6a5dedcbc8ba";
	     String DB_USER = "be932bb0361058";
	     String DB_PASSWORD = "38a03779";

       Connection conn = null;
       Statement stat = null;
       ResultSet res = null;
       Class.forName(DB_DRIVER);
       conn = DriverManager.getConnection(DB_HOST, DB_USER, DB_PASSWORD);
       stat = conn.createStatement();
       String data = "select * from product where productCategory = 'Frozen' order by productId asc";
       res = stat.executeQuery(data);
       
       int count = 0;
       while(res.next()){
        %> 
        
  		<div class="grid-item">      
        	<div class="imgDesc">
      		<div class="imgContainer">
   					<div>      		    	
					<img src="../image-product/<%=res.getString("productImage") %>" width="150px" height="150px"/>
					<b><br><%=res.getString("productName")%></b>
					<br>RM <%=res.getString("productPrice")%>
					<br>Discount : <%=res.getString("productDiscount")%> %
					<br>Expired Date : <%=res.getString("productExpiryDate")%>
					<br>Description : <%=res.getString("productDescription")%>
					</div>
					<br>
					<div>
					<a href="add-to-cart.jsp?productId=<%=res.getString("productId")%>" class="Button cart">Add to cart<i class="fas fa-cart-plus"></i></a>
					</div>					
			</div></div></div>
          <%
       } 
        %>	
        
        </div>       
       
     <!-- footer -->
    <div class="footer">
   		 <br><p>G Icons 2021</p>
    </div>
</body>
</html>