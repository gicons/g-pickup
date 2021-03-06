<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Giant Hypermarket | Pick-Up</title>
    <!--google font-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <!--user icon-->
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
		<link rel="stylesheet" href="../style/style.css" />
	<style>
	.e{
		background-color: #6A5ACD;
		width:20%;
  		border: none;
  		color: white;
  		padding: 10px 10px;
  		text-decoration: none;
  		margin: 4px 2px;
  		margin-left: 75%;
  		padding: 15px;
  		cursor: pointer;
  		font-family: 'Poppins', sans-serif;
	
	}
	
	body {
  font-family: 'Poppins', sans-serif;
}

.overlay {
  height: 100%;
  width: 40%;
  display: none;
  position: fixed;
  z-index: 1;
  top: 0;
  right: 0;
  background-color: white;
  background-color: white;
}

.overlay-content {
  width: 100%;
  margin-left:20px;
  margin-top: 10px;
  height: 100%;
  overflow: scroll;
}

.overlay a {
  padding: 8px;
  text-decoration: none;
  font-size: 36px;
  color: #818181;
  display: block;
  transition: 0.3s;
}

.overlay a:hover, .overlay a:focus {
  color: #f1f1f1;
}

.overlay .closebtn {
  position: absolute;
  top: 20px;
  right: 45px;
  font-size: 60px;
}

@media screen and (max-height: 450px) {
  .overlay a {font-size: 20px}
  .overlay .closebtn {
  font-size: 40px;
  top: 15px;
  right: 35px;
  }
}
	.pr {
	background : #ff5c33;
	padding:15px;
	width:80%;
}

textarea{
	font-size: 15px;
	border-radius: 5px;
	border: 2px solid;
	font-family: 'Poppins', sans-serif;
	background-color: white;
  	padding: 12px 20px;
  	margin: 8px 0;
  	width:80%;
  	resize: none;
  	overflow: auto;

}

.update{
		background-color: #4CAF50;
		width:80%;
  		border: none;
  		color: white;
  		padding: 10px 10px;
  		text-decoration: none;
  		margin: 4px 2px;
  		padding: 15px;
  		cursor: pointer;
  		font-family: 'Poppins', sans-serif;
}

.ad{
	margin-left:10%;
}

.line {
			border-left: 1px solid gray;
  			height: 500px;
  			position: absolute;
  			left: 50%;
 			margin-left: -3px;
  			top: 220px;
		
		}
	
	</style>
</head>
<body>
<% String custEmail = session.getAttribute("custEmail").toString(); %>
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
	<!-- bodypage -->
	<div class="container"></div><br><br>
         <div class="admin">
         <%        
   try{ 
	   String id = session.getAttribute("id").toString(); 
	   
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
       String data = "select * from customer where custEmail='"+custEmail+"'";
       res = stat.executeQuery(data);
       
       while(res.next())
       {
   %> 
         	<table class="ad">
         		<tr height="20px"></tr>
         		<tr>
         			<td rowspan="15" style="text-align:center;"><img src="../images/user1.png" alt="Avatar" class="avatar"><br><b><%=res.getString("custName") %></b></td>
         			<td rowspan="15" width="50px"></td>
         			<td colspan="6"><b>Full Name:</b></td>
         			<td width="50px"></td>
         			<td><b>Email:</b></td>
    			</tr>
    			<tr>
    				<td colspan="6"><%=res.getString("custName") %></td>
    				<td width="50px"></td>
    				<td> <%=res.getString("custEmail") %></td>
    			</tr>
    			<tr height="20px"></tr>
    			<tr>
    				<td colspan="6"><b>Phone No:</b></td>
    				<td width="50px"></td>
         			<td><b>Gender:</b></td>
    			</tr>
    			<tr>
    				<td colspan="6"><%=res.getString("custPhoneNum") %></td>
    				<td width="50px"></td>
    				<td><%=res.getString("custGender") %></td>
    			</tr>
    			<tr height="20px"></tr>
    			<tr>
    				<td width="50px"><b>Address:</b></td>
    			</tr>
    			<tr>
    				<td width="50px" colspan="8"><%=res.getString("custAddress") %></td>
    			</tr>
    			<tr height="20px"></tr>
    			<tr>
    				<td colspan="6"><b>City:</b></td>
    				<td width="50px"></td>
    				<td><b>State:</b></td>
    			</tr>
    			<tr>
    				<td colspan="6"><%=res.getString("custCity") %></td>
    				<td width="50px"></td>
    				<td><%=res.getString("custState") %></td>
    			</tr>
    			<tr height="20px"></tr>
    			<tr>
    				<td><b>Postcode:</b></td>
    			</tr>
    			<tr>
    				<td><%=res.getString("custPostcode") %></td>
    			</tr>
    		</table>
         	<button class="e" onclick="openNav()">Edit Account</button><br>        	
           <br>

         </div>
         <br><br>
             
    <div id="myNav" class="overlay">
  	<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <div class="overlay-content">
  <br>
  <div class="pr">
    <h2 style="text-align:center">Edit Account</h2>
   </div>
 		<br><br>
 		<form class="editing" action="custUpdate.jsp" method="post">
 			Full Name:<br><br>
 			<input type="text" name="name" value="<%=res.getString("custName") %>">
 			<br><br>
 			Gender:<br><br>
 			<input type="text" name="gender" value="<%=res.getString("custGender") %>">
 			<br><br>
 			Email:<br>
 			<input type="text" name="email" value="<%=res.getString("custEmail") %>">
 			<br><br>
 			Phone No:<br>
 			<input type="text" name="phone" value="<%=res.getString("custPhoneNum") %>">
 			<br><br>
 			Address:<br>
 			<textarea name="address"><%=res.getString("custAddress") %></textarea>
 			<br><br>
 			City:<br>
 			<input type="text" name="city" value="<%=res.getString("custCity") %>">
 			<br><br>
 			Postcode:<br>
 			<input type="number" name="postcode" value="<%=res.getString("custPostcode") %>">
 			<br><br>
 			State:<br>
 			<input type="text" name="state" value="<%=res.getString("custState") %>"><br><br>
 			<button class="update">Update</button> 			
 			
 		</form>
  </div>
</div>
<script>
function openNav() {
  document.getElementById("myNav").style.display = "block";
}

function closeNav() {
  document.getElementById("myNav").style.display = "none";
}
</script> 
 <%
       }
   }
catch(Exception e)
   {
   		System.out.println(e);
   }
%>  
    
    <!-- footer -->
    <div class="footer">
    <br>
    <p>G Icons 2021</p>
    
    </div>
</body>
</html>

     