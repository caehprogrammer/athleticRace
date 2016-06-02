/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import control.systemUsersControl;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.systemUsersModel;
import org.json.simple.JSONObject;

/**
 *
 * @author Lab5-E
 */
@WebServlet(name = "serviceSystemUsers", urlPatterns = {"/serviceSystemUsers"})
public class serviceSystemUsers extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json"); 
        HttpSession session = request.getSession();
        try (PrintWriter out = response.getWriter()) {
            if(request.getParameter("selectLogin")!=null){
                String statusLogin = request.getParameter("statusLogin");
                if(statusLogin.equals("in")){
                    Integer pkSystemUser = null;
                    String userName = request.getParameter("userName");
                    String password = request.getParameter("password");
                    systemUsersModel dataUser=new systemUsersModel();
                    dataUser.setFl_user_name(userName);
                    dataUser.setFl_password(password);
                    JSONObject data = new JSONObject();
                    ArrayList<systemUsersModel> list=new systemUsersControl().SelectSystemUserLogin(dataUser);
                    if(userName != null && password != null){
                        if(list.size()==1){
                            for (systemUsersModel list1 : list) {
                                pkSystemUser = list1.getPk_user();
                                userName = list1.getFl_user_name();
                            }
                            data.put("statusLogin", "logeado");
                            data.put("userNameSystemUser", userName);
                            
                            session.setAttribute("pkSystemUser", pkSystemUser);
                            session.setAttribute("userNameSystemUser", userName);
                        }else{
                            data.put("statusLogin", "notExist");
                            session.invalidate();
                        }
                    }
                    response.setHeader("Access-Control-Allow-Origin", "*");
                    response.setHeader("Access-Control-Allow-Methods", "POST,PUT, GET, OPTIONS, DELETE");
                    response.setHeader("Access-Control-Max-Age", "3600");
                    response.setHeader("Access-Control-Allow-Headers"," Origin, X-Requested-With, Content-Type, Accept,AUTH-TOKEN");
                    response.setContentType("application/json"); 
                    out.print(data);
                }else{
                    session.invalidate();
                    response.sendRedirect("http://10.10.10.23/carrera-atletica/");
                }
            }else{
                session.invalidate();
                response.sendRedirect("http://10.10.10.23/carrera-atletica/");
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
