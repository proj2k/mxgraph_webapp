package dao;

import common.Constants;
import model.MxGraphSmartEditor;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.*;

/**
 * Created by kimjaesu on 2017. 2. 11..
 */
public class MxGraphDao {

    public static MxGraphSmartEditor saveData(MxGraphSmartEditor mxGraphSmartEditor) throws Exception{
        Connection conn = null;
        int saveCount = 0;
        try {
            conn = getConnection();
            if(mxGraphSmartEditor.isNew()) {
                long newMxGraphSeq = getNewMxGraphSeq(conn);
                mxGraphSmartEditor.setMxGraphSeq(newMxGraphSeq);
                saveCount = MxGraphDao.insertData(conn, mxGraphSmartEditor);
            }
            else {
                saveCount = MxGraphDao.updateData(conn, mxGraphSmartEditor);
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

    public static long getNewMxGraphSeq(Connection conn) throws SQLException {
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

    public static int insertData(Connection conn, MxGraphSmartEditor mxGraphSmartEditor) throws Exception {
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

    public static int updateData(Connection conn, MxGraphSmartEditor mxGraphSmartEditor) throws Exception {
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

    /**
     *
     * @param mxGraphSeq
     * @return
     * @throws ClassNotFoundException
     * @throws SQLException
     * @throws UnsupportedEncodingException
     */
    public static MxGraphSmartEditor getImageSpec(long mxGraphSeq) throws ClassNotFoundException, SQLException, UnsupportedEncodingException {
        Connection conn = null;
        ResultSet resultSet = null;
        PreparedStatement preparedStatement = null;
        MxGraphSmartEditor mxGraphSmartEditor = new MxGraphSmartEditor();
        try {
            conn = getConnection();
            preparedStatement = conn.prepareStatement("SELECT IMAGE_XML, IMAGE_WIDTH, IMAGE_HEIGHT, IMAGE_BG_COLOR " +
                    "FROM TEST_SCHEMA.MX_GRAPH WHERE MX_GRAPH_SEQ = ?");
            preparedStatement.setLong(1, mxGraphSeq);
            resultSet = preparedStatement.executeQuery();
            if(resultSet.next()) {
                mxGraphSmartEditor.setImageXml(URLDecoder.decode(resultSet.getString("IMAGE_XML"), "UTF-8"));
                mxGraphSmartEditor.setImageWidth(resultSet.getInt("IMAGE_WIDTH"));
                mxGraphSmartEditor.setImageHeight(resultSet.getInt("IMAGE_HEIGHT"));
                mxGraphSmartEditor.setImageBgColor(resultSet.getString("IMAGE_BG_COLOR"));
            }
            return mxGraphSmartEditor;

        }
        finally {
            if(resultSet != null) {
                resultSet.close();
            }
            if(preparedStatement != null) {
                preparedStatement.close();
            }
            if(conn != null) {
                conn.close();
            }
        }
    }

    private static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName(Constants.JDBC_DRIVER);
        return DriverManager.
                getConnection(Constants.DB_URL, Constants.DB_USER, Constants.DB_PASSWORD);
    }

    public static String getModelXml(long mxGraphSeq) throws SQLException, ClassNotFoundException, UnsupportedEncodingException {
        Connection conn = null;
        ResultSet resultSet = null;
        PreparedStatement preparedStatement = null;
        try {
            conn = getConnection();
            preparedStatement = conn.prepareStatement("SELECT MODEL_XML " +
                    "FROM TEST_SCHEMA.MX_GRAPH WHERE MX_GRAPH_SEQ = ?");
            preparedStatement.setLong(1, mxGraphSeq);
            resultSet = preparedStatement.executeQuery();
            if(resultSet.next()) {
                return URLDecoder.decode(resultSet.getString("MODEL_XML"), "UTF-8");
            }
            return "";
        }
        finally {
            if(resultSet != null) {
                resultSet.close();
            }
            if(preparedStatement != null) {
                preparedStatement.close();
            }
            if(conn != null) {
                conn.close();
            }
        }

    }
}
