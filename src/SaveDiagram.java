import dao.MxGraphDao;
import model.MxGraphSmartEditor;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

/**
 * Created by kimjaesu on 2017. 2. 7..
 */
public class SaveDiagram extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MxGraphSmartEditor mxGraphSmartEditor = getMxGraphSmartEditor(req);
        try {
            MxGraphSmartEditor savedMxGraph = MxGraphDao.saveData(mxGraphSmartEditor);
            resp.setStatus(HttpServletResponse.SC_OK);
            resp.getWriter().write(String.valueOf(savedMxGraph.getMxGraphSeq()));
        } catch (Exception e) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.getWriter().write("fail");
            e.printStackTrace();
        }

        resp.getWriter().flush();
        resp.getWriter().close();

    }

    private MxGraphSmartEditor getMxGraphSmartEditor(HttpServletRequest req) throws UnsupportedEncodingException {
        HttpSession session = req.getSession();

        MxGraphSmartEditor mxGraphSmartEditor = new MxGraphSmartEditor();
        String mxGraphSeq = req.getParameter("mxGraphSeq");

        // Decoding is optional (no plain text values allowed)
        String modelXml = req.getParameter("modelXml");
        if (modelXml != null && modelXml.startsWith("%3C")) {
            modelXml = URLDecoder.decode(modelXml, "UTF-8");
        }

        // Decoding is optional (no plain text values allowed)
        String imageXml = req.getParameter("imageXml");
        if (imageXml != null && imageXml.startsWith("%3C")) {
            imageXml = URLDecoder.decode(imageXml, "UTF-8");
        }
        int imageWidth = Integer.parseInt(req.getParameter("imageWidth"));
        int imageHeight = Integer.parseInt(req.getParameter("imageHeight"));
        String imageBgColor = req.getParameter("imageBgColor");
        if(mxGraphSeq == null || mxGraphSeq.equals("null")) {
            mxGraphSmartEditor.setNew(true);
        }
        else {
            mxGraphSmartEditor.setMxGraphSeq(Long.valueOf(mxGraphSeq));
            mxGraphSmartEditor.setNew(false);
        }
        mxGraphSmartEditor.setModelXml(modelXml);
        mxGraphSmartEditor.setImageXml(imageXml);
        mxGraphSmartEditor.setImageWidth(imageWidth);
        mxGraphSmartEditor.setImageHeight(imageHeight);
        mxGraphSmartEditor.setImageBgColor(imageBgColor);

        // 사용자의 세션정보에서 식별id정보를 가져와 모델에 설정해야함
        //UserSession userSession = (UserSession)session.getAttribute("userSession");
        //mxGraph.setCreateUserId(userSession.getId());
        //mxGraph.setUpdateUserId(userSession.getId());

        return mxGraphSmartEditor;
    }


}
