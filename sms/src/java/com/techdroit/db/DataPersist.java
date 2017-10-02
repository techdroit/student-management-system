/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.techdroit.db;

import com.techdroit.model.Student;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.apache.log4j.Logger;

/**
 *
 * @author kukut
 */
public class DataPersist {

    private final Logger logger = Logger.getLogger(DataPersist.class);

    private final String url = "jdbc:mysql://localhost:3306/quiz";
    private final String driverName = "com.mysql.jdbc.Driver";
    private final String userName = "root";
    private final String password = "devenv123";

    private Connection con;
    private Statement stm;
    private PreparedStatement prep;
    private ResultSet rs;

    public List<Student> records() {

        List<Student> studentList = new ArrayList<Student>();

        try {

            String sql = "SELECT * FROM student";

            connect();
            stm = con.createStatement();
            rs = stm.executeQuery(sql);
            while (rs.next()) {
                Student student = new Student();
                System.out.println(rs.getInt("id"));
                student.setId(rs.getInt("id"));
                student.setFirstName(rs.getString("first_name"));
                student.setLastName(rs.getString("last_name"));
                student.setGender(rs.getString("gender"));
                student.setDob(rs.getString("dob"));
                student.setFaculty(rs.getString("faculty"));
                student.setDepartment(rs.getString("department"));
                studentList.add(student);
            }
            System.out.println(studentList.size());
            freeMemory();

        } catch (Exception e) {
            logger.error(e.getMessage());
            System.out.println(e.getMessage());
        }

        return studentList;
    }

    public static void main(String[] args) {
        DataPersist d = new DataPersist();
        //d.records();
        d.selectStudent(1);
    }
    
    public int deleteStudent(int id) {

        int x = 0;

        try {

            String sql = "DELETE FROM student where id = ?";
            connect();
            prep = con.prepareStatement(sql);
            prep.setInt(1, id);
            x = prep.executeUpdate();
            
            freeMemory();

        } catch (Exception e) {
            logger.error(e.getMessage());
        }

        return x;
    }

    public int update(int id, String a, String b, String c, String d,
            String f, String g) {

        int x = 0;

        try {

            String sql = "UPDATE student SET first_name = ?, last_name = ?, "
                    + "gender = ?, dob = ?, faculty = ?, department = ? WHERE id = ? ";
            
            connect();

            prep = con.prepareStatement(sql);
            prep.setString(1, a);
            prep.setString(2, b);
            prep.setString(3, c);
            prep.setString(4, d);
            prep.setString(5, f);
            prep.setString(6, g);
            prep.setInt(7, id);

            x = prep.executeUpdate();

            freeMemory();

        } catch (Exception e) {
            logger.error(e.getMessage());
            System.out.println(e.getMessage());
        }

        return x;
    }

    public Student selectStudent(int id) {

        Student std = new Student();

        try {

            String sql = "SELECT * FROM student where id = ?";
            connect();
            prep = con.prepareStatement(sql);
            prep.setInt(1, id);
            rs = prep.executeQuery();

            while (rs.next()) {
                std.setId(rs.getInt("id"));
                std.setFirstName(rs.getString("first_name"));
                std.setLastName(rs.getString("last_name"));
                std.setGender(rs.getString("gender"));
                std.setDob(rs.getString("dob"));
                std.setFaculty(rs.getString("faculty"));
                std.setDepartment(rs.getString("department"));
            }
            freeMemory();
            System.out.println(std.getDepartment());

        } catch (Exception e) {
            logger.error(e.getMessage());
        }

        return std;
    }

    public int insert(String a, String b, String c, String d,
            String f, String g) {

        int x = 0;

        try {

            String sql = "INSERT INTO student(first_name, last_name, gender, dob, faculty, department) "
                    + "VALUES(?,?,?,?,?,?)";

            connect();

            prep = con.prepareStatement(sql);
            prep.setString(1, a);
            prep.setString(2, b);
            prep.setString(3, c);
            prep.setString(4, d);
            prep.setString(5, f);
            prep.setString(6, g);

            x = prep.executeUpdate();

            freeMemory();

        } catch (Exception e) {
            logger.error(e.getMessage());
            System.out.println(e.getMessage());
        }

        return x;
    }

    /*public int insert(Student student) {

     int x = 0;

     try {

     String sql = "INSERT INTO student(first_name, last_name, gender, dob, faculty, department) "
     + "VALUES(?,?,?,?,?,?)";

     connect();

     prep = con.prepareStatement(sql);
     prep.setString(1, student.getFirstName());
     prep.setString(2, student.getLastName());
     prep.setString(3, student.getGender());
     prep.setString(4, student.getDob());
     prep.setString(5, student.getFaculty());
     prep.setString(6, student.getDepartment());

     x = prep.executeUpdate();

     freeMemory();

     } catch (Exception e) {
     logger.error(e.getMessage());
     System.out.println(e.getMessage());
     }

     return x;
     }*/
    private void connect() {
        try {

            Class.forName(driverName);
            con = DriverManager.getConnection(url, userName, password);

        } catch (Exception e) {
            logger.error(e.getMessage());
            System.out.println(e.getMessage());
        }
    }

    private void freeMemory() {

        try {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (prep != null) {
                prep.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (Exception e) {
            logger.error(e.getMessage());
            System.out.println(e.getMessage());
        }
    }
}
