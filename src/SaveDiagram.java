import model.MxGraphSmartEditor;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.*;

/**
 * Created by kimjaesu on 2017. 2. 7..
 */
public class SaveDiagram extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MxGraphSmartEditor mxGraphSmartEditor = getMxGraphSmartEditor(req);
        try {
            MxGraphSmartEditor savedMxGraph = saveData(mxGraphSmartEditor);
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

    public MxGraphSmartEditor saveData(MxGraphSmartEditor mxGraphSmartEditor) throws Exception{
        Class.forName(Constants.JDBC_DRIVER);
        Connection conn = null;
        int saveCount = 0;
        try {
            conn = DriverManager.
                    getConnection(Constants.DB_URL, Constants.DB_USER, Constants.DB_PASSWORD);
            if(mxGraphSmartEditor.isNew()) {
                long newMxGraphSeq = getNewMxGraphSeq(conn);
                mxGraphSmartEditor.setMxGraphSeq(newMxGraphSeq);
                saveCount = insertData(conn, mxGraphSmartEditor);
            }
            else {
                saveCount = updateData(conn, mxGraphSmartEditor);
            }
            if(saveCount < 1) {
                System.out.println("save count 0");
            }
            return mxGraphSmartEditor;

        }
        finally {

            if(conn != null) {
                conn.close();
            }
        }
    }

    public long getNewMxGraphSeq(Connection conn) throws SQLException {
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            statement = conn.createStatement();
            resultSet = statement.executeQuery("SELECT TEST_SCHEMA.MX_GRAPH_SEQ.NEXTVAL MX_GRAPH_SEQ");

            resultSet.next();
            return resultSet.getLong("MX_GRAPH_SEQ");
        }
        finally {
            if(resultSet != null) {
                resultSet.close();
            }
            if(statement != null) {
                statement.close();
            }
        }
    }

    public int insertData(Connection conn, MxGraphSmartEditor mxGraphSmartEditor) throws Exception {
        PreparedStatement preparedStatement = null;

        try {
            preparedStatement = conn.prepareStatement("INSERT INTO TEST_SCHEMA.MX_GRAPH" +
                    "(MX_GRAPH_SEQ, MODEL_XML, IMAGE_XML, IMAGE_WIDTH, IMAGE_HEIGHT, IMAGE_BG_COLOR, " +
                    "CREATE_USER_ID, CREATE_DATE, UPDATE_USER_ID, UPDATE_DATE)\n" +
                    "VALUES(?, ?, ?, ?, ?, ?, ?, CURRENT_TIMESTAMP, ?, CURRENT_TIMESTAMP)");
            preparedStatement.setLong(1, mxGraphSmartEditor.getMxGraphSeq());
            preparedStatement.setString(2, mxGraphSmartEditor.getModelXml());
            preparedStatement.setString(3, mxGraphSmartEditor.getImageXml());
            preparedStatement.setInt(4, mxGraphSmartEditor.getImageWidth());
            preparedStatement.setInt(5, mxGraphSmartEditor.getImageHeight());
            preparedStatement.setString(6, mxGraphSmartEditor.getImageBgColor());
            preparedStatement.setString(7, mxGraphSmartEditor.getCreateUserId());
            preparedStatement.setString(8, mxGraphSmartEditor.getUpdateUserId());
            return preparedStatement.executeUpdate();
        }
        finally {
            if(preparedStatement != null) {
                preparedStatement.close();
            }
        }

    }

    public int updateData(Connection conn, MxGraphSmartEditor mxGraphSmartEditor) throws Exception {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = conn.prepareStatement("UPDATE TEST_SCHEMA.MX_GRAPH " +
                    "SET MODEL_XML = ?, " +
                    "IMAGE_XML = ?, " +
                    "IMAGE_WIDTH = ?, " +
                    "IMAGE_HEIGHT = ?, " +
                    "IMAGE_BG_COLOR = ?, " +
                    "UPDATE_USER_ID = ?, " +
                    "UPDATE_DATE = CURRENT_TIMESTAMP  " +
                    "WHERE MX_GRAPH_SEQ = ?");
            preparedStatement.setString(1, mxGraphSmartEditor.getModelXml());
            preparedStatement.setString(2, mxGraphSmartEditor.getImageXml());
            preparedStatement.setInt(3, mxGraphSmartEditor.getImageWidth());
            preparedStatement.setInt(4, mxGraphSmartEditor.getImageHeight());
            preparedStatement.setString(5, mxGraphSmartEditor.getImageBgColor());
            preparedStatement.setString(6, mxGraphSmartEditor.getUpdateUserId());
            preparedStatement.setLong(7, mxGraphSmartEditor.getMxGraphSeq());
            return preparedStatement.executeUpdate();
        }
        finally {
            if(preparedStatement != null) {
                preparedStatement.close();
            }
        }
    }
}
