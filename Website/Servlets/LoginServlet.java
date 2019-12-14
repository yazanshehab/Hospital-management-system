import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // System.out.println(">: " + email + " " + password);
        response.getWriter().write(">: " + email + " " + password);
        if (true) {
            response.addCookie(new Cookie("jx userStuff", email));
            response.sendRedirect("/user");
        }

        //login fail
        else {
            request.setAttribute("status", "fail");
            request.getRequestDispatcher("login.jsp").forward(request, response);

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request
                .getRequestDispatcher("login.jsp")
                .forward(request, response);

    }
}
