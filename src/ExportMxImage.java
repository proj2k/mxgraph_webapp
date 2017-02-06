import com.mxgraph.io.mxCodec;
import com.mxgraph.reader.mxGraphViewImageReader;
import com.mxgraph.util.mxCellRenderer;
import com.mxgraph.util.mxUtils;
import com.mxgraph.util.mxXmlUtils;
import com.mxgraph.view.mxGraph;
import org.w3c.dom.Document;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.StringReader;
import java.net.URLDecoder;

/**
 * Created by kimjaesu on 2017. 2. 4..
 */
public class ExportMxImage extends HttpServlet{
    /**
     *
     */
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws ServletException, IOException
    {
        HttpSession session = request.getSession();

        if (session != null)
        {
//            Object xml = session.getAttribute("xml");
            String xml = URLDecoder.decode(request.getParameter("xml"), "UTF-8");
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
                    streamImage(Color.WHITE, String.valueOf(xml), format,
                            response.getOutputStream());
                    response.setStatus(HttpServletResponse.SC_OK);
                    //((Request) request).setHandled(true);
                }
                catch (Exception e)
                {
                    throw new ServletException(e);
                }
            }
            else
            {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            }
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

            Document doc = mxXmlUtils.parseXml(mxUtils.readFile(this.getClass().getResource("/xml/graphmodel.xml")
                    .getPath()));

            mxGraph graph = new mxGraph();
            mxCodec codec = new mxCodec(doc);
            codec.decode(doc.getDocumentElement(), graph.getModel());

            ImageIO.write(mxCellRenderer.createBufferedImage(graph, null, 1, null, true, null), "png", new File("oldimageexport.png"));



//            mxGraphViewImageReader reader = new mxGraphViewImageReader(bg, 4,
//                    true, true);
//            InputSource inputSource = new InputSource(new StringReader(xml));
//            BufferedImage image = mxGraphViewImageReader.convert(inputSource,
//                    reader);

//            ImageIO.write(image, format, stream);
            ImageIO.write(mxCellRenderer.createBufferedImage(graph, null, 1, null, true, null), format, stream);
        }
        catch (OutOfMemoryError error)
        {
            error.printStackTrace();
        }
    }

    /**
     *
     */
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException
    {
        String xml = URLDecoder.decode(request.getParameter("xml"), "UTF-8");

        if (xml != null)
        {
            HttpSession session = request.getSession(true);

            try
            {
                session.setAttribute("xml", xml);
                response.setStatus(HttpServletResponse.SC_OK);
                //((Request) request).setHandled(true);
            }
            catch (Exception e)
            {
                throw new ServletException(e);
            }
        }
        else
        {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }
}
