/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huynhntp.dao;

import huynhntp.dto.UserDTO;
import huynhntp.util.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;

/**
 *
 * @author ACER
 */
public class UserDAO {

    public UserDTO checkLogin(String email, String password) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        UserDTO dto = null;
        try {
            conn = DBConnect.makeConnection();
            if (conn != null) {
                String sql = "SELECT email,name,roleID FROM tblUsers\n"
                        + "WHERE status = 1 and email = ? and password = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, email);
                stm.setString(2, password);
                rs = stm.executeQuery();
                if(rs.next()){
                    dto = new UserDTO(rs.getString("email"), rs.getString("name"), "", rs.getString("roleID"));
                }           
            }
        } catch (SQLException | NamingException e) {
        }finally{
            if(rs !=null){
                rs.close();
            }
            if(stm !=null){
                stm.close();
            }
            if(conn !=null){
                conn.close();
            }
        }
        return dto;
    }
    public void register(String email, String password,String name) throws SQLException, NamingException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBConnect.makeConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblUsers(email,name,password,roleID,status) "
                        + " VALUES(?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, email);
                stm.setString(2, name);
                stm.setString(3, password);
                stm.setString(4, "ST");
                stm.setBoolean(5, true);
                stm.executeUpdate();           
            }
        } finally{
            if(stm !=null){
                stm.close();
            }
            if(conn !=null){
                conn.close();
            }
        }
    }
    
}
