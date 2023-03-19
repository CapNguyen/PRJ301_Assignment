/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.authentication;

import dal.AccountDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;

public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("view/authentication/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        int campus = Integer.parseInt(request.getParameter("campus"));
        AccountDBContext db = new AccountDBContext();
        Account acc = db.get(username, password, campus);
        if (acc != null) {
            int id = acc.getAccID();
            request.getSession().setAttribute("id", id);
            request.getSession().setAttribute("acc", acc);
            if (acc.isRole() == true) {
                response.sendRedirect("timetable");
            } else {
                response.sendRedirect("schedule");
            }
        } else {
            response.getWriter().println("Account doesn/'/t exist");
        }
    }

}
