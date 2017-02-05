import com.mxgraph.canvas.mxGraphicsCanvas2D;
import com.mxgraph.canvas.mxICanvas2D;
import com.mxgraph.reader.mxDomOutputParser;
import com.mxgraph.reader.mxSaxOutputHandler;
import com.mxgraph.util.mxUtils;
import com.mxgraph.util.mxXmlUtils;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParserFactory;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.StringReader;

/**
 * Created by kimjaesu on 2017. 2. 4..
 */
public class ExportMxImage extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        try {
            exportImage(resp.getOutputStream());
        } catch (ParserConfigurationException e) {
            e.printStackTrace();
        } catch (SAXException e) {
            e.printStackTrace();
        }
    }

    public void exportImage(ServletOutputStream out) throws IOException, ParserConfigurationException, SAXException {
        String xml = mxUtils.readFile(this.getClass().getResource(
                "/xml/imageoutput.xml").getPath());
        int w = 704;
        int h = 685;

        long t0 = System.currentTimeMillis();
        BufferedImage image = mxUtils.createBufferedImage(w, h, Color.WHITE);

        // Creates handle and configures anti-aliasing
        Graphics2D g2 = image.createGraphics();
        mxUtils.setAntiAlias(g2, true, true);
        long t1 = System.currentTimeMillis();

        // Parses request into graphics canvas
        mxGraphicsCanvas2D gc2 = new mxGraphicsCanvas2D(g2);
        parseXmlSax(xml, gc2);
        long t2 = System.currentTimeMillis();

        ImageIO.write(image, "png", out);
        long t3 = System.currentTimeMillis();


        System.out.println("Create img: " + (t1 - t0) + " ms, Parse XML: "
                + (t2 - t1) + " ms, Write File: " + (t3 - t2));
    }

    /**
     * Creates and returns the image for the given request.
     *
     * @param request
     * @return
     * @throws SAXException
     * @throws ParserConfigurationException
     * @throws IOException
     */
    protected void parseXmlDom(String xml, mxICanvas2D canvas)
    {
        new mxDomOutputParser(canvas).read(mxXmlUtils.parseXml(xml)
                .getDocumentElement().getFirstChild());
    }

    /**
     * Creates and returns the image for the given request.
     *
     * @param request
     * @return
     * @throws SAXException
     * @throws ParserConfigurationException
     * @throws IOException
     */
    protected void parseXmlSax(String xml, mxICanvas2D canvas)
            throws SAXException, ParserConfigurationException, IOException
    {
        // Creates SAX handler for drawing to graphics handle
        mxSaxOutputHandler handler = new mxSaxOutputHandler(canvas);

        // Creates SAX parser for handler
        XMLReader reader = SAXParserFactory.newInstance().newSAXParser()
                .getXMLReader();
        reader.setContentHandler(handler);

        // Renders XML data into image
        reader.parse(new InputSource(new StringReader(xml)));
    }
}
