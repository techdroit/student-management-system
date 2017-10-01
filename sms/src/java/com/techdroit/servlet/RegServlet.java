/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.techdroit.servlet;

import com.techdroit.db.DataPersist;
import com.techdroit.model.Student;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kukut
 */
public class RegServlet extends HttpServlet {

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
        
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String gender = request.getParameter("gender");
        String dob = request.getParameter("dob");
        String faculty = request.getParameter("faculty");
        String department = request.getParameter("department");
        
        Student student = new Student();
        student.setFirstName(firstName);
        student.setLastName(lastName);
        student.setGender(gender);
        student.setDob(dob);
        student.setFaculty(faculty);
        student.setDepartment(department);
        
        DataPersist db = new DataPersist();
        //int status = db.insert(student);
        int status = db.insert(firstName,lastName,gender,dob,faculty,department);
        
        if(status > 0){
            response.sendRedirect("success.jsp");
        }else{
            response.sendRedirect("fail.jsp");
        }
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegServlet at " + request.getContextPath() + "</h1>");
            out.println("<h1>First Name: " + firstName + "</h1>");
            out.println("<h1>Last Name: " + lastName + "</h1>");
            out.println("<h1>Gender: " + gender + "</h1>");
            out.println("<h1>DOB: " + dob + "</h1>");
            out.println("<h1>Faculty: " + faculty + "</h1>");
            out.println("<h1>Department: " + department + "</h1>");
            out.println("<h1>Status: " + status + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
