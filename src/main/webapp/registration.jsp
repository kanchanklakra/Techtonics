<%@ page import ="java.sql.*" %>
<%
	String empID = request.getParameter("empID");
	Integer emp_ID = Integer.parseInt(empID);
    String user = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "admin", "root");
    Statement st = con.createStatement();
   
    int i = st.executeUpdate("insert into members values(" + emp_ID + ",'" + fname + "','" + lname + "','" + email + "','" + user + "','" + pwd + "')");
    if (i > 0) {
        
        response.sendRedirect("welcome.jsp");
       
    } else {
        response.sendRedirect("index.jsp");
    }
%>