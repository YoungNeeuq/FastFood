/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import connectDB.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.DeliveryPerson;

/**
 *
 * @author Asus
 */
public class DeliveryPersonDAO {
    
    private final DBContext db;
    
    public DeliveryPersonDAO() throws Exception {
        db = new DBContext();
    }
    
    public ArrayList<DeliveryPerson> getAll() {
        
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT delivery_id, username, password, name, phoneNumber, role, "
                    + "deliveryUnit FROM DeliveryPerson";
            connection = db.getConnection();
            ps = connection.prepareStatement(sql);
            
            ArrayList<DeliveryPerson> deliverList = new ArrayList<>();
            
            rs = ps.executeQuery();
            
            while (rs.next()) {
                DeliveryPerson d = new DeliveryPerson();
                d.setDelivery_id(rs.getInt("delivery_id"));
                d.setUsername(rs.getString("username"));
                d.setPassword(rs.getString("password"));
                d.setPhonenNumber(rs.getString("phoneNumber"));
                d.setName(rs.getString("name"));
                d.setRole(rs.getString("role"));
                d.setDeliveryUnit(rs.getString("deliveryUnit"));
                deliverList.add(d);
            }
            return deliverList;
        } catch (SQLException ex) {
            Logger.getLogger(DeliveryPersonDAO.class.getName()).log(Level.SEVERE, null, ex);
            
        } finally {
            
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DeliveryPersonDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DeliveryPersonDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DeliveryPersonDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        
        return null;
        
    }
    
    public DeliveryPerson getDeliveryPerson(String username, String password) {
        try {
            String sql = "SELECT * FROM DeliveryPerson WHERE username = ? AND password = ?;";
            Connection connection = null;
            
            connection = db.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            
            ResultSet rs = ps.executeQuery();
            DeliveryPerson d = new DeliveryPerson();
            
            while (rs.next()) {
                d.setDelivery_id(rs.getInt("delivery_id"));
                d.setName(rs.getString("name"));
                d.setPhonenNumber(rs.getString("phoneNumber"));
                d.setDeliveryUnit(rs.getString("deliveryUnit"));
                d.setUsername(rs.getString("username"));
                d.setPassword(rs.getString("password"));
                d.setRole(rs.getString("role"));
                
                return d;
            }
            
            rs.close();
            ps.close();
            
        } catch (SQLException ex) {
            Logger.getLogger(DeliveryPersonDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
}
