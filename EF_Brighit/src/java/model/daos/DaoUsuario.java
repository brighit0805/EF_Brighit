/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package model.daos;
import model.beans.Usuario;
import java.sql.ResultSet;
/**
 *
 */
public class DaoUsuario extends Dao{
    
    private String table_name = " usuario ";
    public void insertar(Usuario obj){
        String sql = "INSERT INTO "+this.table_name+" (nombre, apellido, correo, clave, tipo) ";
        sql += " VALUES ('"+obj.getNombre()+"','"+obj.getApellido()+"', '"+obj.getCorreo()+"', '"+obj.getClave()+"','"+obj.getTipo()+"' ) ";
        this.ExecuteUpdate(sql);   
    }
    
    public Usuario getUsuarioByEmail(String correo){
        
        Usuario user = new Usuario();
        try{
            String sql = "SELECT * FROM usuario WHERE correo='"+correo+"' LIMIT 1;";
            ResultSet rs = this.ExecuteQuery(sql);


            while (rs.next())
            {
              user.setId(rs.getInt("id"));
              user.setNombre(rs.getString("nombre"));
              user.setApellido(rs.getString("apellido"));
              user.setCorreo(rs.getString("correo"));
              user.setClave(rs.getString("clave"));
              user.setTipo(rs.getString("tipo"));

            }
        }catch(Exception e){
            this.last_err = e.getMessage();
        }
        
        
        return user;
    }
    
    public Usuario getUsuarioById(int id){
        
        Usuario user = new Usuario();
        try{
            String sql = "SELECT * FROM usuario WHERE id='"+id+"' LIMIT 1;";
            ResultSet rs = this.ExecuteQuery(sql);


            while (rs.next())
            {
              user.setId(rs.getInt("id"));
              user.setNombre(rs.getString("nombre"));
              user.setApellido(rs.getString("apellido"));
              user.setCorreo(rs.getString("correo"));
              user.setClave(rs.getString("clave"));
              user.setTipo(rs.getString("tipo"));

            }
        }catch(Exception e){
            this.last_err = e.getMessage();
        }
        
        
        return user;
    }
}
