<%@ page import ="java.sql.*" %>

<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>
You are not logged in<br/>
<a href="index.jsp">Please Login</a>
<%} else {
%>
Welcome <%=session.getAttribute("userid")%>
<a href='logout.jsp'>Log out</a>
<%
    }
%>
<%

Statement statement = null;
// declare a resultset that uses as a table for output data from tha table.
ResultSet rs = null;
// Load JBBC driver "com.mysql.jdbc.Driver"
Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
/* Create a connection by using getConnection() method that takes parameters 
of string type connection url, user name and password to connect to database.*/
Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "admin", "root");
/* createStatement() is used for create statement object that is used for 
sending sql statements to the specified database. */
statement = connection.createStatement();
// sql query to retrieve values from the secified table.
String QueryString = "SELECT * from events order by eventdate desc";
rs = statement.executeQuery(QueryString);
%>
<TABLE cellpadding="15" border="1" style="background-color: #ffffcc;">
<TR>
<TD>Event Date</TD>
<TD>Title</TD>
<TD>Description</TD>
<TD>Speaker</TD>
<TD>Registration</TD>
</TR>
<%
while (rs.next()) {
%>
<TR>
<TD><%=rs.getDate(2)%></TD>
<TD><%=rs.getString(3)%></TD>
<TD><%=rs.getString(4)%></TD>
<TD><%=rs.getString(5)%></TD>
<TD><input type="checkbox" name="<%=rs.getInt(1)%>" /></TD>
</TR>
<%
} 
%>

<%
try {
// close all the connections.
rs.close();
statement.close();
connection.close();
} catch (Exception ex) {
out.println("Unable to connect to database.");
}
%>
</TABLE>