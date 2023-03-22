/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.task;

import dal.AccountDBContext;
import dal.AttendanceDBContext;
import dal.CampusDBContext;
import dal.CourseDBContext;
import dal.DBContext;
import dal.GroupDBContext;
import dal.LecturerDBContext;
import dal.SessionDBContext;
import dal.StudentDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import model.Account;
import model.Attendance;
import model.Campus;
import model.Course;
import model.Lecturer;
import model.Session;
import model.Student;

/**
 *
 * @author admin
 */
public class AttendanceReportController extends HttpServlet {

     protected void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
          int id = (int) req.getSession().getAttribute("id");
          AccountDBContext udb = new AccountDBContext();
          Account a = udb.getAccount(id);
          req.setAttribute("role", a);

          CampusDBContext camp = new CampusDBContext();
          ArrayList<Campus> camps = camp.search(id);
          req.setAttribute("camps", camps);

          LecturerDBContext lecdb = new LecturerDBContext();
          ArrayList<Lecturer> lec = lecdb.getStdCode(id);
          req.setAttribute("lec", lec);

          DBContext<Course> cb = new CourseDBContext();
          ArrayList<Course> courses = cb.all();
          req.setAttribute("courses", courses);

          String raw_session = req.getParameter("session");

          if (a.isRole() == false) {
               if (raw_session != null) {
                    int session = Integer.parseInt(raw_session);
                    StudentDBContext db = new StudentDBContext();
                    ArrayList<Student> students = db.searchBySes(session);
                    req.setAttribute("students", students);

                    SessionDBContext sdb = new SessionDBContext();
                    ArrayList<Session> ss = sdb.search(session);
                    Session s1 = ss.get(0);

                    SessionDBContext ssdb = new SessionDBContext();
                    ArrayList<Session> sss = ssdb.countSes(s1.getCourse().getId(), s1.getGroup().getId());
                    req.setAttribute("ss", sss);

                    AttendanceDBContext adb = new AttendanceDBContext();
                    ArrayList<Attendance> atts = adb.searchBy(s1.getGroup().getId(), s1.getCourse().getId());
                    req.setAttribute("att", atts);
               }
               req.getRequestDispatcher("view/task/AttendanceReport.jsp").forward(req, resp);
          }
     }

     @Override
     protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
          processRequest(req, resp);
     }

     @Override
     protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
          processRequest(req, resp);
     }

}
