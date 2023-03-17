/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllerAll;

import controller.authentication.BaseRequiredAuthenticationController;
import dal.CourseDBContext;
import dal.DBContext;
import dal.GroupDBContext;
import dal.LecturerDBContext;
import dal.StudentDBContext;
import dal.UserDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Course;
import model.Group;
import model.Lecturer;
import model.Student;
import model.User;

/**
 *
 * @author admin
 */
public class GroupController extends BaseRequiredAuthenticationController {

    private void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int a = (int) req.getSession().getAttribute("id");

        UserDBContext udb = new UserDBContext();
        User acc = udb.getUser(a);
        req.setAttribute("role", a);
        if (acc.isRole() == true) {
            StudentDBContext studb = new StudentDBContext();
            ArrayList<Student> stu = studb.getStdCode(a);
            req.setAttribute("stu", stu);
        } else {
            LecturerDBContext lecdb = new LecturerDBContext();
            ArrayList<Lecturer> lect = lecdb.getStdCode(a);
            req.setAttribute("lect", lect);
        }

        DBContext<Course> cb = new CourseDBContext();
        ArrayList<Course> courses = cb.all();
        req.setAttribute("courses", courses);
        String raw_course = req.getParameter("course");
        String raw_classe = req.getParameter("class");
        if (raw_course != null) {
            int course = Integer.parseInt(raw_course);
            GroupDBContext gb = new GroupDBContext();
            ArrayList<Group> groups = gb.search(course);
            req.setAttribute("groups", groups);
            req.setAttribute("raw_course", raw_course);
        }
        if (raw_course == null && raw_classe != null) {
            int classe = Integer.parseInt(raw_classe);
            StudentDBContext db = new StudentDBContext();
            ArrayList<Student> students = db.search(classe);
            req.setAttribute("students", students);
        }
        req.getRequestDispatcher("../view/student/group.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, User acc) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, User acc) throws ServletException, IOException {
        processRequest(request, response);
    }
}
