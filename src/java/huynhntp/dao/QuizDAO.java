package huynhntp.dao;

import huynhntp.dto.HistoryDTO;
import huynhntp.dto.QuestionDTO;
import huynhntp.util.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author ACER
 */
public class QuizDAO {

    private Connection conn = null;
    private PreparedStatement stm = null;
    private ResultSet rs = null;
    private final int pageSize = 5;

    public List<String> getTestsID() throws SQLException {
        List<String> list = null;
        try {
            conn = DBConnect.makeConnection();
            if (conn != null) {
                String sql = "SELECT testsID FROM tblTests WHERE status = 1";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                if (rs != null) {
                    list = new ArrayList<>();
                    while (rs.next()) {
                        list.add(rs.getString("testsID"));
                    }
                }
            }
        } catch (SQLException | NamingException e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public List<QuestionDTO> getTestDetails(String testID) throws SQLException {
        List<QuestionDTO> list = null;
        try {
            conn = DBConnect.makeConnection();
            if (conn != null) {
                String sql = "SELECT a.questionID,questionContent,anwserContent1,anwserContent2,anwserContent3,anwserContent4,anwserCorrect \n"
                        + "FROM tblTestsDetails a JOIN tblQuestionBanks b ON a.questionID = b.questionID\n"
                        + "WHERE a.testsID = ? and b.status=1\n"
                        + "ORDER BY NEWID()";
                stm = conn.prepareStatement(sql);
                stm.setString(1, testID);
                rs = stm.executeQuery();
                if (rs != null) {
                    list = new ArrayList<>();
                    while (rs.next()) {
                        list.add(new QuestionDTO(rs.getString("questionID"), rs.getString("questionContent"), rs.getString("anwserContent1"),
                                rs.getString("anwserContent2"), rs.getString("anwserContent3"), rs.getString("anwserContent4"),
                                rs.getString("anwserCorrect"), ""));
                    }
                }
            }
        } catch (SQLException | NamingException e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public void mark(String resultID, String testsID, String email, float mark, int numOfCorrect, String time) throws SQLException {
        try {
            conn = DBConnect.makeConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblResults(resultID,testsID,email,marks,numOfCorrectAnwsers,time)"
                        + " VALUES(?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, resultID);
                stm.setString(2, testsID);
                stm.setString(3, email);
                stm.setFloat(4, mark);
                stm.setInt(5, numOfCorrect);
                stm.setString(6, time);
                stm.executeUpdate();
            }
        } catch (SQLException | NamingException e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public List<HistoryDTO> getHistory(String email, int curPage) throws SQLException {
        List<HistoryDTO> list = null;
        try {
            conn = DBConnect.makeConnection();
            if (conn != null) {
                String sql = "SELECT testsID,marks,time\n"
                        + "FROM tblResults\n"
                        + "WHERE email = ?\n"
                        + "ORDER BY resultID\n"
                        + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
                stm = conn.prepareStatement(sql);
                stm.setString(1, email);
                stm.setInt(2, (curPage - 1) * pageSize);
                stm.setInt(3, pageSize);

                rs = stm.executeQuery();
                if (rs != null) {
                    list = new ArrayList<>();
                    while (rs.next()) {
                        list.add(new HistoryDTO(rs.getString("testsID"), rs.getFloat("marks"), rs.getString("time")));
                    }
                }
            }
        } catch (SQLException | NamingException e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public float countHistory(String email) throws SQLException {
        float result = 0;
        try {
            conn = DBConnect.makeConnection();
            if (conn != null) {
                String sql = "SELECT COUNT(resultID) as 'count'\n"
                        + "FROM tblResults\n"
                        + "WHERE email = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, email);
                rs = stm.executeQuery();
                if (rs.next()) {
                    result = rs.getFloat("count");
                }
            }
        } catch (SQLException | NamingException e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }

    public List<String> getAllSubject() throws SQLException {
        List<String> list = null;
        try {
            conn = DBConnect.makeConnection();
            if (conn != null) {
                String sql = "SELECT subjectID FROM tblSubjects";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                if (rs != null) {
                    list = new ArrayList<>();
                    while (rs.next()) {
                        list.add(rs.getString("subjectID"));
                    }
                }
            }
        } catch (SQLException | NamingException e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public boolean checkDuplicateQuestionID(String questionID) throws SQLException {
        boolean result = false;
        try {
            conn = DBConnect.makeConnection();
            if (conn != null) {
                String sql = "SELECT subjectID FROM tblSubjects"
                        + " WHERE subjectID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, questionID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    result = true;
                }
            }
        } catch (SQLException | NamingException e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }

    public void createQuestion(QuestionDTO dto) throws SQLException {
        try {
            conn = DBConnect.makeConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblQuestionBanks(questionID,questionContent,anwserContent1,anwserContent2,anwserContent3,anwserContent4,anwserCorrect,createDate,subjectID)\n"
                        + "VALUES(?,?,?,?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, dto.getQuestionID());
                stm.setString(2, dto.getQuestionContent());
                stm.setString(3, dto.getAnwser1());
                stm.setString(4, dto.getAnwser2());
                stm.setString(5, dto.getAnwser3());
                stm.setString(6, dto.getAnwser4());
                stm.setString(7, dto.getAnwserCorrect());
                stm.setString(8, dto.getCreateDate());
                stm.setString(9, dto.getSubjectID());
                stm.executeUpdate();
            }
        } catch (SQLException | NamingException e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

    }

    public List<QuestionDTO> getQuestionForAd(int curPage) throws SQLException {
        List<QuestionDTO> list = null;
        try {
            conn = DBConnect.makeConnection();
            if (conn != null) {
                String sql = "SELECT questionID,questionContent,createDate,subjectID,status\n"
                        + "FROM tblQuestionBanks\n"
                        + "ORDER BY questionID\n"
                        + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, (curPage - 1) * pageSize);
                stm.setInt(2, pageSize);
                rs = stm.executeQuery();
                if (rs != null) {
                    list = new ArrayList<>();
                    while (rs.next()) {
                        list.add(new QuestionDTO(rs.getString("questionID"), rs.getString("questionContent"),
                                rs.getString("createDate"), rs.getString("subjectID"), rs.getBoolean("status")));
                    }
                }
            }
        } catch (SQLException | NamingException e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public float getCountQuestions() throws SQLException {
        float result = 0;
        try {
            conn = DBConnect.makeConnection();
            if (conn != null) {
                String sql = "SELECT COUNT(questionID) as 'count' FROM tblQuestionBanks";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                if (rs.next()) {
                    result = rs.getFloat("count");
                }
            }
        } catch (SQLException | NamingException e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }

    public QuestionDTO getQuestionDetail(String questionID) throws SQLException {
        QuestionDTO result = null;
        try {
            conn = DBConnect.makeConnection();
            if (conn != null) {
                String sql = "SELECT questionID,questionContent,anwserContent1,anwserContent2,anwserContent3,anwserContent4,anwserCorrect,subjectID,status\n"
                        + "FROM tblQuestionBanks\n"
                        + "WHERE questionID= ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, questionID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    result = new QuestionDTO(rs.getString("questionID"), rs.getString("questionContent"), rs.getString("anwserContent1"),
                            rs.getString("anwserContent2"), rs.getString("anwserContent3"), rs.getString("anwserContent4"),
                            rs.getString("anwserCorrect"), rs.getString("subjectID"), rs.getBoolean("status"));
                }
            }
        } catch (SQLException | NamingException e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }

    public void updateQuestion(QuestionDTO dto, String updateDate) throws SQLException {

        try {
            conn = DBConnect.makeConnection();
            if (conn != null) {
                String sql = "UPDATE tblQuestionBanks\n"
                        + "SET questionContent = ?, anwserContent1 = ?, anwserContent2 = ?, anwserContent3 = ?, anwserContent4 = ?, anwserCorrect = ?, subjectID = ?, updateDate = ?, status = ?\n"
                        + "WHERE questionID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, dto.getQuestionContent());
                stm.setString(2, dto.getAnwser1());
                stm.setString(3, dto.getAnwser2());
                stm.setString(4, dto.getAnwser3());
                stm.setString(5, dto.getAnwser4());
                stm.setString(6, dto.getAnwserCorrect());
                stm.setString(7, dto.getSubjectID());
                stm.setString(8, updateDate);
                stm.setBoolean(9, dto.isStatus());
                stm.setString(10, dto.getQuestionID());
                stm.executeUpdate();
            }
        } catch (SQLException | NamingException e) {
        } finally {

            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

    }

    public void deleteQuestion(String questionID) throws SQLException {

        try {
            conn = DBConnect.makeConnection();
            if (conn != null) {
                String sql = "UPDATE tblQuestionBanks\n"
                        + "SET  status = 0\n"
                        + "WHERE questionID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, questionID);
                stm.executeUpdate();
            }
        } catch (SQLException | NamingException e) {
        } finally {

            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

    }

    public int getTimeDoQuiz(String testsID) throws SQLException {
        int result = 0;
        try {
            conn = DBConnect.makeConnection();
            if (conn != null) {
                String sql = "SELECT timeToDo FROM tblTests\n"
                        + "WHERE testsID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, testsID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    result = rs.getInt("timeToDo");
                }
            }
        } catch (SQLException | NamingException e) {
        } finally {

            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }

}
