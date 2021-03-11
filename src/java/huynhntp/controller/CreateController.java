/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huynhntp.controller;

import huynhntp.dao.QuizDAO;
import huynhntp.dto.QuestionDTO;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.log4j.Logger;

/**
 *
 * @author ACER
 */
public class CreateController extends HttpServlet {

    private final String ERROR = "index.html";
    private final String SUCCESS = "createStatus.jsp";
    
        
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String question = request.getParameter("question");
            String anwser1 = request.getParameter("anwser1");           
            String anwser2 = request.getParameter("anwser2");
            String anwser3 = request.getParameter("anwser3");
            String anwser4 = request.getParameter("anwser4");
            String correct = request.getParameter("correct");
            String subjectID = request.getParameter("subject");
            
            QuizDAO dao = new QuizDAO();
            String questionID = "";
            while(true){
                questionID = RandomStringUtils.randomNumeric(10);
                if(!dao.checkDuplicateQuestionID(questionID)){
                    break;
                }       
            }
            Date date = new Date();
            SimpleDateFormat fm = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            String createDate = fm.format(date);
            QuestionDTO dto = new QuestionDTO(questionID, question, anwser1, anwser2, anwser3, anwser4, correct, createDate, subjectID);
            dao.createQuestion(dto);
            url = SUCCESS;     
        } catch (SQLException e) {
            Logger.getLogger(CreateController.class).error(e.toString());
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
