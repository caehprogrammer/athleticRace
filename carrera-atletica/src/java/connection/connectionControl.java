/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package connection;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Carlos
 */
public class connectionControl {
    public Connection getConexion(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            return java.sql.DriverManager.getConnection("jdbc:mysql://10.10.40.5:3306/db_athletic_race?zeroDateTimeBehavior=convertToNull", "root", "utsem_systems");
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(connectionControl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
