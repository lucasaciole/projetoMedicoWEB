/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufscar.dc.medico.servlet;

import br.ufscar.dc.medico.bean.Medico;
import br.ufscar.dc.medico.bean.Paciente;
import br.ufscar.dc.medico.bean.Privilegio;
import br.ufscar.dc.medico.dao.MedicoDAO;
import br.ufscar.dc.medico.dao.PacienteDAO;
import br.ufscar.dc.medico.dao.PrivilegioDAO;
import br.ufscar.dc.medico.dao.PrivilegioDAO.PrivilegioEnum;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 *
 * @author 619680
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    @Resource(name =  "jdbc/MedicoDBLocal")
    DataSource dataSource;
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String login = request.getParameter("login");
            String senha = request.getParameter("senha");
            
            if (isNotNullOrBlank(login) && isNotNullOrBlank(senha)) {
                String target = "";
                
                PrivilegioDAO pridao = new PrivilegioDAO(dataSource);

                Privilegio pri = pridao.buscarPrivilegio(login);
                if (pri.getPrivilegio() == PrivilegioEnum.PACIENTE.getValor()) {
                    PacienteDAO pdao = new PacienteDAO(dataSource);
                    Paciente p = pdao.buscarPaciente(login);

                    if (p.getSenha().equals(senha)) {
                        request.getSession().setAttribute("login", pri);
                        target = "/ProjetoMedico";
                    }

                } else if (pri.getPrivilegio() == PrivilegioEnum.MEDICO.getValor()) {
                    MedicoDAO mdao = new MedicoDAO(dataSource);
                    Medico m = mdao.buscarMedico(login);

                    if (m.getSenha().equals(senha)) {
                        request.getSession().setAttribute("login", pri);
                        target = "/ProjetoMedico";
                    } else {
                        
                    }
                } else if (pri.getPrivilegio() == PrivilegioEnum.ADMIN.getValor()) {
                    if (senha.equals("crocs")) {
                        request.getSession().setAttribute("login", pri);
                        target = "/ProjetoMedico/admin";
                    }
                }

                System.out.println("Login realizado com sucesso: Privilegio " + pri.getPrivilegio());
                
                
                String next = (String) request.getSession().getAttribute("next");
                if (isNotNullOrBlank(next)) {
                    request.getSession().removeAttribute("next");
                    response.sendRedirect(next);
                } else {
                    response.sendRedirect(target);
                }
                
            } else {
                String next = request.getParameter("next");
                if (next != null) {
                    request.getSession().setAttribute("next", next);
                }

                request.getRequestDispatcher("login.jsp").forward(request, response);                
                System.out.println("Não há parametros para login. Redirecionando para formulário.");
            }
        } catch (Exception e) {
            System.out.println("Erro: " + e.getLocalizedMessage());
            System.out.println("Durante processo de Login em br.ufscar.dc.medico.servlet.LoginServlet");
        }
    }

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
        processRequest(request, response);
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
        processRequest(request, response);
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

    private boolean isNotNullOrBlank(String str) {
        return (str != null && str != "");
    }

}
