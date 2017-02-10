import com.mxgraph.reader.mxGraphViewImageReader;
import common.Constants;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.ParserConfigurationException;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.io.StringReader;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.*;

/**
 * This servlet is used to create bitmaps of graphs from a graph view
 * XML snapshot in a JavaScript client. This is used to speed up the
 * rendering process in older browsers, where the DOM-based rendering
 * takes more time than two requests to the server. The session is
 * required to associate the XML in the POST request with the subsequent
 * GET for the actual image.
 * 
 * We cannot use GET parameters for bundling the XML upload with the
 * image download in a single request since the size of the GET
 * parameters are too limited.
 * 
 * We can also not use a POST request to upload the XML and get the
 * image data in a single request because older browser do no support
 * Data-URLs for images.
 */
public class ServerView extends HttpServlet
{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4951624126588618796L;

	/**
	 * 
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		String xml = null;
		Long mxGraphSeq = Long.valueOf(request.getParameter("mxGraphSeq"));
		try {
			xml = getImageXml(mxGraphSeq);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		String format = request.getParameter("format");

		// PNG seems to have the best compression ratio for images with a
		// lof of white space, as is the case with most graphs/diagrams.
		if (format == null)
		{
			format = "png";
		}

		if (xml != null)
		{
			try
			{
				response.setContentType("image/" + format);

				// Uses a white background color for browsers such as IE6, which
				// do not handle the transparent PNG background correctly.
				streamImage(Color.WHITE, xml, format,
						response.getOutputStream());
				response.setStatus(HttpServletResponse.SC_OK);
				//((Request) request).setHandled(true);
			}
			catch (Exception e)
			{
				e.printStackTrace();
				throw new ServletException(e);
			}
		}
		else
		{
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
		}
	}

	/**
	 * Streams the given XML string as a PNG image into the given stream.
	 * 
	 * @param xml
	 * @param stream
	 * @throws IOException 
	 * @throws SAXException 
	 * @throws ParserConfigurationException 
	 */
	protected void streamImage(Color bg, String xml, String format,
			OutputStream stream) throws ParserConfigurationException,
			SAXException, IOException
	{
		try
		{
			mxGraphViewImageReader reader = new mxGraphViewImageReader(bg, 4,
					true, true);
			InputSource inputSource = new InputSource(new StringReader(xml));
			BufferedImage image = mxGraphViewImageReader.convert(inputSource,
					reader);

			ImageIO.write(image, format, stream);
		}
		catch (OutOfMemoryError error)
		{
			error.printStackTrace();
		}
	}


	public String getImageXml(long mxGraphSeq) throws ClassNotFoundException, SQLException, UnsupportedEncodingException {
		Class.forName(Constants.JDBC_DRIVER);
		Connection conn = null;
		ResultSet resultSet = null;
		PreparedStatement preparedStatement = null;
		try {
			conn = DriverManager.
					getConnection(Constants.DB_URL, Constants.DB_USER, Constants.DB_PASSWORD);
			preparedStatement = conn.prepareStatement("SELECT MODEL_XML, IMAGE_XML FROM TEST_SCHEMA.MX_GRAPH WHERE MX_GRAPH_SEQ = ?");
			preparedStatement.setLong(1, mxGraphSeq);
			resultSet = preparedStatement.executeQuery();
			resultSet.next();
			return URLDecoder.decode(resultSet.getString("IMAGE_XML"), "UTF-8");

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
