/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.beans.Usuario;
import model.daos.DaoUsuario;
import org.apache.jasper.tagplugins.jstl.core.Catch;

/**
 *
 * @author Gerber
 */
@WebServlet(name = "SessionServlet", urlPatterns = {"/sesion"})
public class SessionServlet extends HttpServlet {

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
            case "login":
                vista = "login.jsp";                
                break;
            case "registro":
                vista = "registro.jsp";
                break;
            case "salir":
                
                HttpSession sess = request.getSession();
                sess.setAttribute("uid", null);
                sess.setAttribute("unombre", null);
                vista = "login.jsp";
                break;
                
            default:
                throw new AssertionError();
        }
        
        
        request.setAttribute("error", "");
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
        
        String accion = request.getParameter("accion");
        String vista = "";
        
        switch (accion) {
            case "login":
                try{
                    Usuario u = daoUsuario.getUsuarioByEmail(request.getParameter("correo"));
                    if (u.getClave().equals(request.getParameter("clave"))){
                        HttpSession sess = request.getSession();
                        sess.setAttribute("uid", u.getId());
                        sess.setAttribute("unombre", u.getNombre());
                        vista = "loginafter.jsp";
                    }
                }catch(Exception e){
                    request.setAttribute("error", "Usuario o clave incorrecta");
                    vista = "login.jsp";
                }
                
                break;
            case "registro":
                Usuario u = new Usuario();
                u.setNombre(request.getParameter("nombre"));
                u.setApellido(request.getParameter("apellido"));
                u.setCorreo(request.getParameter("correo"));
                u.setClave(request.getParameter("clave"));
                u.setTipo(request.getParameter("tipo"));
                
                daoUsuario.insertar(u);
                
                request.setAttribute("nombre", u.getNombre());
                vista = "registroafter.jsp";
                break;
            default:
                throw new AssertionError();
        }
        
        RequestDispatcher rd = request.getRequestDispatcher(vista);
        rd.forward(request, response);
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
