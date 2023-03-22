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
import model.Group;

public class GroupDBContext extends DBContext {

     public ArrayList<Group> getGroupBySesid(int sesid) {
          ArrayList<Group> groups = new ArrayList<>();
          PreparedStatement stm = null;
          ResultSet rs = null;
          try {
               String sql = "Select g.gid,g.gname\n"
                       + "from [Group] g inner join [Session] s on s.gid=g.gid\n"
                       + "where s.sessionid=?;";
               stm = connection.prepareStatement(sql);
               stm.setInt(1, sesid);
               rs = stm.executeQuery();

               while (rs.next()) {
                    Group g = new Group();
                    g.setId(rs.getInt("gid"));
                    g.setName(rs.getString("gname"));
                    groups.add(g);
               }
          } catch (SQLException ex) {
               Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
          } finally {
               try {
                    rs.close();
               } catch (SQLException ex) {
                    Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
               }

               try {
                    stm.close();
               } catch (SQLException ex) {
                    Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
               }
               try {
                    connection.close();
               } catch (SQLException ex) {
                    Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
               }
          }
          return groups;
     }

     public ArrayList<Group> search(int course) {
          ArrayList<Group> groups = new ArrayList<>();
          PreparedStatement stm = null;
          ResultSet rs = null;
          try {
               String sql = "SELECT g.gname, g.gid\n"
                       + "FROM [Group] g INNER JOIN Group_Course gc\n"
                       + "ON g.gid = gc.gid\n"
                       + "AND gc.cid = ?";
               stm = connection.prepareStatement(sql);
               stm.setInt(1, course);
               rs = stm.executeQuery();

               while (rs.next()) {
                    Group g = new Group();
                    g.setId(rs.getInt("gid"));
                    g.setName(rs.getString("gname"));
                    groups.add(g);
               }
          } catch (SQLException ex) {
               Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
          } finally {
               try {
                    rs.close();
               } catch (SQLException ex) {
                    Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
               }

               try {
                    stm.close();
               } catch (SQLException ex) {
                    Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
               }
               try {
                    connection.close();
               } catch (SQLException ex) {
                    Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
               }
          }
          return groups;
     }

     public ArrayList<Group> all() {
          ArrayList<Group> groups = new ArrayList<>();
          PreparedStatement stm = null;
          ResultSet rs = null;
          try {
               String sql = "SELECT gid, gname FROM [Group]";
               stm = connection.prepareStatement(sql);
               rs = stm.executeQuery();
               while (rs.next()) {
                    Group g = new Group();
                    g.setId(rs.getInt("gid"));
                    g.setName(rs.getString("gname"));

                    groups.add(g);
               }

          } catch (SQLException ex) {
               Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
          } finally {
               try {
                    rs.close();
               } catch (SQLException ex) {
                    Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
               }

               try {
                    stm.close();
               } catch (SQLException ex) {
                    Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
               }
               try {
                    connection.close();
               } catch (SQLException ex) {
                    Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
               }
          }
          return groups;
     }

}
