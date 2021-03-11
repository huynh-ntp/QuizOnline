/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huynhntp.controller;

import huynhntp.dto.QuestionDTO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;


public class NextQuestionController extends HttpServlet {

    public static final String SUCCESS = "startQuiz.jsp";
    public static final String ERROR = "startQuiz.jsp";
    public static final String MARK = "MarkController";
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("btnAction");
            int questionNum = Integer.parseInt(request.getParameter("questionNum"));
            String anwser = request.getParameter("finalAnwser");
            HttpSession session = request.getSession();
            List<QuestionDTO> list = (List<QuestionDTO>)  session.getAttribute("LIST_QUESTION");
            int maxQuestion = 0;
            if(list!=null){
                if(!anwser.isEmpty()){
                    list.get(questionNum-1).setAnwserChoice(anwser);
                }
                maxQuestion=list.size();
            }
            if(action.equals("<")){
                if(questionNum>1){
                    request.setAttribute("questionNum", questionNum-1);
                }else{
                    request.setAttribute("questionNum", questionNum);
                }
                url = SUCCESS;
            }else if(action.endsWith(">")){
                if(questionNum>=maxQuestion){
                    request.setAttribute("questionNum", questionNum);
                }else{
                    request.setAttribute("questionNum", questionNum+1);
                }
                url = SUCCESS;
            }else{
                url = MARK;
            }
            session.setAttribute("LIST_QUESTION", list);
            
        } catch (Exception e) {
            Logger.getLogger(NextQuestionController.class).error(e.toString());
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
