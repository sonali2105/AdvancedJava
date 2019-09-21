<%@page import="java.util.HashMap"%>
<%@page import="java.sql.*"%>
<%
    String e=request.getParameter("email");
    String p=request.getParameter("pass");
    db.DbConnect d=new db.DbConnect();
    HashMap hm=d.checkLogin(e,p);
    if(hm!=null){
        if(hm!=null){
        Integer ct=(Integer)application.getAttribute("count");
        if(ct==null){
                ct=0;
        }
       application.setAttribute("count",++ct);
       session.setAttribute("userDetails",hm);
        response.sendRedirect("Profile.jsp");
}else{
    session.setAttribute("msg","Wrong Entries!");
    response.sendRedirect("home.jsp");
}
%>

