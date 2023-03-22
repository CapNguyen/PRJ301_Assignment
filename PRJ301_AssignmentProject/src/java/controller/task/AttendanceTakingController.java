/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.task;

import controller.authentication.BaseRequiredAuthenticatedController;
import dal.AttendanceDBContext;
import dal.LecturerDBContext;
import dal.AccountDBContext;
import dal.CampusDBContext;
import dal.GroupDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Attendance;
import model.Lecturer;
import model.Session;
import model.Student;
import model.Account;
import model.Campus;
import model.Group;

public class AttendanceTakingController extends BaseRequiredAuthenticatedController {

     @Override
     protected void doGet(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
          int id = (int) request.getSession().getAttribute("id");
          AccountDBContext udb = new AccountDBContext();
          Account a = udb.getAccount(id);
          request.setAttribute("role", a);

          CampusDBContext camp = new CampusDBContext();
          ArrayList<Campus> camps = camp.search(id);
          request.setAttribute("camps", camps);

          LecturerDBContext lecdb = new LecturerDBContext();
          ArrayList<Lecturer> lec = lecdb.getStdCode(id);
          request.setAttribute("lec", lec);

          int sessionid = Integer.parseInt(request.getParameter("sesid"));
          GroupDBContext gdb = new GroupDBContext();
          ArrayList<Group> grs = gdb.getGroupBySesid(sessionid);
          request.setAttribute("grs", grs);
          AttendanceDBContext adb = new AttendanceDBContext();
          ArrayList<Attendance> atts = adb.getAttendancesBySession(sessionid);
          request.setAttribute("atts", atts);
          if (a.isRole() == false) {
               request.getRequestDispatcher("view/task/AttendanceTaking.jsp").forward(request, response);
          }
     }

     @Override
     protected void doPost(HttpServletRequest request, HttpServletResponse response, Account acc) throws ServletException, IOException {
          String[] sids = request.getParameterValues("sid");
          int sessionid = Integer.parseInt(request.getParameter("sesid"));
          Session ss = new Session();
          ss.setId(sessionid);

          ArrayList<Attendance> atts = new ArrayList<>();
          for (String sid : sids) {
               boolean status = request.getParameter("status" + sid).equals("Attended");
               int aid = Integer.parseInt(request.getParameter("aid" + sid));
               String description = request.getParameter("description" + sid);
               Attendance a = new Attendance();
               Student s = new Student();
               s.setId(Integer.parseInt(sid));
               a.setId(aid);
               a.setStatus(status);
               a.setDescription(description);
               a.setStudent(s);
               a.setSession(ss);
               atts.add(a);
          }
          AttendanceDBContext db = new AttendanceDBContext();
          db.update(atts, sessionid);
          response.sendRedirect("schedule");
     }

}
