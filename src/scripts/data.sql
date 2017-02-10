insert into TEST_SCHEMA.MX_GRAPH
(MX_GRAPH_SEQ,
MODEL_XML,
IMAGE_XML,
IMAGE_WIDTH,
IMAGE_HEIGHT,
IMAGE_BG_COLOR,
CREATE_USER_ID,
CREATE_DATE,
UPDATE_USER_ID,
UPDATE_DATE)
values(TEST_SCHEMA.MX_GRAPH_SEQ.NEXTVAL,
'<mxGraphModel><root><Diagram label="My Diagram" href="http://www.jgraph.com/" id="0"><mxCell/></Diagram><Layer label="Default Layer" id="1"><mxCell parent="0"/></Layer><Container label="요청팀" href="" id="6"><mxCell style="swimlane" parent="1" vertex="1" connectable="0"><mxGeometry x="70" y="40" width="120" height="600" as="geometry"/></mxCell></Container><Shape label="시작" href="" id="8"><mxCell style="ellipse" parent="6" vertex="1"><mxGeometry x="25" y="30" width="60" height="60" as="geometry"/></mxCell></Shape><Rect label="자재요청" href="" id="9"><mxCell parent="6" vertex="1"><mxGeometry x="15" y="120" width="80" height="40" as="geometry"/></mxCell></Rect><Rect label="자재입고" href="" id="13"><mxCell parent="6" vertex="1"><mxGeometry x="15" y="430" width="80" height="40" as="geometry"/></mxCell></Rect><Shape label="종료" href="" id="14"><mxCell style="doubleEllipse" parent="6" vertex="1"><mxGeometry x="30" y="520" width="60" height="60" as="geometry"/></mxCell></Shape><Connector label="" href="" id="24"><mxCell style="straightConnector" parent="6" source="8" target="9" edge="1"><mxGeometry relative="1" as="geometry"/></mxCell></Connector><Connector label="" href="" id="26"><mxCell style="straightConnector" parent="6" source="13" target="14" edge="1"><mxGeometry relative="1" as="geometry"/></mxCell></Connector><Container label="총무팀(본사)" href="" id="7"><mxCell style="swimlane" parent="1" vertex="1" connectable="0"><mxGeometry x="200" y="40" width="110" height="600" as="geometry"/></mxCell></Container><Rect label="요청접수" href="" id="10"><mxCell parent="7" vertex="1"><mxGeometry x="15" y="120" width="80" height="40" as="geometry"/></mxCell></Rect><Shape label="재고유무" href="" id="11"><mxCell style="rhombus" parent="7" vertex="1"><mxGeometry x="25" y="200" width="60" height="60" as="geometry"/></mxCell></Shape><Rect label="불출" href="" id="12"><mxCell parent="7" vertex="1"><mxGeometry x="15" y="350" width="80" height="40" as="geometry"/></mxCell></Rect><Connector label="Yes" href="" id="20"><mxCell style="straightConnector" parent="7" source="11" target="12" edge="1"><mxGeometry relative="1" as="geometry"/></mxCell></Connector><Connector label="" href="" id="22"><mxCell style="straightConnector" parent="7" source="10" target="11" edge="1"><mxGeometry relative="1" as="geometry"/></mxCell></Connector><Container label="구매팀" href="" id="15"><mxCell style="swimlane" parent="1" vertex="1" connectable="0"><mxGeometry x="320" y="40" width="110" height="600" as="geometry"/></mxCell></Container><Rect label="구매요청접수" href="" id="16"><mxCell parent="15" vertex="1"><mxGeometry x="15" y="265" width="80" height="40" as="geometry"/></mxCell></Rect><Rect label="납품요청" href="" id="17"><mxCell parent="15" vertex="1"><mxGeometry x="15" y="350" width="80" height="40" as="geometry"/></mxCell></Rect><Text label="재고 없는 경우 구매팀으로 이관" href="" id="21"><mxCell style="text" parent="15" vertex="1"><mxGeometry y="180" width="110" height="40" as="geometry"/></mxCell></Text><Connector label="" href="" id="29"><mxCell style="straightConnector" parent="15" source="16" target="17" edge="1"><mxGeometry relative="1" as="geometry"/></mxCell></Connector><Container label="협력업체" href="" id="18"><mxCell style="swimlane" parent="1" vertex="1" connectable="0"><mxGeometry x="440" y="40" width="110" height="600" as="geometry"/></mxCell></Container><Rect label="요청접수" href="" id="30"><mxCell parent="18" vertex="1"><mxGeometry x="15" y="350" width="80" height="40" as="geometry"/></mxCell></Rect><Rect label="자재납품" href="" id="32"><mxCell parent="18" vertex="1"><mxGeometry x="15" y="430" width="80" height="40" as="geometry"/></mxCell></Rect><Connector label="" href="" id="33"><mxCell style="straightConnector" parent="18" source="30" target="32" edge="1"><mxGeometry relative="1" as="geometry"/></mxCell></Connector><Text label="구매팀 사전 예산 승인" href="" id="35"><mxCell style="text" parent="18" vertex="1"><mxGeometry y="230.17391304347825" width="110" height="20" as="geometry"/></mxCell></Text><Connector label="No" href="" id="19"><mxCell style="straightConnector" parent="1" source="11" target="16" edge="1"><mxGeometry relative="1" as="geometry"><Array as="points"><mxPoint x="355" y="270"/></Array></mxGeometry></mxCell></Connector><Connector label="" href="" id="23"><mxCell style="straightConnector" parent="1" source="9" target="10" edge="1"><mxGeometry relative="1" as="geometry"/></mxCell></Connector><Connector label="" href="" id="25"><mxCell style="straightConnector" parent="1" source="12" target="13" edge="1"><mxGeometry relative="1" as="geometry"><Array as="points"><mxPoint x="130" y="410"/></Array></mxGeometry></mxCell></Connector><Connector label="" href="" id="31"><mxCell style="straightConnector" parent="1" source="17" target="30" edge="1"><mxGeometry relative="1" as="geometry"/></mxCell></Connector><Connector label="" href="" id="34"><mxCell style="straightConnector" parent="1" source="32" target="13" edge="1"><mxGeometry relative="1" as="geometry"/></mxCell></Connector><Container label="비고" href="" id="36"><mxCell style="swimlane" parent="1" vertex="1" connectable="0"><mxGeometry x="560" y="40" width="110" height="600" as="geometry"/></mxCell></Container><Text label="협력업체 신용정보 확인" href="" id="38"><mxCell style="text" parent="36" vertex="1"><mxGeometry y="360" width="110" height="40" as="geometry"/></mxCell></Text></root></mxGraphModel>',
'<output><fontfamily family="Arial,Helvetica"/><fontsize size="11"/><shadowcolor color="gray"/><shadowalpha alpha="1"/><shadowoffset dx="2" dy="3"/><translate dx="-69" dy="-39"/><scale scale="1"/><save/><scale scale="1"/><gradient c1="#D4D4D4" c2="white" x="70" y="40" w="120" h="23"/><strokecolor color="#EEEEEE"/><translate dx="70" dy="40"/><begin/><move x="0" y="23"/><line x="0" y="0"/><line x="120" y="0"/><line x="120" y="23"/><close/><fillstroke/><begin/><move x="0" y="23"/><line x="0" y="600"/><line x="120" y="600"/><line x="120" y="23"/><stroke/><restore/><save/><scale scale="1"/><gradient c1="#D4D4D4" c2="white" x="130" y="43" w="114" h="19"/><strokecolor color="#EEEEEE"/><fontcolor color="black"/><text x="130" y="43" w="114" h="19" str="요청팀" align="center" valign="top" wrap="0" format="" overflow="visible" clip="0" rotation="0"/><restore/><save/><scale scale="1"/><shadow enabled="1"/><gradient c1="#CDEB8B" c2="white" x="95" y="70" w="60" h="60"/><strokecolor color="#CDEB8B"/><ellipse x="95" y="70" w="60" h="60"/><fillstroke/><restore/><save/><scale scale="1"/><shadow enabled="1"/><gradient c1="#CDEB8B" c2="white" x="125" y="100" w="54" h="54"/><strokecolor color="#CDEB8B"/><fontcolor color="black"/><text x="125" y="100" w="54" h="54" str="시작" align="center" valign="middle" wrap="0" format="" overflow="visible" clip="0" rotation="0"/><restore/><save/><scale scale="1"/><shadow enabled="1"/><gradient c1="#C3D9FF" c2="white" x="85" y="160" w="80" h="40"/><strokecolor color="#C3D9FF"/><rect x="85" y="160" w="80" h="40"/><fillstroke/><shadow enabled="0"/><restore/><save/><scale scale="1"/><shadow enabled="1"/><gradient c1="#C3D9FF" c2="white" x="125" y="180" w="74" h="34"/><strokecolor color="#C3D9FF"/><fontcolor color="black"/><text x="125" y="180" w="74" h="34" str="자재요청" align="center" valign="middle" wrap="0" format="" overflow="visible" clip="0" rotation="0"/><restore/><save/><scale scale="1"/><shadow enabled="1"/><gradient c1="#C3D9FF" c2="white" x="85" y="470" w="80" h="40"/><strokecolor color="#C3D9FF"/><rect x="85" y="470" w="80" h="40"/><fillstroke/><shadow enabled="0"/><restore/><save/><scale scale="1"/><shadow enabled="1"/><gradient c1="#C3D9FF" c2="white" x="125" y="490" w="74" h="34"/><strokecolor color="#C3D9FF"/><fontcolor color="black"/><text x="125" y="490" w="74" h="34" str="자재입고" align="center" valign="middle" wrap="0" format="" overflow="visible" clip="0" rotation="0"/><restore/><save/><scale scale="1"/><shadow enabled="1"/><gradient c1="#CDEB8B" c2="white" x="100" y="560" w="60" h="60"/><strokecolor color="#CDEB8B"/><ellipse x="100" y="560" w="60" h="60"/><fillstroke/><shadow enabled="0"/><ellipse x="104" y="564" w="52" h="52"/><stroke/><restore/><save/><scale scale="1"/><shadow enabled="1"/><gradient c1="#CDEB8B" c2="white" x="130" y="590" w="46" h="46"/><strokecolor color="#CDEB8B"/><fontcolor color="black"/><text x="130" y="590" w="46" h="46" str="종료" align="center" valign="middle" wrap="0" format="" overflow="visible" clip="0" rotation="0"/><restore/><save/><scale scale="1"/><strokecolor color="#36393D"/><begin/><move x="125" y="130"/><line x="125" y="137.5"/><quad x1="125" y1="145" x2="125" y2="149.32"/><line x="125" y="153.63"/><stroke/><fillcolor color="#36393D"/><begin/><move x="125" y="158.88"/><line x="121.5" y="151.88"/><line x="125" y="153.63"/><line x="128.5" y="151.88"/><close/><fillstroke/><restore/><save/><scale scale="1"/><strokecolor color="#36393D"/><begin/><move x="130" y="510"/><line x="130" y="525"/><quad x1="130" y1="535" x2="130" y2="544.32"/><line x="130" y="553.63"/><stroke/><fillcolor color="#36393D"/><begin/><move x="130" y="558.88"/><line x="126.5" y="551.88"/><line x="130" y="553.63"/><line x="133.5" y="551.88"/><close/><fillstroke/><restore/><save/><scale scale="1"/><gradient c1="#D4D4D4" c2="white" x="200" y="40" w="110" h="23"/><strokecolor color="#EEEEEE"/><translate dx="200" dy="40"/><begin/><move x="0" y="23"/><line x="0" y="0"/><line x="110" y="0"/><line x="110" y="23"/><close/><fillstroke/><begin/><move x="0" y="23"/><line x="0" y="600"/><line x="110" y="600"/><line x="110" y="23"/><stroke/><restore/><save/><scale scale="1"/><gradient c1="#D4D4D4" c2="white" x="255" y="43" w="104" h="19"/><strokecolor color="#EEEEEE"/><fontcolor color="black"/><text x="255" y="43" w="104" h="19" str="총무팀(본사)" align="center" valign="top" wrap="0" format="" overflow="visible" clip="0" rotation="0"/><restore/><save/><scale scale="1"/><shadow enabled="1"/><gradient c1="#C3D9FF" c2="white" x="215" y="160" w="80" h="40"/><strokecolor color="#C3D9FF"/><rect x="215" y="160" w="80" h="40"/><fillstroke/><shadow enabled="0"/><restore/><save/><scale scale="1"/><shadow enabled="1"/><gradient c1="#C3D9FF" c2="white" x="255" y="180" w="74" h="34"/><strokecolor color="#C3D9FF"/><fontcolor color="black"/><text x="255" y="180" w="74" h="34" str="요청접수" align="center" valign="middle" wrap="0" format="" overflow="visible" clip="0" rotation="0"/><restore/><save/><scale scale="1"/><shadow enabled="1"/><gradient c1="#FFCF8A" c2="white" x="225" y="240" w="60" h="60"/><strokecolor color="#FFCF8A"/><begin/><move x="255" y="240"/><line x="285" y="270"/><line x="255" y="300"/><line x="225" y="270"/><close/><fillstroke/><restore/><save/><scale scale="1"/><shadow enabled="1"/><gradient c1="#FFCF8A" c2="white" x="255" y="270" w="54" h="54"/><strokecolor color="#FFCF8A"/><fontcolor color="black"/><text x="255" y="270" w="54" h="54" str="재고유무" align="center" valign="middle" wrap="0" format="" overflow="visible" clip="0" rotation="0"/><restore/><save/><scale scale="1"/><shadow enabled="1"/><gradient c1="#C3D9FF" c2="white" x="215" y="390" w="80" h="40"/><strokecolor color="#C3D9FF"/><rect x="215" y="390" w="80" h="40"/><fillstroke/><shadow enabled="0"/><restore/><save/><scale scale="1"/><shadow enabled="1"/><gradient c1="#C3D9FF" c2="white" x="255" y="410" w="74" h="34"/><strokecolor color="#C3D9FF"/><fontcolor color="black"/><text x="255" y="410" w="74" h="34" str="불출" align="center" valign="middle" wrap="0" format="" overflow="visible" clip="0" rotation="0"/><restore/><save/><scale scale="1"/><strokecolor color="#36393D"/><begin/><move x="255" y="300"/><line x="255" y="335"/><quad x1="255" y1="345" x2="255" y2="355"/><line x="255" y="383.63"/><stroke/><fillcolor color="#36393D"/><begin/><move x="255" y="388.88"/><line x="251.5" y="381.88"/><line x="255" y="383.63"/><line x="258.5" y="381.88"/><close/><fillstroke/><restore/><save/><scale scale="1"/><strokecolor color="#36393D"/><fontcolor color="black"/><fontbackgroundcolor color="white"/><fontsize size="10"/><text x="255" y="345" w="0" h="0" str="Yes" align="center" valign="middle" wrap="0" format="" overflow="visible" clip="0" rotation="0"/><restore/><save/><scale scale="1"/><strokecolor color="#36393D"/><begin/><move x="255" y="200"/><line x="255" y="210"/><quad x1="255" y1="220" x2="255" y2="226.82"/><line x="255" y="233.63"/><stroke/><fillcolor color="#36393D"/><begin/><move x="255" y="238.88"/><line x="251.5" y="231.88"/><line x="255" y="233.63"/><line x="258.5" y="231.88"/><close/><fillstroke/><restore/><save/><scale scale="1"/><gradient c1="#D4D4D4" c2="white" x="320" y="40" w="110" h="23"/><strokecolor color="#EEEEEE"/><translate dx="320" dy="40"/><begin/><move x="0" y="23"/><line x="0" y="0"/><line x="110" y="0"/><line x="110" y="23"/><close/><fillstroke/><begin/><move x="0" y="23"/><line x="0" y="600"/><line x="110" y="600"/><line x="110" y="23"/><stroke/><restore/><save/><scale scale="1"/><gradient c1="#D4D4D4" c2="white" x="375" y="43" w="104" h="19"/><strokecolor color="#EEEEEE"/><fontcolor color="black"/><text x="375" y="43" w="104" h="19" str="구매팀" align="center" valign="top" wrap="0" format="" overflow="visible" clip="0" rotation="0"/><restore/><save/><scale scale="1"/><shadow enabled="1"/><gradient c1="#C3D9FF" c2="white" x="335" y="305" w="80" h="40"/><strokecolor color="#C3D9FF"/><rect x="335" y="305" w="80" h="40"/><fillstroke/><shadow enabled="0"/><restore/><save/><scale scale="1"/><shadow enabled="1"/><gradient c1="#C3D9FF" c2="white" x="375" y="325" w="74" h="34"/><strokecolor color="#C3D9FF"/><fontcolor color="black"/><text x="375" y="325" w="74" h="34" str="구매요청접수" align="center" valign="middle" wrap="0" format="" overflow="visible" clip="0" rotation="0"/><restore/><save/><scale scale="1"/><shadow enabled="1"/><gradient c1="#C3D9FF" c2="white" x="335" y="390" w="80" h="40"/><strokecolor color="#C3D9FF"/><rect x="335" y="390" w="80" h="40"/><fillstroke/><shadow enabled="0"/><restore/><save/><scale scale="1"/><shadow enabled="1"/><gradient c1="#C3D9FF" c2="white" x="375" y="410" w="74" h="34"/><strokecolor color="#C3D9FF"/><fontcolor color="black"/><text x="375" y="410" w="74" h="34" str="납품요청" align="center" valign="middle" wrap="0" format="" overflow="visible" clip="0" rotation="0"/><restore/><save/><scale scale="1"/><rect x="320" y="220" w="110" h="40"/><fillstroke/><restore/><save/><scale scale="1"/><fontcolor color="black"/><fontsize size="12"/><text x="322" y="222" w="106" h="36" str="재고 없는 경우 구매팀으로 이관" align="left" valign="top" wrap="0" format="" overflow="visible" clip="0" rotation="0"/><restore/><save/><scale scale="1"/><strokecolor color="#36393D"/><begin/><move x="375" y="345"/><line x="375" y="357.5"/><quad x1="375" y1="367.5" x2="375" y2="375.57"/><line x="375" y="383.63"/><stroke/><fillcolor color="#36393D"/><begin/><move x="375" y="388.88"/><line x="371.5" y="381.88"/><line x="375" y="383.63"/><line x="378.5" y="381.88"/><close/><fillstroke/><restore/><save/><scale scale="1"/><gradient c1="#D4D4D4" c2="white" x="440" y="40" w="110" h="23"/><strokecolor color="#EEEEEE"/><translate dx="440" dy="40"/><begin/><move x="0" y="23"/><line x="0" y="0"/><line x="110" y="0"/><line x="110" y="23"/><close/><fillstroke/><begin/><move x="0" y="23"/><line x="0" y="600"/><line x="110" y="600"/><line x="110" y="23"/><stroke/><restore/><save/><scale scale="1"/><gradient c1="#D4D4D4" c2="white" x="495" y="43" w="104" h="19"/><strokecolor color="#EEEEEE"/><fontcolor color="black"/><text x="495" y="43" w="104" h="19" str="협력업체" align="center" valign="top" wrap="0" format="" overflow="visible" clip="0" rotation="0"/><restore/><save/><scale scale="1"/><shadow enabled="1"/><gradient c1="#C3D9FF" c2="white" x="455" y="390" w="80" h="40"/><strokecolor color="#C3D9FF"/><rect x="455" y="390" w="80" h="40"/><fillstroke/><shadow enabled="0"/><restore/><save/><scale scale="1"/><shadow enabled="1"/><gradient c1="#C3D9FF" c2="white" x="495" y="410" w="74" h="34"/><strokecolor color="#C3D9FF"/><fontcolor color="black"/><text x="495" y="410" w="74" h="34" str="요청접수" align="center" valign="middle" wrap="0" format="" overflow="visible" clip="0" rotation="0"/><restore/><save/><scale scale="1"/><shadow enabled="1"/><gradient c1="#C3D9FF" c2="white" x="455" y="470" w="80" h="40"/><strokecolor color="#C3D9FF"/><rect x="455" y="470" w="80" h="40"/><fillstroke/><shadow enabled="0"/><restore/><save/><scale scale="1"/><shadow enabled="1"/><gradient c1="#C3D9FF" c2="white" x="495" y="490" w="74" h="34"/><strokecolor color="#C3D9FF"/><fontcolor color="black"/><text x="495" y="490" w="74" h="34" str="자재납품" align="center" valign="middle" wrap="0" format="" overflow="visible" clip="0" rotation="0"/><restore/><save/><scale scale="1"/><strokecolor color="#36393D"/><begin/><move x="495" y="430"/><line x="495" y="440"/><quad x1="495" y1="450" x2="495" y2="456.82"/><line x="495" y="463.63"/><stroke/><fillcolor color="#36393D"/><begin/><move x="495" y="468.88"/><line x="491.5" y="461.88"/><line x="495" y="463.63"/><line x="498.5" y="461.88"/><close/><fillstroke/><restore/><save/><scale scale="1"/><rect x="440" y="270.17" w="110" h="20"/><fillstroke/><restore/><save/><scale scale="1"/><fontcolor color="black"/><fontsize size="12"/><text x="442" y="272.17" w="106" h="16" str="구매팀 사전 예산 승인" align="left" valign="top" wrap="0" format="" overflow="visible" clip="0" rotation="0"/><restore/><save/><scale scale="1"/><strokecolor color="#36393D"/><begin/><move x="285" y="270"/><line x="345" y="270"/><quad x1="355" y1="270" x2="355" y2="280"/><line x="355" y="298.63"/><stroke/><fillcolor color="#36393D"/><begin/><move x="355" y="303.88"/><line x="351.5" y="296.88"/><line x="355" y="298.63"/><line x="358.5" y="296.88"/><close/><fillstroke/><restore/><save/><scale scale="1"/><strokecolor color="#36393D"/><fontcolor color="black"/><fontbackgroundcolor color="white"/><fontsize size="10"/><text x="338" y="270" w="0" h="0" str="No" align="center" valign="middle" wrap="0" format="" overflow="visible" clip="0" rotation="0"/><restore/><save/><scale scale="1"/><strokecolor color="#36393D"/><begin/><move x="165" y="180"/><line x="180" y="180"/><quad x1="190" y1="180" x2="199.32" y2="180"/><line x="208.63" y="180"/><stroke/><fillcolor color="#36393D"/><begin/><move x="213.88" y="180"/><line x="206.88" y="183.5"/><line x="208.63" y="180"/><line x="206.88" y="176.5"/><close/><fillstroke/><restore/><save/><scale scale="1"/><strokecolor color="#36393D"/><begin/><move x="215" y="410"/><line x="140" y="410"/><quad x1="130" y1="410" x2="130" y2="420"/><line x="130" y="463.63"/><stroke/><fillcolor color="#36393D"/><begin/><move x="130" y="468.88"/><line x="126.5" y="461.88"/><line x="130" y="463.63"/><line x="133.5" y="461.88"/><close/><fillstroke/><restore/><save/><scale scale="1"/><strokecolor color="#36393D"/><begin/><move x="415" y="410"/><line x="425" y="410"/><quad x1="435" y1="410" x2="441.82" y2="410"/><line x="448.63" y="410"/><stroke/><fillcolor color="#36393D"/><begin/><move x="453.88" y="410"/><line x="446.88" y="413.5"/><line x="448.63" y="410"/><line x="446.88" y="406.5"/><close/><fillstroke/><restore/><save/><scale scale="1"/><strokecolor color="#36393D"/><begin/><move x="455" y="490"/><line x="320" y="490"/><quad x1="310" y1="490" x2="300" y2="490"/><line x="171.37" y="490"/><stroke/><fillcolor color="#36393D"/><begin/><move x="166.12" y="490"/><line x="173.12" y="486.5"/><line x="171.37" y="490"/><line x="173.12" y="493.5"/><close/><fillstroke/><restore/><save/><scale scale="1"/><gradient c1="#D4D4D4" c2="white" x="560" y="40" w="110" h="23"/><strokecolor color="#EEEEEE"/><translate dx="560" dy="40"/><begin/><move x="0" y="23"/><line x="0" y="0"/><line x="110" y="0"/><line x="110" y="23"/><close/><fillstroke/><begin/><move x="0" y="23"/><line x="0" y="600"/><line x="110" y="600"/><line x="110" y="23"/><stroke/><restore/><save/><scale scale="1"/><gradient c1="#D4D4D4" c2="white" x="615" y="43" w="104" h="19"/><strokecolor color="#EEEEEE"/><fontcolor color="black"/><text x="615" y="43" w="104" h="19" str="비고" align="center" valign="top" wrap="0" format="" overflow="visible" clip="0" rotation="0"/><restore/><save/><scale scale="1"/><rect x="560" y="400" w="110" h="40"/><fillstroke/><restore/><save/><scale scale="1"/><fontcolor color="black"/><fontsize size="12"/><text x="562" y="402" w="106" h="36" str="협력업체 신용정보 확인" align="left" valign="top" wrap="0" format="" overflow="visible" clip="0" rotation="0"/><restore/></output>	',
605,
603,
'#FFFFFF',
'init',
CURRENT_TIMESTAMP,
'init',
CURRENT_TIMESTAMP);