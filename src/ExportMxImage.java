import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by kimjaesu on 2017. 2. 4..
 */
public class ExportMxImage extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html; charset=UTF-8");

        // Response 객체의 PrintWriter를 사용해 브라우저에 HTML을 출력한다.
        PrintWriter out = resp.getWriter();
        out.println("<HTML><HEAD><TITLE>HelloServlet</TITLE></HEAD>");
        out.println("<BODY>");
        out.println("<H2> Clinet IP: " + req.getRemoteAddr() + "</H2>");
        out.println("<H2> Client Host : " + req.getRemoteHost() + "</H2>");
        out.println("<H2> Request URI : " + req.getRequestURI() + "</H2>");
        out.println("</BODY></HTML>");
    }
}
