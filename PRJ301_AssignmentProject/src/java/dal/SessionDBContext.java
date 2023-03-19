/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Attendance;
import model.Course;
import model.Group;
import model.Lecturer;
import model.Room;
import model.Session;
import model.TimeSlot;

public class SessionDBContext extends DBContext {

    public ArrayList<Session> search(int sessionid) {
        ArrayList<Session> ses = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT s.sessionid, s.gid, s.cid, s.tid, s.rid, s.lid, s.[date], s.[status], c.cname, c.ccode, g.gname, l.lname, l.lcode\n"
                    + "FROM [Session] s INNER JOIN [Group] g\n"
                    + "ON g.gid = s.gid\n"
                    + "INNER JOIN Course c\n"
                    + "ON s.cid = c.cid\n"
                    + "INNER JOIN Lecturer l\n"
                    + "on l.lid = s.lid\n"
                    + "WHERE s.sessionid = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, sessionid);
            rs = stm.executeQuery();

            while (rs.next()) {
                Session s = new Session();
                s.setId(sessionid);
                s.setDate(rs.getDate("date"));
                s.setStatus(rs.getBoolean("status"));

                Group g = new Group();
                g.setId(rs.getInt("gid"));
                g.setName(rs.getString("gname"));
                s.setGroup(g);

                Course c = new Course();
                c.setId(rs.getInt("cid"));
                c.setCode(rs.getString("ccode"));
                c.setName(rs.getString("cname"));
                s.setCourse(c);

                Lecturer l = new Lecturer();
                l.setId(rs.getInt("lid"));
                l.setName(rs.getString("lname"));
                l.setCode(rs.getString("lcode"));
                s.setLecturer(l);

                TimeSlot ts = new TimeSlot();
                ts.setId(rs.getInt("tid"));
                s.setSlot(ts);

                ses.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }

            try {
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return ses;
    }

    public ArrayList<Session> checkAtt(int cid, int sid) {
        ArrayList<Session> ses = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT ses.sessionid, ses.date, ses.status, ts.tid, ts.description, r.rname, l.lcode, g.gname, a.astatus, a.description AS adescription\n"
                    + "FROM [Session] ses\n"
                    + "INNER JOIN TimeSlot ts ON ses.tid = ts.tid\n"
                    + "INNER JOIN Room r ON ses.rid = r.rid\n"
                    + "INNER JOIN Course c ON ses.cid = c.cid\n"
                    + "INNER JOIN Lecturer l ON ses.lid = l.lid\n"
                    + "INNER JOIN [Group] g ON ses.gid = g.gid\n"
                    + "INNER JOIN Student_Group sg ON sg.gid = g.gid\n"
                    + "INNER JOIN Student s ON s.sid = sg.sid\n"
                    + "LEFT JOIN Attendance a ON a.sid = s.sid AND ses.sessionid = a.aid\n"
                    + "WHERE s.sid = ? AND c.cid = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, sid);
            stm.setInt(2, cid);
            rs = stm.executeQuery();

            while (rs.next()) {
                Session ss = new Session();
                ss.setId(rs.getInt("sessionid"));
                ss.setDate(rs.getDate("date"));
                ss.setStatus(rs.getBoolean("status"));

                Room r = new Room();
                r.setName(rs.getString("rname"));
                ss.setRoom(r);

                Group g = new Group();
                g.setName(rs.getString("gname"));
                ss.setGroup(g);

                Lecturer l = new Lecturer();
                l.setCode(rs.getString("lcode"));
                ss.setLecturer(l);

                TimeSlot ts = new TimeSlot();
                ts.setId(rs.getInt("tid"));
                ts.setName(rs.getString("description"));
                ss.setSlot(ts);

                Attendance a = new Attendance();
                a.setStatus(rs.getBoolean("astatus"));
                a.setDescription(rs.getString("adescription"));
                ss.setAttendance(a);

                ses.add(ss);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }

            try {
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return ses;
    }

    public ArrayList<Session> searchBySession(int sessionid, int sid) {
        ArrayList<Session> ses = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT ses.sessionid, ses.[date], ses.[status], a.astatus, c.cname, c.ccode, g.gname, l.lname, l.lcode, ts.tid\n"
                    + "FROM [Session] ses INNER JOIN [Group] g ON g.gid = ses.gid\n"
                    + "INNER JOIN Course c ON ses.cid = c.cid\n"
                    + "INNER JOIN Lecturer l ON l.lid = ses.lid\n"
                    + "INNER JOIN Student_Group sg ON sg.gid = g.gid\n"
                    + "INNER JOIN Student s ON sg.sid = s.sid\n"
                    + "INNER JOIN TimeSlot ts ON ts.tid = ses.tid\n"
                    + "LEFT JOIN Attendance a ON a.sid = s.sid AND a.sessionid = ses.sessionid\n"
                    + "WHERE ses.sessionid = ? AND s.sid = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, sessionid);
            stm.setInt(2, sid);
            rs = stm.executeQuery();

            while (rs.next()) {
                Session s = new Session();
                s.setId(sessionid);
                s.setDate(rs.getDate("date"));
                s.setStatus(rs.getBoolean("status"));

                Attendance a = new Attendance();
                a.setStatus(rs.getBoolean("astatus"));
                s.setAttendance(a);

                Group g = new Group();
                g.setName(rs.getString("gname"));
                s.setGroup(g);

                Course c = new Course();
                c.setCode(rs.getString("ccode"));
                c.setName(rs.getString("cname"));
                s.setCourse(c);

                Lecturer l = new Lecturer();
                l.setName(rs.getString("lname"));
                l.setCode(rs.getString("lcode"));
                s.setLecturer(l);

                TimeSlot ts = new TimeSlot();
                ts.setId(rs.getInt("tid"));
                s.setSlot(ts);

                ses.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                rs.close();
            } catch (SQLException ex) {
                Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }

            try {
                stm.close();
            } catch (SQLException ex) {
                Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(SessionDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return ses;
    }

    @Override
    public ArrayList all() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
