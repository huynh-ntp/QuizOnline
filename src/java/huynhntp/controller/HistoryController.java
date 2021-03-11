/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huynhntp.controller;

import huynhntp.dao.QuizDAO;
import huynhntp.dto.HistoryDTO;
import huynhntp.dto.UserDTO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

/**
 *
 * @author ACER
 */
public class HistoryController extends HttpServlet {

    private final String ERROR = "index.html";
    private final String SUCCESS = "historyPage.jsp";
    private final float pageSize = 5;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       String url = ERROR;
        try {
            HttpSession session = request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("USER");
            String email = "";
            int curPage = 1;
            try {
                curPage = Integer.parseInt(request.getParameter("curPage"));
            } catch (NumberFormatException e) {
            }      
            if(user!=null){
                 email = user.getEmail();
            }
            QuizDAO dao = new QuizDAO();
            float max = dao.countHistory(email);
            
            
            List<HistoryDTO> hisList = dao.getHistory(email,curPage);  
            
            
            
            if(hisList!=null){
                int totalPage = (int) Math.ceil(max/pageSize);
                request.setAttribute("HISTORY_LIST", hisList);
                request.setAttribute("TOTAL_PAGE", totalPage);
            }                
            url = SUCCESS;
        } catch (SQLException e) {
            Logger.getLogger(HistoryController.class).error(e.toString());
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
