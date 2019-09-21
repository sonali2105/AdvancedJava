package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;

public class DbConnect {
    private Connection c;
    private Statement st;
    private PreparedStatement checkLogin,insertUser;
    public DbConnect() throws Exception{
        Class.forName("com.mysql.jdbc.Driver");
        c=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","incapp");
        st=c.createStatement();
        checkLogin=c.prepareStatement("select * from user_info where email=? and pass=?");
        insertUser=c.prepareStatement("insert into user_info values(?,?,?,?,?)");
    }
    public HashMap checkLogin(String e,String p)throws Exception{
        checkLogin.setString(1, e);
        checkLogin.setString(2, p);
        ResultSet rs=checkLogin.executeQuery();
        if(rs.next()){
            HashMap hm=new HashMap();
            hm.put("email",e);
            hm.put("name",rs.getString("name"));
            hm.put("age",rs.getInt("age"));
            hm.put("phone",rs.getString("phone"));
            return hm;
        }else{
            return null;
        }
    }
    public String insertUser(String e,String n,String ph,int a,String p)throws Exception{
        try{insertUser.setString(1, e);
        insertUser.setString(2, n);
        insertUser.setString(3, ph);
        insertUser.setInt(4,a);
        insertUser.setString(5, p);
        int x=insertUser.executeUpdate();
        if(x!=0){
            return "Done";
        }else{
            return "Failed";
        }
        }catch(java.sql.SQLIntegrityConstraintViolationException ex){
            return "Already";
        }
    }
}
