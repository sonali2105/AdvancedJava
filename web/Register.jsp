<%@page import="java.util.HashMap"%>
<%@page import="java.sql.*"%>
<%
    String e=request.getParameter("email");
    String n=request.getParameter("name");
    String ph=request.getParameter("phone");
    int a=Integer.parseInt(request.getParameter("age"));
    String p=request.getParameter("pass");
    db.DbConnect d=new db.DbConnect();
    String s=d.insertUser(e, n, ph, a, p);
    if(s.equalsIgnoreCase("Done")) {
        Integer ct=(Integer)application.getAttribute("count");
        if(ct==null){
                ct=0;
        }
        application.setAttribute("count",++ct);
        HashMap hm=new HashMap();
       hm.put("email",e);
       hm.put("name",n);
       hm.put("age",a);
       hm.put("phone",ph);
       session.setAttribute("userDetails",hm);
        response.sendRedirect("Profile.jsp");
}else if(s.equalsIgnoreCase("Already")) {
    session.setAttribute("msg","Email ID Already Registered!");
    response.sendRedirect("home.jsp");
}else{
session.setAttribute("msg","Registration Failed!");
response.sendRedirect("home.jsp");
}
%>
