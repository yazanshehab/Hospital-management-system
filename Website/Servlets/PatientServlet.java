import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class PatientServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request
                .getRequestDispatcher("Patient.jsp")
                .forward(request, response);


        //String[][] users =


        //javax.servlet.http.Cookie[] cookies; = request.getCookies();
        //for(Cookie cookie: cookies){
          //  if(cookie.getName().equals("jx userStuff"))
            //    response.getWriter().write(cookie.getValue());
        }
    }

