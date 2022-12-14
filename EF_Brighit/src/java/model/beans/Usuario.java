
package model.beans;


public class Usuario {
    private int Id;
    private String Nombre;
    private String Apellido;
    private String Correo;
    private String Clave;
    private String Clave2;
    private String Tipo;
    
    public Usuario(){
        this.Id = 0;
    }
    
    public int getId(){
        return this.Id;
    }
    public void setId(int value)
    {
        this.Id = value;
    }
    
    public String getNombre(){
        return this.Nombre;
    }
    public void setNombre(String value){
        this.Nombre = value;
    }
    
    public String getApellido(){
        return this.Apellido;
    }
    public void setApellido(String value){
        this.Apellido = value;
    }
    
    public String getCorreo(){
        return this.Correo;
    }
    public void setCorreo(String value){
        this.Correo = value;
    }
    
    public String getClave(){
        return this.Clave;
    }
    public void setClave(String value){
        this.Clave = value;
    }
    
    public String getClave2(){
        return this.Clave2;
    }
    public void setClave2(String value){
        this.Clave2 = value;
    }
    
    
    public String getTipo(){
        return this.Tipo;
    }
    public void setTipo(String value){
        this.Tipo = value;
    }
}
