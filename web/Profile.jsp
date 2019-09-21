<%@page import="java.util.HashMap"%>
<%
HashMap hm=(HashMap)session.getAttribute("userDetails");
if(hm!=null){
String e=(String)hm.get("email");
String n=(String)hm.get("name");
String ph=(String)hm.get("phone");
int a=(Integer)hm.get("age");
out.println("<html><body>");
out.println("<h1> Login App </h1>");
out.println("Welcome: "+n+"<a href='Logout.jsp'>Logout</a> <hr>");
out.println("Email: "+e+"<br>");
out.println("Phone: "+ph+"<br>");
out.println("Age: "+a+"<br>");
Integer c=(Integer)application.getAttribute("count");
out.print("No. of Login: <b>"+c+"</b>");
out.println("</body></html>");
out.close();
}else{session.setAttribute("msg","Plz Login First!");
    response.sendRedirect("home.jsp");
}
%>