/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huynhntp.controller;

import huynhntp.dao.QuizDAO;
import huynhntp.dao.UserDAO;
import huynhntp.dto.UserDTO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.log4j.Logger;

/**
 *
 * @author ACER
 */
public class LoginController extends HttpServlet {

    private final static String ERROR = "index.html";
    private final static String ST_SUCCESS = "dashboard.jsp";
    private final static String AD_SUCCESS = "AdminController";
    private final static String FAILED = "login.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String email = request.getParameter("email");
            String password = DigestUtils.sha256Hex(request.getParameter("password"));
            password = password.substring(0, 49);
            UserDAO dao = new UserDAO();      
            UserDTO user = dao.checkLogin(email, password);
            QuizDAO qDao = new QuizDAO();
            HttpSession session = request.getSession();
            if(user!=null){
                if(user.getRoleID().equals("ST")){
                    List<String> testsList = qDao.getTestsID();
                    if(testsList!=null){
                        session.setAttribute("TESTS_LIST", testsList);
                    }
                    session.setAttribute("USER", user);
                    url = ST_SUCCESS;
                }else{
                    session.setAttribute("USER", user);
                    url = AD_SUCCESS;
                }
            }else{
                request.setAttribute("LOGIN_ERROR", "Account is not found or account not allows");
                url = FAILED; 
            }         
           
        } catch (SQLException e) {
            Logger.getLogger(LoginController.class).error(e.toString());
        }finally{
            request.getRequestDispatcher(url).forward(request, response);
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

}
