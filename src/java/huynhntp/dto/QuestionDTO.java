/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huynhntp.dto;

/**
 *
 * @author ACER
 */
public class QuestionDTO {
    private String questionID;
    private String questionContent;
    private String anwser1;
    private String anwser2;
    private String anwser3;
    private String anwser4;
    private String anwserCorrect;
    private String anwserChoice;
    private String createDate;
    private String subjectID;
    private boolean  status;

    public QuestionDTO(String questionID, String questionContent, String anwser1, String anwser2, String anwser3, String anwser4, String anwserCorrect, String anwserChoice) {
        this.questionID = questionID;
        this.questionContent = questionContent;
        this.anwser1 = anwser1;
        this.anwser2 = anwser2;
        this.anwser3 = anwser3;
        this.anwser4 = anwser4;
        this.anwserCorrect = anwserCorrect;
        this.anwserChoice = anwserChoice;
    }

    public QuestionDTO(String questionID, String questionContent, String anwser1, String anwser2, String anwser3, String anwser4, String anwserCorrect, String createDate, String subjectID) {
        this.questionID = questionID;
        this.questionContent = questionContent;
        this.anwser1 = anwser1;
        this.anwser2 = anwser2;
        this.anwser3 = anwser3;
        this.anwser4 = anwser4;
        this.anwserCorrect = anwserCorrect;
        this.createDate = createDate;
        this.subjectID = subjectID;
    }

    public QuestionDTO(String questionID, String questionContent, String createDate, String subjectID, boolean status) {
        this.questionID = questionID;
        this.questionContent = questionContent;
        this.createDate = createDate;
        this.subjectID = subjectID;
        this.status = status;
    }

    public QuestionDTO(String questionID, String questionContent, String anwser1, String anwser2, String anwser3, String anwser4, String anwserCorrect, String subjectID, boolean status) {
        this.questionID = questionID;
        this.questionContent = questionContent;
        this.anwser1 = anwser1;
        this.anwser2 = anwser2;
        this.anwser3 = anwser3;
        this.anwser4 = anwser4;
        this.anwserCorrect = anwserCorrect;
        this.subjectID = subjectID;
        this.status = status;
    }
    
    
   
    
    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    
    
    
    public String getAnwserChoice() {
        return anwserChoice;
    }
    
    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getSubjectID() {
        return subjectID;
    }

    public void setSubjectID(String subjectID) {
        this.subjectID = subjectID;
    }

    public void setAnwserChoice(String anwserChoice) {
        this.anwserChoice = anwserChoice;
    }

    public String getQuestionID() {
        return questionID;
    }

    public void setQuestionID(String questionID) {
        this.questionID = questionID;
    }

    public String getQuestionContent() {
        return questionContent;
    }

    public void setQuestionContent(String questionContent) {
        this.questionContent = questionContent;
    }

    public String getAnwser1() {
        return anwser1;
    }

    public void setAnwser1(String anwser1) {
        this.anwser1 = anwser1;
    }

    public String getAnwser2() {
        return anwser2;
    }

    public void setAnwser2(String anwser2) {
        this.anwser2 = anwser2;
    }

    public String getAnwser3() {
        return anwser3;
    }

    public void setAnwser3(String anwser3) {
        this.anwser3 = anwser3;
    }

    public String getAnwser4() {
        return anwser4;
    }

    public void setAnwser4(String anwser4) {
        this.anwser4 = anwser4;
    }

    public String getAnwserCorrect() {
        return anwserCorrect;
    }

    public void setAnwserCorrect(String anwserCorrect) {
        this.anwserCorrect = anwserCorrect;
    }
    
    
    
}
