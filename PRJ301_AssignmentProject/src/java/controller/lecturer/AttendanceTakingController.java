/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.lecturer;

import controller.authentication.BaseRequiredAuthenticationController;
import dal.AttendanceDBContext;
import dal.LecturerDBContext;
import dal.UserDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Attendance;
import model.Lecturer;
import model.Session;
import model.Student;
import model.User;

public class AttendanceTakingController extends BaseRequiredAuthenticationController {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, User acc) throws ServletException, IOException {
        int id = (int) request.getSession().getAttribute("id");
        UserDBContext udb = new UserDBContext();
        User a = udb.getUser(id);
        request.setAttribute("role", a);

        LecturerDBContext lecdb = new LecturerDBContext();
        ArrayList<Lecturer> lec = lecdb.getStdCode(id);
        request.setAttribute("lec", lec);

        int sessionid = Integer.parseInt(request.getParameter("sesid"));
        AttendanceDBContext db = new AttendanceDBContext();
        ArrayList<Attendance> atts = db.getAttendancesBySession(sessionid);
        request.setAttribute("atts", atts);
        if (a.isRole() == false) {
            request.getRequestDispatcher("view/lecturer/AttendanceTaking.jsp").forward(request, response);
        } else {
            response.getWriter().println("No permission");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, User acc) throws ServletException, IOException {
        String[] sids = request.getParameterValues("sid");
        int sessionid = Integer.parseInt(request.getParameter("sessionid"));
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
