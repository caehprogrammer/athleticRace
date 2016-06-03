package services;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import control.participantsControl;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.participantsModel;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 *
 * @author Lab5-E
 */
@WebServlet(urlPatterns = {"/serviceParticipants"})
public class serviceParticipants extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param date
     * @param request servlet request
     * @param response servlet response
     * @return 
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected String convertDate(String date){
        String dateFormatMysql;
        String[] numerosComoArray = date.split(",");
        switch (numerosComoArray[1].replace(" ", "")) {
            case "Enero":
                dateFormatMysql = numerosComoArray[2]+"-01-"+numerosComoArray[0];
                break;
            case "Febrero":
                dateFormatMysql = numerosComoArray[2]+"-02-"+numerosComoArray[0];
                break;
            case "Marzo":
                dateFormatMysql = numerosComoArray[2]+"-03-"+numerosComoArray[0];
                break;
            case "Abril":
                dateFormatMysql = numerosComoArray[2]+"-04-"+numerosComoArray[0];
                break;
            case "Mayo":
                dateFormatMysql = numerosComoArray[2]+"-05-"+numerosComoArray[0];
                break;
            case "Junio":
                dateFormatMysql = numerosComoArray[2]+"-06-"+numerosComoArray[0];
                break;
            case "Julio":
                dateFormatMysql = numerosComoArray[2]+"-07-"+numerosComoArray[0];
                break;
            case "Agosto":
                dateFormatMysql = numerosComoArray[2]+"-08-"+numerosComoArray[0];
                break;
            case "Septiembre":
                dateFormatMysql = numerosComoArray[2]+"-09-"+numerosComoArray[0];
                break;
            case "Octubre":
                dateFormatMysql = numerosComoArray[2]+"-10-"+numerosComoArray[0];
                break;
            case "Noviembre":
                dateFormatMysql = numerosComoArray[2]+"-11-"+numerosComoArray[0];
                break;
            case "Diciembre":
                dateFormatMysql = numerosComoArray[2]+"-12-"+numerosComoArray[0];
                break;
            default:
                dateFormatMysql = "0000-00-00";
                break;
        }
        dateFormatMysql = dateFormatMysql.replace(" ", "");
        return dateFormatMysql;
    }
    protected String convertDateString(String date){
        String dateFormatMysql;
        String[] numerosComoArray = date.split(",");
        switch (numerosComoArray[1].replace(" ", "")) {
            case "01":
                dateFormatMysql = numerosComoArray[0]+", Enero, "+numerosComoArray[2];
                break;
            case "02":
                dateFormatMysql = numerosComoArray[0]+", Febrero, "+numerosComoArray[2];
                break;
            case "03":
                dateFormatMysql = numerosComoArray[0]+", Marzo, "+numerosComoArray[2];
                break;
            case "04":
                dateFormatMysql = numerosComoArray[0]+", Abril, "+numerosComoArray[2];
                break;
            case "05":
                dateFormatMysql = numerosComoArray[0]+", Mayo, "+numerosComoArray[2];
                break;
            case "06":
                dateFormatMysql = numerosComoArray[0]+", Junio, "+numerosComoArray[2];
                break;
            case "07":
                dateFormatMysql = numerosComoArray[0]+", Julio, "+numerosComoArray[2];
                break;
            case "08":
                dateFormatMysql = numerosComoArray[0]+", Agosto, "+numerosComoArray[2];
                break;
            case "09":
                dateFormatMysql = numerosComoArray[0]+", Septiembre, "+numerosComoArray[2];
                break;
            case "10":
                dateFormatMysql = numerosComoArray[0]+", Octubre, "+numerosComoArray[2];
                break;
            case "11":
                dateFormatMysql = numerosComoArray[0]+", Noviembre, "+numerosComoArray[2];
                break;
            case "12":
                dateFormatMysql = numerosComoArray[0]+", Diciembre, "+numerosComoArray[2];
                break;
            default:
                dateFormatMysql = "0000-00-00";
                break;
        }
        dateFormatMysql = dateFormatMysql.replace(" ", "");
        return dateFormatMysql;
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        JSONObject dataOut = new JSONObject();
        try (PrintWriter out = response.getWriter()) {
            if(session.getAttribute("userNameSystemUser")!=null){
                response.setContentType("application/json");
                Integer pk_participant;
                String fl_name;
                String fl_patern_name;
                String fl_matern_name;
                String fl_mail;
                String fl_cell_phone;
                String fl_date_born;
                int fl_age;
                int fl_gender;
                int fl_distance;
                String fl_category;
                int fl_competitor_number;
                int fl_ticket_number;
                String fl_size_tshirt;
                Integer fk_institution;
                String fl_observations;
                
                if(request.getParameter("select")!=null){
                    ArrayList<participantsModel> listParticipants;
                    JSONArray principal = new JSONArray();
                    JSONObject settings = new JSONObject();
                    JSONArray content = new JSONArray();
                    settings.put("__participantsModel","Participants");
                    listParticipants = new participantsControl().SelectParticipants("allParticipants"); 
                    for(int i=0;i<listParticipants.size();i++){
                        JSONObject data = new JSONObject();
                        data.put("getProgresivNumber", i+1);
                        data.put("getPk_participant", listParticipants.get(i).getPk_participant());
                        data.put("getFl_name", listParticipants.get(i).getFl_name());
                        data.put("getFl_patern_name", listParticipants.get(i).getFl_patern_name() );
                        data.put("getFl_matern_name", listParticipants.get(i).getFl_matern_name() );
                        data.put("getFl_mail", listParticipants.get(i).getFl_mail() );
                        data.put("getFl_cell_phone", listParticipants.get(i).getFl_cell_phone() );
                        data.put("getFl_date_born", listParticipants.get(i).getFl_date_born() );
                        data.put("getFl_age", listParticipants.get(i).getFl_age() );
                        data.put("getFl_gender", listParticipants.get(i).getFl_gender() );
                        data.put("getFl_distance", listParticipants.get(i).getFl_distance() );
                        data.put("getFl_category", listParticipants.get(i).getFl_category() );
                        data.put("getFl_competitor_number", listParticipants.get(i).getFl_competitor_number() );        
                        data.put("getFl_ticket_number", listParticipants.get(i).getFl_ticket_number() );      
                        data.put("getFl_date_register", listParticipants.get(i).getFl_date_register() );
                        data.put("getFl_size_tshirt", listParticipants.get(i).getFl_size_tshirt() );
                        data.put("getFk_institution", listParticipants.get(i).getFk_institution() );
                        data.put("getFl_observations", listParticipants.get(i).getFl_observations());        
                        content.add(data); 
                    }
                    settings.put("__ENTITIES", content);
                    principal.add(settings);
                    out.print(principal);
                    out.flush(); 
                    out.close();
                }
                if(request.getParameter("insert")!=null){
                    
                    try {
                        participantsModel dataParticipants=new participantsModel();
                        
//                        pk_participant = Integer.parseInt(request.getParameter("data_pk_participant"));
                        fl_name = request.getParameter("data_name");
                        fl_patern_name = request.getParameter("data_patern_name");
                        fl_matern_name = request.getParameter("data_matern_name");
                        fl_mail = request.getParameter("data_mail");
                        fl_cell_phone = request.getParameter("data_cell_phone");
                        fl_date_born = convertDate(request.getParameter("data_date_born"));
//                        fl_age = Integer.parseInt(request.getParameter("data_age"));
                        fl_gender = Integer.parseInt(request.getParameter("data_gender"));
                        fl_distance = Integer.parseInt(request.getParameter("data_distance"));
                        fl_category = request.getParameter("data_category");
                        fl_competitor_number = Integer.parseInt(request.getParameter("data_competitor_number"));
                        fl_ticket_number = Integer.parseInt(request.getParameter("data_ticket_number"));
                        fl_size_tshirt = request.getParameter("data_size_tshirt");
                        fk_institution = Integer.parseInt(request.getParameter("data_fk_institution"));
                        fl_observations = request.getParameter("data_observations");

//                        dataParticipants.setPk_participant(pk_participant);
                        dataParticipants.setFl_name(fl_name);
                        dataParticipants.setFl_patern_name(fl_patern_name);                    
                        dataParticipants.setFl_matern_name(fl_matern_name);                    
                        dataParticipants.setFl_mail(fl_mail);                    
                        dataParticipants.setFl_cell_phone(fl_cell_phone);                    
                        dataParticipants.setFl_date_born(fl_date_born);
//                        dataParticipants.setFl_age(fl_age);                    
                        dataParticipants.setFl_gender(fl_gender);                    
                        dataParticipants.setFl_distance(fl_distance);                    
                        dataParticipants.setFl_category(fl_category);                    
                        dataParticipants.setFl_competitor_number(fl_competitor_number);                    
                        dataParticipants.setFl_ticket_number(fl_ticket_number);                    
                        dataParticipants.setFl_size_tshirt(fl_size_tshirt);                    
                        dataParticipants.setFk_institution(fk_institution);                    
                        dataParticipants.setFl_observations(fl_observations);

                        dataOut.put("result", new participantsControl().InsertParticipant(dataParticipants));    
                    } catch (Exception e) {
                        dataOut.put("result", "0");
                    }              
                    out.print(dataOut);
                }
                if(request.getParameter("update")!=null){      
                    if(request.getParameter("pt_Pk_participant") != null){
                        participantsModel dataParticipants=new participantsModel();
                        pk_participant = Integer.parseInt(request.getParameter("data_pk_participant"));
                        fl_name = request.getParameter("data_name");
                        fl_patern_name = request.getParameter("data_patern_name");
                        fl_matern_name = request.getParameter("data_matern_name");
                        fl_mail = request.getParameter("data_mail");
                        fl_cell_phone = request.getParameter("data_cell_phone");
                        fl_date_born = convertDate(request.getParameter("data_date_born"));
                        fl_age = Integer.parseInt(request.getParameter("data_age"));
                        fl_gender = Integer.parseInt(request.getParameter("data_gender"));
                        fl_distance = Integer.parseInt(request.getParameter("data_distance"));
                        fl_category = request.getParameter("data_category");
                        fl_competitor_number = Integer.parseInt(request.getParameter("data_competitor_number"));
                        fl_ticket_number = Integer.parseInt(request.getParameter("data_ticket_number"));
                        fl_size_tshirt = request.getParameter("data_size_tshirt");
                        fk_institution = Integer.parseInt(request.getParameter("data_fk_institution"));
                        fl_observations = request.getParameter("data_observations");
                        
                        dataParticipants.setPk_participant(pk_participant);
                        dataParticipants.setFl_name(fl_name);
                        dataParticipants.setFl_patern_name(fl_patern_name);                    
                        dataParticipants.setFl_matern_name(fl_matern_name);                    
                        dataParticipants.setFl_mail(fl_mail);                    
                        dataParticipants.setFl_cell_phone(fl_cell_phone);                    
                        dataParticipants.setFl_date_born(fl_date_born);
                        dataParticipants.setFl_age(fl_age);                    
                        dataParticipants.setFl_gender(fl_gender);                    
                        dataParticipants.setFl_distance(fl_distance);                    
                        dataParticipants.setFl_category(fl_category);                    
                        dataParticipants.setFl_competitor_number(fl_competitor_number);                    
                        dataParticipants.setFl_ticket_number(fl_ticket_number);                    
                        dataParticipants.setFl_size_tshirt(fl_size_tshirt);                    
                        dataParticipants.setFk_institution(fk_institution);                    
                        dataParticipants.setFl_observations(fl_observations);
                        
                        dataOut.put("result", new participantsControl().UpdateParticipant(dataParticipants));
                        out.print(dataOut);  
                    }                
                }
                if(request.getParameter("delete")!=null){     
                    if(request.getParameter("pt_Pk_participant") != null){                        
                        dataOut.put("result", new participantsControl().DeleteParticipant(Integer.parseInt(request.getParameter("pt_Pk_participant"))));
                        out.print(dataOut); 
                    }                
                }
            }else{
                out.print("<h1>Acceso Denegado</h1>");
            }
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
