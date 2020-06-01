import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

class OraTest {

  public static void main( String[] args ) {
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
      System.out.println( "GetColumnCount: " + colCount );
      while ( rs.next() ) {
        System.out.println( rs.getString( 1 ) );
      }
      rs.close();
      ps.close();
      conn.close();
    } catch( Exception e ) {
      e.printStackTrace();
    }

  }

}
     
