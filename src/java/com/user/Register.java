/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.user;

import java.io.IOException;
import java.io.InputStream;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

/**
 *
 * @author saurabhmaurya
 */
@MultipartConfig  // compulsory when we are sending data in image as well as in text;
public class Register extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet Register</title>");
//            out.println("</head>");
//            out.println("<body>");

            //getting all the incoming details from the form;
            String name = request.getParameter("user_name");
            String password = request.getParameter("user_password");
            String email = request.getParameter("user_email");
            Part part = request.getPart("image");
            String filename = part.getSubmittedFileName();

            out.println(filename);

//            out.println(name);
//            out.println(password);
//            out.println(email);
            // create the connection in JDBC..........;           
            try {

                Thread.sleep(3000);
//                  1->load the driver

                Class.forName("com.mysql.cj.jdbc.Driver"); //gives exceptions

                //make the connection 
                String url = "jdbc:mysql://localhost:3306/registerdb";  //give your database after 3306/db_name
                String username = "root";
                String pass = "root";
                Connection con = DriverManager.getConnection(url, username, pass); //it takes 3 parameter ;

                /*  check whether our is made our not
                if(con.isClosed())
                {
                    out.println("closed hai.....");
                }
                else{
                    out.println("open hai...");
                }
                 */
                // make a query ;
                String q = "insert into user(name, password, email, imageName) values(?,?,?,?)";
                // writing prepared statement

                PreparedStatement pstmt = con.prepareStatement(q);
                pstmt.setString(1, name);
                pstmt.setString(2, password);
                pstmt.setString(3, email);
                pstmt.setString(4, filename);

                //fire the query
                pstmt.executeUpdate();

                //uploading work started;
                InputStream is = part.getInputStream();
                byte[] data = new byte[is.available()];
                is.read(data);

                // create a path where you wanted to push;
                String path = request.getRealPath("/") + "img" + File.separator + filename;
//                out.println(path); // we are getting path here then we just have to write to that path

                FileOutputStream fos = new FileOutputStream(path);
                fos.write(data); // all the data stored in array has been uploaded now at that patj;
                fos.close();

                out.println("done");
//                pstmt.close();
//                con.close();

            } catch (Exception e) {
                e.printStackTrace();
                out.println("error");
            }

//            out.println("</body>");
//            out.println("</html>");
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
