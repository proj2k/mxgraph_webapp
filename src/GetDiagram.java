import dao.MxGraphDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by kimjaesu on 2017. 2. 7..
 */
public class GetDiagram extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long mxGraphSeq = Long.parseLong(req.getParameter("mxGraphSeq"));
        try {
            String modelXml = MxGraphDao.getModelXml(mxGraphSeq);
            resp.setStatus(HttpServletResponse.SC_OK);
            resp.getWriter().write(modelXml);
        } catch (Exception e) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.getWriter().write("fail");
            e.printStackTrace();
        }

        resp.getWriter().flush();
        resp.getWriter().close();

    }
}
