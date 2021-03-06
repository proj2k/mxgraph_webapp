<%--
  Created by IntelliJ IDEA.
  User: kimjaesu
  Date: 2017. 2. 4.
  Time: AM 12:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.MxGraphDao" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="org.apache.commons.lang3.StringEscapeUtils" %>
<%
    String tmp = request.getParameter("mxGraphSeq");
    long mxGraphSeq;
    if(tmp == null) {
        mxGraphSeq = -1;
    }
    else {
        mxGraphSeq = Long.parseLong(request.getParameter("mxGraphSeq"));
    }
    String modelXml = "";
    try {
        modelXml = MxGraphDao.getModelXml(mxGraphSeq);
    } catch (SQLException e) {
        e.printStackTrace();
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
%>
<html>
<head>
    <title>mxDraw Example</title>
    <link rel="stylesheet" href="css/wordpress.css" type="text/css" media="screen" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style type="text/css" media="screen">
        #page { background: url("images/draw/drawbg.jpg") repeat-y top; border: none; }
    </style>
    <script type="text/javascript">
        var mxBasePath = '../../src';

        var urlParams = (function(url)
        {
            var result = new Object();
            var params = window.location.search.slice(1).split('&');

            for (var i = 0; i < params.length; i++)
            {
                idx = params[i].indexOf('=');

                if (idx > 0)
                {
                    result[params[i].substring(0, idx)] = params[i].substring(idx + 1);
                }
            }

            return result;
        })(window.location.href);

        var mxLanguage = urlParams['lang'];
    </script>
    <script type="text/javascript" src="../../src/js/mxClient.js"></script>
    <script type="text/javascript" src="js/mxApplication.js"></script>
    <script type="text/javascript">
        // Program starts here. The document.onLoad executes the
        // mxApplication constructor with a given configuration.
        // In the config file, the mxEditor.onInit method is
        // overridden to invoke this global function as the
        // last step in the editor constructor.
        function onInit(editor)
        {
            // Enables rotation handle
            mxVertexHandler.prototype.rotationEnabled = true;

            // Enables guides
            mxGraphHandler.prototype.guidesEnabled = true;

            // Alt disables guides
            mxGuide.prototype.isEnabledForEvent = function(evt)
            {
                return !mxEvent.isAltDown(evt);
            };

            // Enables snapping waypoints to terminals
            mxEdgeHandler.prototype.snapToTerminals = true;

            // Defines an icon for creating new connections in the connection handler.
            // This will automatically disable the highlighting of the source vertex.
            mxConnectionHandler.prototype.connectImage = new mxImage('images/connector.gif', 16, 16);

            // Enables connections in the graph and disables
            // reset of zoom and translate on root change
            // (ie. switch between XML and graphical mode).
            editor.graph.setConnectable(true);

            // Clones the source if new connection has no target
            editor.graph.connectionHandler.setCreateTarget(true);

            // Updates the title if the root changes
            var title = document.getElementById('title');

            if (title != null)
            {
                var f = function(sender)
                {
                    title.innerHTML = 'mxDraw - ' + sender.getTitle();
                };

                editor.addListener(mxEvent.ROOT, f);
                f(editor);
            }

//            // Changes the zoom on mouseWheel events
//            mxEvent.addMouseWheelListener(function (evt, up)
//            {
//                if (!mxEvent.isConsumed(evt))
//                {
//                    if (up)
//                    {
//                        editor.execute('zoomIn');
//                    }
//                    else
//                    {
//                        editor.execute('zoomOut');
//                    }
//
//                    mxEvent.consume(evt);
//                }
//            });



            // Defines a new action to switch between
            // XML and graphical display
            var textNode = document.getElementById('xml');
            var graphNode = editor.graph.container;
            var sourceInput = document.getElementById('source');
            sourceInput.checked = false;

            /* 스마트에디터에서 전달된 다이어그램 xml 적용 */
            fDeSetModelFromSmartEditor(editor);

            var funct = function(editor)
            {
                if (sourceInput.checked)
                {
                    graphNode.style.display = 'none';
                    textNode.style.display = 'inline';

                    var enc = new mxCodec();
                    var node = enc.encode(editor.graph.getModel());

                    textNode.value = mxUtils.getPrettyXml(node);
                    textNode.originalValue = textNode.value;
                    textNode.focus();
                }
                else
                {
                    graphNode.style.display = '';

                    if (textNode.value != textNode.originalValue)
                    {
                        var doc = mxUtils.parseXml(textNode.value);
                        var dec = new mxCodec(doc);
                        dec.decode(doc.documentElement, editor.graph.getModel());
                    }

                    textNode.originalValue = null;

                    // Makes sure nothing is selected in IE
                    if (mxClient.IS_IE)
                    {
                        mxUtils.clearSelection();
                    }

                    textNode.style.display = 'none';

                    // Moves the focus back to the graph
                    textNode.blur();
                    editor.graph.container.focus();
                }
            };

            editor.addAction('switchView', funct);

            // Defines a new action to switch between
            // XML and graphical display
            mxEvent.addListener(sourceInput, 'click', function()
            {
                editor.execute('switchView');
            });

            // Create select actions in page
            var node = document.getElementById('mainActions');
            var buttons = ['group', 'ungroup', 'cut', 'copy', 'paste', 'delete', 'undo', 'redo', 'print', 'show', 'save'];

            // Only adds image and SVG export if backend is available
            // NOTE: The old image export in mxEditor is not used, the urlImage is used for the new export.
            editor.urlImage = "http://localhost:8080/exportServlet";
            if (editor.urlImage != null)
            {
                // Client-side code for image export
                var exportImage = function(editor)
                {
                    var graph = editor.graph;
                    var scale = graph.view.scale;
                    var bounds = graph.getGraphBounds();

                    // New image export
                    var xmlDoc = mxUtils.createXmlDocument();
                    var root = xmlDoc.createElement('output');
                    xmlDoc.appendChild(root);

                    // Renders graph. Offset will be multiplied with state's scale when painting state.
                    var xmlCanvas = new mxXmlCanvas2D(root);
                    xmlCanvas.translate(Math.floor(1 / scale - bounds.x), Math.floor(1 / scale - bounds.y));
                    xmlCanvas.scale(scale);

                    var imgExport = new mxImageExport();
                    imgExport.drawState(graph.getView().getState(graph.model.root), xmlCanvas);

                    // Puts request data together
                    var w = Math.ceil(bounds.width * scale + 2);
                    var h = Math.ceil(bounds.height * scale + 2);
                    var xml = mxUtils.getXml(root);

                    // Requests image if request is valid
                    if (w > 0 && h > 0)
                    {
                        var name = 'export.png';
                        var format = 'png';
                        var bg = '&bg=#FFFFFF';

                        new mxXmlRequest(editor.urlImage, 'filename=' + name + '&format=' + format +
                            bg + '&w=' + w + '&h=' + h + '&xml=' + encodeURIComponent(xml)).
                        simulate(document, '_self');
                    }
                };

                editor.addAction('exportImage', exportImage);

                // Client-side code for SVG export
                var exportSvg = function(editor)
                {
                    var graph = editor.graph;
                    var scale = graph.view.scale;
                    var bounds = graph.getGraphBounds();

                    // Prepares SVG document that holds the output
                    var svgDoc = mxUtils.createXmlDocument();
                    var root = (svgDoc.createElementNS != null) ?
                        svgDoc.createElementNS(mxConstants.NS_SVG, 'svg') : svgDoc.createElement('svg');

                    if (root.style != null)
                    {
                        root.style.backgroundColor = '#FFFFFF';
                    }
                    else
                    {
                        root.setAttribute('style', 'background-color:#FFFFFF');
                    }

                    if (svgDoc.createElementNS == null)
                    {
                        root.setAttribute('xmlns', mxConstants.NS_SVG);
                    }

                    root.setAttribute('width', Math.ceil(bounds.width * scale + 2) + 'px');
                    root.setAttribute('height', Math.ceil(bounds.height * scale + 2) + 'px');
                    root.setAttribute('xmlns:xlink', mxConstants.NS_XLINK);
                    root.setAttribute('version', '1.1');

                    // Adds group for anti-aliasing via transform
                    var group = (svgDoc.createElementNS != null) ?
                        svgDoc.createElementNS(mxConstants.NS_SVG, 'g') : svgDoc.createElement('g');
                    group.setAttribute('transform', 'translate(0.5,0.5)');
                    root.appendChild(group);
                    svgDoc.appendChild(root);

                    // Renders graph. Offset will be multiplied with state's scale when painting state.
                    var svgCanvas = new mxSvgCanvas2D(group);
                    svgCanvas.translate(Math.floor(1 / scale - bounds.x), Math.floor(1 / scale - bounds.y));
                    svgCanvas.scale(scale);

                    var imgExport = new mxImageExport();
                    imgExport.drawState(graph.getView().getState(graph.model.root), svgCanvas);

                    var name = 'export.svg';
                    var xml = encodeURIComponent(mxUtils.getXml(root));

                    new mxXmlRequest(editor.urlEcho, 'filename=' + name + '&format=svg' + '&xml=' + xml).simulate(document, "_blank");
                };

                editor.addAction('exportSvg', exportSvg);

                buttons.push('exportImage');
                buttons.push('exportSvg');
            };

            for (var i = 0; i < buttons.length; i++)
            {
                var button = document.createElement('button');
                mxUtils.write(button, mxResources.get(buttons[i]));

                var factory = function(name)
                {
                    return function()
                    {
                        editor.execute(name);
                    };
                };

                mxEvent.addListener(button, 'click', factory(buttons[i]));
                node.appendChild(button);
            }

            // Create select actions in page
            var node = document.getElementById('selectActions');
            mxUtils.write(node, 'Select: ');
            mxUtils.linkAction(node, 'All', editor, 'selectAll');
            mxUtils.write(node, ', ');
            mxUtils.linkAction(node, 'None', editor, 'selectNone');
            mxUtils.write(node, ', ');
            mxUtils.linkAction(node, 'Vertices', editor, 'selectVertices');
            mxUtils.write(node, ', ');
            mxUtils.linkAction(node, 'Edges', editor, 'selectEdges');

            // Create select actions in page
            var node = document.getElementById('zoomActions');
            mxUtils.write(node, 'Zoom: ');
            mxUtils.linkAction(node, 'In', editor, 'zoomIn');
            mxUtils.write(node, ', ');
            mxUtils.linkAction(node, 'Out', editor, 'zoomOut');
            mxUtils.write(node, ', ');
            mxUtils.linkAction(node, 'Actual', editor, 'actualSize');
            mxUtils.write(node, ', ');
            mxUtils.linkAction(node, 'Fit', editor, 'fit');


            /**
             *  스마트에디터에 적용 start
             */
            /**
             * 스마트에디터에서 전달된 다이어그램 xml 적용
             */
            function fDeSetModelFromSmartEditor(editor) {
                var mxGraphSeq = document.getElementById('mxGraphSeq').value;
                var xml = "<%=StringEscapeUtils.escapeEcmaScript(modelXml)%>";
                var doc = mxUtils.parseXml(xml);
                var dec = new mxCodec(doc);
                dec.decode(doc.documentElement, editor.graph.getModel());
            }
            /**
             * 이미지 변환용 XML 생성
             */
            function fDeGetImageXml(ediotr) {
                var imageInfo = {};
                var graph = editor.graph;
                var scale = graph.view.scale;
                var bounds = graph.getGraphBounds();

                // New image export
                var xmlDoc = mxUtils.createXmlDocument();
                var root = xmlDoc.createElement('output');
                xmlDoc.appendChild(root);

                // Renders graph. Offset will be multiplied with state's scale when painting state.
                var xmlCanvas = new mxXmlCanvas2D(root);
                xmlCanvas.translate(Math.floor(1 / scale - bounds.x), Math.floor(1 / scale - bounds.y));
                xmlCanvas.scale(scale);

                var imgExport = new mxImageExport();
                imgExport.drawState(graph.getView().getState(graph.model.root), xmlCanvas);

                // Puts request data together
                var w = Math.ceil(bounds.width * scale + 2);
                var h = Math.ceil(bounds.height * scale + 2);
                var xml = mxUtils.getXml(root);

                // Requests image if request is valid
                if (w > 0 && h > 0)
                {
                    imageInfo.width = w;
                    imageInfo.height = h;
                    imageInfo.bgColor = '#FFFFFF';
                    imageInfo.xml = xml;
                    return imageInfo;
                }
                else {
                    return "<output></output>";
                }
            }
            /**
             * 다이어그램 저장
             * @param modelXml mxgraph용 xml
             * @param imageXml 이미지출력용 xml
             * @param mxGraphSeq 다이어그램식별순번
             */
            function fDeSaveDiagram(modelXml, imageInfo, mxGraphSeq)
            {
                //console.log(mxGroupXml);
                //console.log(imageXml);

                var httpRequest;
                var url = "/saveDiagram";

                if (window.XMLHttpRequest) { // Mozilla, Safari, ...
                    httpRequest = new XMLHttpRequest();
                } else if (window.ActiveXObject) { // IE
                    try {
                        httpRequest = new ActiveXObject("Msxml2.XMLHTTP");
                    }
                    catch (e) {
                        try {
                            httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
                        }
                        catch (e) {}
                    }
                }

                if (!httpRequest) {
                    alert('Giving up :( Cannot create an XMLHTTP instance');
                    // return false;
                }
                httpRequest.onreadystatechange = function () {
                    if (httpRequest.readyState === 4) {
                        if (httpRequest.status === 200) {
                            var mxGraphSeq = httpRequest.responseText;
                            document.getElementById('mxGraphSeq').value = mxGraphSeq;
                            opener.parent.fSeApplyDiagram(mxGraphSeq);
                        } else {
                            alert('There was a problem with the request.');
                        }
                    }
                };
                httpRequest.open('POST', url, false);
                httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                httpRequest.send("modelXml="+encodeURIComponent(encodeURIComponent(modelXml))+
                    "&imageXml="+encodeURIComponent(encodeURIComponent(imageInfo.xml))+
                    "&imageWidth="+imageInfo.width+
                    "&imageHeight="+imageInfo.height+
                    "&imageBgColor="+imageInfo.bgColor+
                    "&mxGraphSeq="+mxGraphSeq);
            }
            /**
             * 저장버튼 이벤트 추가
             */
            editor.addListener(mxEvent.SAVE, function(editor) {

                editor.graph.stopEditing(false); // 수정모드 중지
                //editor.graph.clearSelection(); // 선택상테 해제하고 싶을 때

                var enc = new mxCodec();
                var node = enc.encode(editor.graph.getModel());
                var modelXml = mxUtils.getXml(node);
                var imageInfo = fDeGetImageXml(editor);

                var mxGraphSeq = document.getElementById('mxGraphSeq').value;
                fDeSaveDiagram(modelXml, imageInfo, mxGraphSeq);
            });
            /**
             *  스마트에디터에 적용 end
             */
        }

        window.onbeforeunload = function() { return mxResources.get('changesLost'); };
    </script>
</head>
<body onload="mxApplication('config/diagrameditor.xml');">
<form>
    <input type="hidden" name="mxGrapSeq" id="mxGraphSeq" value="<%=mxGraphSeq%>"/>
</form>
<div id="page">
    <div id="header">
        <div id="headerimg" style="overflow:hidden;">
            <h1 id="title">mxDraw</h1>
        </div>
    </div>
    <div id="mainActions"
         style="width:100%;padding-top:8px;padding-left:24px;padding-bottom:8px;">
    </div>
    <div id="selectActions" style="width:100%;padding-left:54px;padding-bottom:4px;">
    </div>
    <table border="0" width="730px">
        <tr>
            <td id="toolbar" style="width:16px;padding-left:20px;" valign="top">
                <!-- Toolbar Here -->
            </td>
            <td valign="top" style="border-width:1px;border-style:solid;border-color:black;">
                <div id="graph" style="position:relative;height:560px;width:684px;overflow:scroll;cursor:default;">
                    <!-- Graph Here -->
                    <center id="splash" style="padding-top:230px;">
                        <img src="images/loading.gif">
                    </center>
                </div>
                <textarea id="xml" style="height:560px;width:684px;display:none;border-style:none;"></textarea>
            </td>
        </tr>
    </table>
    <span style="float:right;padding-right:36px;">
			<input id="source" type="checkbox"/>Source
		</span>
    <div id="zoomActions" style="width:100%;padding-left:54px;padding-top:4px;">
    </div>
    <div id="footer">
        <p id="status">
            <!-- Status Here -->Loading...
        </p>
        <br/>
    </div>
</div>
</body>
</html>
