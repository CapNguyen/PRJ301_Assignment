/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.authentication;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;

public abstract class BaseRequiredAuthenticatedController extends HttpServlet {

    private boolean isAuthenticated(HttpServletRequest request) {
        return request.getSession().getAttribute("acc") != null;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (isAuthenticated(request)) {
            doGet(request, response, (Account) request.getSession().getAttribute("acc"));
        } else {
            response.getWriter().println("access denied!");
        }
    }

    protected abstract void doGet(HttpServletRequest request, HttpServletResponse response, Account acc)
            throws ServletException, IOException;

    protected abstract void doPost(HttpServletRequest request, HttpServletResponse response, Account acc)
            throws ServletException, IOException;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (isAuthenticated(request)) {
            //do business
            doPost(request, response, (Account) request.getSession().getAttribute("acc"));
        } else {
            response.getWriter().println("access denied!");
        }
    }

}
