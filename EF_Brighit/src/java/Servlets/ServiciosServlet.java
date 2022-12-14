/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.beans.Servicio;
import model.beans.Usuario;
import model.daos.DaoServicio;
import model.daos.DaoUsuario;

/**
 *
 * @author Gerber
 */
@WebServlet(name = "ServiciosServlet", urlPatterns = {"/servicios"})
public class ServiciosServlet extends HttpServlet {

    DaoServicio daoServicio = new DaoServicio();
    DaoUsuario daoUsuario = new DaoUsuario();
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        String vista = "";
        
        
        switch (accion) {
            case "listar":
                HttpSession ses = request.getSession();
                Usuario uuu = daoUsuario.getUsuarioById( Integer.parseInt(ses.getAttribute("uid").toString()));
                ArrayList<Servicio> list;
                
                
                if(uuu.getCorreo().equals("admin@admin.com")){
                    // si es admin, mostramos todos los servicios
                    list = daoServicio.getServicios("");
                }else{
                    // si es usuario mostramos todos los servicios de este usuario
                    list = daoServicio.getServicios("WHERE id_usuario='"+uuu.getId()+"'");
                }
                
                request.setAttribute("servicios", list);
                vista = "servicios_lista.jsp";
                break;
            
            default:
                vista = "servicios_lista.jsp";
                break;
        }
        RequestDispatcher rd = request.getRequestDispatcher(vista);
        rd.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession ses = request.getSession();
        
        String accion = request.getParameter("accion");
        String vista = "";
        switch(accion){
            case "nuevos1":
                Servicio s1 = new Servicio();
                s1.id_usuario = Integer.parseInt(ses.getAttribute("uid").toString());
                s1.tipo = "IMPRESION3D";
                s1.estado = "NUEVO";
                s1.s1_densidadpieza = request.getParameter("s1_densidadpieza");
                s1.s1_grosor = request.getParameter("s1_grosor");
                s1.s1_alturacapa = request.getParameter("s1_alturacapa");
                s1.s1_material = request.getParameter("s1_material");
                s1.s1_urlimage = request.getParameter("s1_urlimage");
                s1.s1_autoservicio = request.getParameter("s1_autoservicio");
                daoServicio.insertar_s1(s1);
                vista = "servicios_lista.jsp";
                break;
            case "nuevos2":
                Servicio s2 = new Servicio();
                s2.estado = "NUEVO";
                s2.tipo = "CORTELASER";
                s2.id_usuario = Integer.parseInt(ses.getAttribute("uid").toString());
                s2.s2_grosorlinea = request.getParameter("s2_grosorlinea");
                s2.s2_colorlinea = request.getParameter("s2_colorlinea");
                s2.s2_material = request.getParameter("s2_material");
                s2.s2_dim1 = request.getParameter("s2_dim1");
                s2.s2_dim2 = request.getParameter("s2_dim2");
                s2.s2_ulrimagen = request.getParameter("s2_ulrimagen");
                daoServicio.insertar_s2(s2);
                vista = "servicios_lista.jsp";
                break;
            case "nuevos3":
                Servicio s3 = new Servicio();
                s3.estado = "NUEVO";
                s3.tipo = "ESCANEO3D";
                s3.id_usuario = Integer.parseInt(ses.getAttribute("uid").toString());
                s3.s3_largo = request.getParameter("s3_largo");
                s3.s3_ancho = request.getParameter("s3_ancho");
                s3.s3_alto = request.getParameter("s3_alto");
                s3.s3_resolucion = request.getParameter("s3_resolucion");
                daoServicio.insertar_s3(s3);
                vista = "servicios_lista.jsp";
                break;
        }
        //RequestDispatcher rd = request.getRequestDispatcher(vista);
        //rd.forward(request, response);
        response.sendRedirect("./servicios?accion=listar");
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
