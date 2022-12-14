/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package model.daos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.swing.JOptionPane;

/**
 *
 */
public class Dao {
     
    private String database_name = "ef_brighit";
    private String database_user = "root";
    private String database_pass = "";
    
    protected String last_err = "";
    
    private Connection conn = null;
    
    protected Statement Conectar(){
        try{  
            Class.forName("com.mysql.jdbc.Driver");  
            this.conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+this.database_name,database_user,database_pass);
            
            Statement stmt = this.conn.createStatement();  
            return stmt;
            
        }
        catch(Exception e){
            this.last_err = e.getMessage();
            return null;
        }  
    }
    
    protected void Desconetar(){
        try{
            
            this.conn.close();
        }catch(Exception e){
            this.last_err = e.getMessage();
        }
    }
    
    protected int ExecuteUpdate(String sql){
        try{
            Statement st = this.Conectar();
            int r = st.executeUpdate(sql);
            this.Desconetar();
            return r;
        }catch(Exception e){
            JOptionPane.showMessageDialog(null, e.getMessage());
            this.last_err = e.getMessage();
            return 0;
        }
    }
    
    protected ResultSet ExecuteQuery(String sql){
        try{
            Statement st = this.Conectar();
            ResultSet rs = st.executeQuery(sql);
            //this.Desconetar();
            return rs;
        }catch(Exception e){
            //JOptionPane.showMessageDialog(null, e.getMessage());
            this.last_err = e.getMessage();
            return null;
        }
    }
    
    public String getDBError(){
        return this.last_err;
    }
}
