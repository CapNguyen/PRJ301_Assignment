/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllerAll;

import dal.DBContext;
import dal.StudentDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Course;
import model.Student;
import model.User;

/**
 *
 * @author admin
 */
public class StudentController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int a = (int) request.getSession().getAttribute("id");
        StudentDBContext studb = new StudentDBContext();
        ArrayList<Student> stu = studb.getStdCode(a);
        request.setAttribute("stu", stu);

        DBContext<Course> cb = new CourseDBContext();
        ArrayList<Course> courses = cb.all();
        request.setAttribute("courses", courses);
        request.getRequestDispatcher("../view/student/info.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, User acc) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, User acc) throws ServletException, IOException {
        processRequest(request, response);
    }
}
