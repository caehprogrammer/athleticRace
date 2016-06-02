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
import model.participantsModel;

/**
 *
 * @author Lab5-E
 */
public class participantsControl {
    public static void main(String[] args) {
        participantsModel dataParticipant = new participantsModel();
        dataParticipant.setFl_age(0);
        dataParticipant.setFl_cell_phone("7224122746");
        System.out.println(new participantsControl().InsertParticipant(dataParticipant));
    }
    private String procedure;
    public ArrayList<participantsModel> SelectParticipants(String action){
        ArrayList<participantsModel> list=new ArrayList<>();
        procedure="";
        try {
            try (Connection conn = new connectionControl().getConexion(); PreparedStatement ps = conn.prepareStatement(procedure); ResultSet res = ps.executeQuery()) {
                while(res!=null&&res.next()){
                    participantsModel dataParticipants=new participantsModel();
                    dataParticipants.setPk_participant(res.getInt("pk_participant"));
                    dataParticipants.setFl_name(res.getString("fl_name"));
                    dataParticipants.setFl_patern_name(res.getString("fl_patern_name"));                    
                    dataParticipants.setFl_matern_name(res.getString("fl_matern_name"));                    
                    dataParticipants.setFl_mail(res.getString("fl_mail"));                    
                    dataParticipants.setFl_cell_phone(res.getString("fl_cell_phone"));                    
                    dataParticipants.setFl_date_born(res.getString("fl_date_born"));
                    dataParticipants.setFl_age(res.getInt("fl_age"));                    
                    dataParticipants.setFl_gender(res.getInt("fl_gender"));                    
                    dataParticipants.setFl_distance(res.getInt("fl_distance"));                    
                    dataParticipants.setFl_category(res.getString("fl_category"));                    
                    dataParticipants.setFl_competitor_number(res.getInt("fl_competitor_number"));                    
                    dataParticipants.setFl_ticket_number(res.getInt("fl_ticket_number"));                    
                    dataParticipants.setFl_size_tshirt(res.getString("fl_size_tshirt"));                    
                    dataParticipants.setFk_institution(res.getInt("fk_institution"));                    
                    dataParticipants.setFl_observations(res.getString("fl_observations"));
                    list.add(dataParticipants);
                }
                res.close();
                ps.close();
                conn.close();
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(participantsModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public ArrayList<participantsModel> SelectParticipant(){
        ArrayList<participantsModel> list=new ArrayList<>();
        procedure="";
        try {
            try (Connection conn = new connectionControl().getConexion(); PreparedStatement ps = conn.prepareStatement(procedure); ResultSet res = ps.executeQuery()) {
                while(res!=null&&res.next()){
                    participantsModel dataParticipants=new participantsModel();
                    dataParticipants.setPk_participant(res.getInt("pk_participant"));
                    dataParticipants.setFl_name(res.getString("fl_name"));
                    dataParticipants.setFl_patern_name(res.getString("fl_patern_name"));                    
                    dataParticipants.setFl_matern_name(res.getString("fl_matern_name"));                    
                    dataParticipants.setFl_mail(res.getString("fl_mail"));                    
                    dataParticipants.setFl_cell_phone(res.getString("fl_cell_phone"));                    
                    dataParticipants.setFl_date_born(res.getString("fl_date_born"));
                    dataParticipants.setFl_age(res.getInt("fl_age"));                    
                    dataParticipants.setFl_gender(res.getInt("fl_gender"));                    
                    dataParticipants.setFl_distance(res.getInt("fl_distance"));                    
                    dataParticipants.setFl_category(res.getString("fl_category"));                    
                    dataParticipants.setFl_competitor_number(res.getInt("fl_competitor_number"));                    
                    dataParticipants.setFl_ticket_number(res.getInt("fl_ticket_number"));                    
                    dataParticipants.setFl_size_tshirt(res.getString("fl_size_tshirt"));                    
                    dataParticipants.setFk_institution(res.getInt("fk_institution"));                    
                    dataParticipants.setFl_observations(res.getString("fl_observations"));
                    list.add(dataParticipants);
                }
                res.close();
                ps.close();
                conn.close();
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(participantsModel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public String InsertParticipant(participantsModel dataParticipant){
        String request;
        procedure="CALL `SET_PASRTICIPANT`(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            Connection conn=new connectionControl().getConexion();
            try (PreparedStatement ps = conn.prepareStatement(procedure)) {
                ps.setString(1, "insert" );
                ps.setInt(2, 0);
                ps.setString(3, dataParticipant.getFl_name() );
                ps.setString(4, dataParticipant.getFl_patern_name() );
                ps.setString(5, dataParticipant.getFl_matern_name() );
                ps.setString(6, dataParticipant.getFl_mail() );
                ps.setString(7, dataParticipant.getFl_cell_phone() );
                ps.setString(8, dataParticipant.getFl_date_born() );
                ps.setInt(9, dataParticipant.getFl_age() );
                ps.setInt(10, dataParticipant.getFl_gender() );
                ps.setInt(11, dataParticipant.getFl_distance() );
                ps.setString(12, dataParticipant.getFl_category() );
                ps.setInt(13, dataParticipant.getFl_competitor_number() );
                ps.setInt(14, dataParticipant.getFl_ticket_number() );
                ps.setString(15, dataParticipant.getFl_size_tshirt() );
                ps.setInt(16, dataParticipant.getFk_institution() );
                ps.setString(17, dataParticipant.getFl_observations() );
                ps.executeUpdate();
                request="Inserted";
                ps.close();
                conn.close();
            }
        } catch (SQLException e) {
            request=""+e.getMessage();
            e.getMessage();
        }   
        return request;
    }
    public String UpdateParticipant(participantsModel dataParticipant){
        String request;
        procedure="CALL `SET_PASRTICIPANT`(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            Connection conn=new connectionControl().getConexion();
            try (PreparedStatement ps = conn.prepareStatement(procedure)) {
                ps.setString(1, "update" );
                ps.setInt(2, dataParticipant.getPk_participant() );
                ps.setString(3, dataParticipant.getFl_name() );
                ps.setString(4, dataParticipant.getFl_patern_name() );
                ps.setString(5, dataParticipant.getFl_matern_name() );
                ps.setString(6, dataParticipant.getFl_mail() );
                ps.setString(7, dataParticipant.getFl_cell_phone() );
                ps.setString(8, dataParticipant.getFl_date_born() );
                ps.setInt(9, dataParticipant.getFl_age() );
                ps.setInt(10, dataParticipant.getFl_gender() );
                ps.setInt(11, dataParticipant.getFl_distance() );
                ps.setString(12, dataParticipant.getFl_category() );
                ps.setInt(13, dataParticipant.getFl_competitor_number() );
                ps.setInt(14, dataParticipant.getFl_ticket_number() );
                ps.setString(15, dataParticipant.getFl_size_tshirt() );
                ps.setInt(16, dataParticipant.getFk_institution() );
                ps.setString(17, dataParticipant.getFl_observations() );
                ps.executeUpdate();
                request="Updated";
                ps.close();
                conn.close();
            }
        } catch (SQLException e) {
            request=""+e.getMessage();
            e.getMessage();
        }   
        return request;
    }
    public String DeleteParticipant(int pkParticipant){
        String request;
        procedure="CALL `SET_PASRTICIPANT`('delete', "+pkParticipant+", null, null, null, null, null, null, null, null, null, null, null, null, null, null, null)";
        try {
            Connection conn=new connectionControl().getConexion();
            try (PreparedStatement ps = conn.prepareStatement(procedure)) {
                ps.executeUpdate();
                request="Deleted";
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
