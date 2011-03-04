package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jahziah
 */
public class Login extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Login</title>");
            out.println("</head>");
            out.println("<body>");

            String user = request.getParameter("username");
            String pass = request.getParameter("password");

            Connection con;
            ResultSet rs;
            try {
                // Load the JDBC driver
                Class.forName("com.mysql.jdbc.Driver");

                // Establish the connection to the database
                String url = "jdbc:mysql://localhost:3306/rebate_sharer";
                con = DriverManager.getConnection(url, "root", "1234");

                // Do query
                String stmt = "SELECT email FROM USERS where email='" + user + "' and pass=md5(" + pass + ")";
                // response.getWriter().write(stmt);
                rs = con.createStatement().executeQuery(stmt);

                out.println("<h1>Logging you in...<h/><br/>");
                out.println("<p>You entered username=" + user + " and password=" + pass + "</p>");

                boolean res = rs.next();

                if (!res) {
                    out.println("<h1>Login failed...</h1>");
                    //out.println("<p>You should be redirected now.</p>");
                    //response.sendRedirect("index.html");
                } else {
                    String str = rs.getString(1);
                    out.println("<h1>Login was successful...welcome " + str + "</h1>");

                    // Create cookie
                    Cookie sessionCookie = new Cookie("email", user);
                    sessionCookie.setMaxAge(60 * 60);  // 1 hour expiry time
                    response.addCookie(sessionCookie);

                    response.sendRedirect("main.html");
                }

            } catch (Exception e) {
                out.println(e.getCause().getMessage());
            }
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
