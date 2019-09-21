<html>
    <body>
       <%
    String m=(String)session.getAttribute("msg");
    if(m!=null){
%>
<hr><%= m %><hr>
<%
    session.setAttribute("msg",null);
    }
%>    
<h1> Login App </h1>
<form action='Login.jsp' method='post'>
Email: <input type='email' name='email' required/> <br><br>
Password: <input type='password' name='pass' required/> <br><br>
<input type='submit' value='LOGIN'/>
</form>
<hr>
<h3> New User Registration </h3>
<form action='Register.jsp' method='post'>
Email: <input type='email' name='email' required/> <br><br>
Name: <input type='text' name='name' required/> <br><br>
Phone: <input type='number' name='phone' required/> <br><br>
Age: <input type='number' name='age' required/> <br><br>
Password: <input type='password' name='pass' required/> <br><br>
<input type='submit' value='Register'/>
</form>
</body>
</html>
 
