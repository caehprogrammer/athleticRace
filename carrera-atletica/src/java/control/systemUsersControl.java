/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import connection.connectionControl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.systemUsersModel;

/**
 *
 * @author Lab5-E
 */
public class systemUsersControl {
    public static void main(String[] args) {
        
    }
    private String procedure;
    
    public ArrayList<systemUsersModel> SelectSystemUserLogin(systemUsersModel dataSystemUser){
        ArrayList<systemUsersModel> list=new ArrayList<>();
        procedure="CALL `GET_SYSTEM_USERS`('login', '"+dataSystemUser.getFl_user_name()+"', '"+dataSystemUser.getFl_password()+"')";
        try {
            try (Connection conn = new connectionControl().getConexion(); PreparedStatement ps = conn.prepareStatement(procedure); ResultSet res = ps.executeQuery()) {
                while(res!=null&&res.next()){
                    systemUsersModel allParticipants=new systemUsersModel();
                    allParticipants.setPk_user(res.getInt("Pk_user"));
                    allParticipants.setFl_user_name(res.getString("Fl_user_name"));
                    allParticipants.setFl_password(res.getString("Fl_password"));
                    list.add(allParticipants);
                }
                res.close();
                ps.close();
                conn.close();
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(systemUsersModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public ArrayList<systemUsersModel> SelectSystemUser(String action){
        ArrayList<systemUsersModel> list=new ArrayList<>();
        procedure="";
        try {
            try (Connection conn = new connectionControl().getConexion(); PreparedStatement ps = conn.prepareStatement(procedure); ResultSet res = ps.executeQuery()) {
                while(res!=null&&res.next()){
                    systemUsersModel allParticipants=new systemUsersModel();
                    list.add(allParticipants);
                }
                res.close();
                ps.close();
                conn.close();
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(systemUsersModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public String InsertSystemUser(systemUsersModel dataSystemUser){
        String request;
        procedure="";
        try {
            Connection conn=new connectionControl().getConexion();
            try (PreparedStatement ps = conn.prepareStatement(procedure)) {
                ps.executeUpdate();
                request="Datos Guardados";
                ps.close();
                conn.close();
            }
        } catch (SQLException e) {
            request=""+e.getMessage();
            e.getMessage();
        }   
        return request;
    }
    public String DeleteSystemUser(int pkSystemUser){
        String request;
        procedure="";
        try {
            Connection conn=new connectionControl().getConexion();
            try (PreparedStatement ps = conn.prepareStatement(procedure)) {
                ps.executeUpdate();
                request="Dato Eliminado";
                ps.close();
                conn.close();
            }
        } catch (SQLException e) {
            request=""+e.getMessage();
            e.getMessage();
        }   
        return request;
    }
    public String UpdateSystemUser(systemUsersModel dataSystemUser){
        String request;
        procedure="";
        try {
            Connection conn=new connectionControl().getConexion();
            try (PreparedStatement ps = conn.prepareStatement(procedure)) {
                ps.executeUpdate();
                request="Datos Modificados";
                ps.close();
                conn.close();
            }
        } catch (SQLException e) {
            request=""+e.getMessage();
            e.getMessage();
        }   
        return request;
    }
}
