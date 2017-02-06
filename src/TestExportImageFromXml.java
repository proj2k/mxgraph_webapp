import com.mxgraph.io.mxCodec;
import com.mxgraph.util.mxUtils;
import com.mxgraph.util.mxXmlUtils;
import org.w3c.dom.Document;

import java.io.IOException;

/**
 * Created by kimjaesu on 2017. 2. 6..
 */
public class TestExportImageFromXml {
    protected boolean test = false;

    public TestExportImageFromXml()
    {
        // empty
    }

    public boolean isTest()
    {
        return test;
    }

    public void setTest(boolean test)
    {
        this.test = test;
    }

    public static void main(String[] args) throws IOException {
        String xmlSource = mxUtils.readFile(TestExportImageFromXml.class.getResource(
                "/xml/imageoutput.xml").getPath());
        Document document = mxXmlUtils.parseXml(xmlSource);
        System.out.printf("xml:" + xmlSource);

        // mxCodec wants simple class names, so packages must be known
        //mxCodecRegistry.addPackage("com.mxgraph.examples");

        mxCodec codec = new mxCodec();

        TestExportImageFromXml obj = new TestExportImageFromXml();
        obj.setTest(true);

        String xml = mxXmlUtils.getXml(codec.encode(obj));
        System.out.println("encoded: " + xml);

        Document doc = mxXmlUtils.parseXml(xml);

        codec = new mxCodec(doc);
        obj = (TestExportImageFromXml) codec.decode(doc.getDocumentElement());

        System.out.println("decoded: " + obj);

        xml = mxXmlUtils.getXml(codec.encode(obj));
        System.out.println("encoded: " + xml);
    }
}
