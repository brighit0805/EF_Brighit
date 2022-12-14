/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package model.daos;
import model.beans.Servicio;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.swing.JOptionPane;
import model.beans.Usuario;
/**
 *
 */
public class DaoServicio extends Dao{
    
    private String table_name = " servicio ";
    public void insertar_s1(Servicio obj){
        String sql = "INSERT INTO "+this.table_name+" (id_usuario, tipo, s1_densidadpieza, s1_grosor, s1_alturacapa, s1_material, s1_urlimage, s1_autoservicio, fecha ) ";
        sql += " VALUES ('"+obj.id_usuario+"','"+obj.tipo+"', '"+obj.s1_densidadpieza+"', '"+obj.s1_grosor+"','"+obj.s1_alturacapa+"', '"+obj.s1_material+"', '"+obj.s1_urlimage+"','"+obj.s1_autoservicio+"', now() ) ";
        
        //JOptionPane.showMessageDialog(null, sql);
        this.ExecuteUpdate(sql);   
    }
    
    public void insertar_s2(Servicio obj){
        String sql = "INSERT INTO "+this.table_name+" (id_usuario, tipo, s2_grosorlinea, s2_colorlinea, s2_material, s2_dim1, s2_dim2, s2_ulrimagen, fecha ) ";
        sql += " VALUES ('"+obj.id_usuario+"','"+obj.tipo+"', '"+obj.s2_grosorlinea+"', '"+obj.s2_colorlinea+"','"+obj.s2_material+"', '"+obj.s2_dim1+"', '"+obj.s2_dim2+"','"+obj.s2_ulrimagen+"', now() ) ";
        this.ExecuteUpdate(sql);   
    }
    
    public void insertar_s3(Servicio obj){
        String sql = "INSERT INTO "+this.table_name+" (id_usuario, tipo, s3_largo, s3_ancho, s3_alto, s3_resolucion, fecha ) ";
        sql += " VALUES ('"+obj.id_usuario+"','"+obj.tipo+"', '"+obj.s3_largo+"', '"+obj.s3_ancho+"','"+obj.s3_alto+"', '"+obj.s3_resolucion+"', now() ) ";
        this.ExecuteUpdate(sql);   
    }
    
    public void actualizarEstado(Servicio obj){
        String sql = "UPDATE "+this.table_name+" set estado='"+obj.estado+" WHERE id='"+obj.id+"'; ";
        this.ExecuteUpdate(sql);   
    }
    
    public ArrayList<Servicio> getServicios(String where){
        
        ArrayList<Servicio> lista = new ArrayList<>();
        DaoUsuario daoU = new DaoUsuario();
        try{
            String sql = "SELECT * FROM "+table_name+" " + where;
            ResultSet rs = this.ExecuteQuery(sql);


            while (rs.next())
            {
                Servicio item = new Servicio();
                Usuario u = daoU.getUsuarioById(rs.getInt("id_usuario"));
                item.id = rs.getInt("id");
                item.id_usuario = rs.getInt("id_usuario");
                item.usuario = u.getNombre();
                item.tipo = rs.getString("tipo");
                
                item.s1_densidadpieza = rs.getString("s1_densidadpieza");
                item.s1_grosor = rs.getString("s1_grosor");
                item.s1_alturacapa = rs.getString("s1_alturacapa");
                item.s1_material = rs.getString("s1_material");
                item.s1_urlimage = rs.getString("s1_urlimage");
                item.s1_autoservicio = rs.getString("s1_autoservicio");
                
                item.s2_grosorlinea = rs.getString("s2_grosorlinea");
                item.s2_colorlinea = rs.getString("s2_colorlinea");
                item.s2_material = rs.getString("s2_material");
                item.s2_dim1 = rs.getString("s2_dim1");
                item.s2_dim2 = rs.getString("s2_dim2");
                item.s2_ulrimagen = rs.getString("s2_ulrimagen");
                
                item.s3_largo = rs.getString("s3_largo");
                item.s3_ancho = rs.getString("s3_ancho");
                item.s3_alto = rs.getString("s3_alto");
                item.s3_resolucion = rs.getString("s3_resolucion");
                              
                item.fecha = rs.getString("fecha");
                item.estado = rs.getString("estado");
                
                lista.add(item);

            }
        }catch(Exception e){
            this.last_err = e.getMessage();
        }
        
        
        return lista;
    }
}
