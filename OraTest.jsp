<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<%
    String path = "jdbc:oracle:thin:@localhost:1521:XE";
    String id = "system";
    String pw = "manager";
    String sql = "select banner from v$version where con_id >= ?";

    try {
      Connection conn = DriverManager.getConnection( path, id, pw );
      PreparedStatement ps = conn.prepareStatement( sql );
      ps.setInt( 1, 0 );
      ResultSet rs = ps.executeQuery();
      int colCount = rs.getMetaData().getColumnCount();
      out.println( "GetColumnCount: " + colCount );
      while ( rs.next() ) {
        out.println( rs.getString( 1 ) );
      }
      rs.close();
      ps.close();
      conn.close();
    } catch( Exception e ) {
      e.printStackTrace();
    }

%>

