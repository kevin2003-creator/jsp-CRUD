
package modelo;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class Conexion {
    public Connection conexionBD;
    public final String bd= "db_empresa";
    public final String urlConexion = String.format("jdbc:mysql://localhost:3306/%s", bd);
    public final String usuario = "root"; 
    public final String contra = "kevinlima";
    public final String jdbc ="com.mysql.cj.jdbc.Driver";
    
    public void abrir_conexion (){
    try{
        Class.forName(jdbc);
        conexionBD = DriverManager.getConnection(urlConexion,usuario,contra);

    } catch(ClassNotFoundException | SQLException ex){
        System.out.println("Error...."+ ex.getMessage());
    
    }
    }
    public void cerrar_conexion (){
    try {
        conexionBD.close();

    }catch(SQLException ex){
                System.out.println("Error...."+ ex.getMessage());

    }
    
    
    }
    
}
