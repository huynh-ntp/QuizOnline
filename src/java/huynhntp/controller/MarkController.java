/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huynhntp.controller;

import huynhntp.dao.QuizDAO;
import huynhntp.dto.QuestionDTO;
import huynhntp.dto.UserDTO;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.log4j.Logger;

/**
 *
 * @author ACER
 */
public class MarkController extends HttpServlet {

    private final String ERROR = "index.html";
    private final String SUCCESS = "resultPage.jsp";
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            float numOfCorrect = 0;
            float maxQuestion = 0;
            List<QuestionDTO> list = (List<QuestionDTO> ) session.getAttribute("LIST_QUESTION");
            if(list!=null){
                for (QuestionDTO q : list) {
                    if(q.getAnwserChoice().equals(q.getAnwserCorrect())){
                        numOfCorrect++;
                    }
                }
                maxQuestion = list.size();
            }
            float mark = (float) (numOfCorrect*(10.0/maxQuestion));
            String resultID = RandomStringUtils.randomNumeric(10);
            String testsID = (String) session.getAttribute("TESTSID");
            UserDTO user = (UserDTO) session.getAttribute("USER");
            String email = user.getEmail();
            Date date = new Date();
            SimpleDateFormat fm = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            String timeFinish = fm.format(date);
            QuizDAO dao = new QuizDAO();
            dao.mark(resultID, testsID, email, mark, (int)numOfCorrect, timeFinish);
            session.removeAttribute("TESTSID");
            session.removeAttribute("LIST_QUESTION");
            request.setAttribute("NUMOFCORRECT", (int)numOfCorrect);
            request.setAttribute("MARK", mark);
            request.setAttribute("MAXQUESTION",(int) maxQuestion);
            url = SUCCESS;
        } catch (SQLException e) {
            Logger.getLogger(MarkController.class).error(e.toString());
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
