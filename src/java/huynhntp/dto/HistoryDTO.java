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
public class HistoryDTO {
    private String testsID;
    private float mark;
    private String time;

    public HistoryDTO(String testsID, float mark, String time) {
        this.testsID = testsID;
        this.mark = mark;
        this.time = time;
    }

    public String getTestsID() {
        return testsID;
    }

    public void setTestsID(String testsID) {
        this.testsID = testsID;
    }

    public float getMark() {
        return mark;
    }

    public void setMark(float mark) {
        this.mark = mark;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
    
    
}
