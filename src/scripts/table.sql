CREATE TABLE MX_GRAPH(MX_GRAPH_SEQ bigint auto_increment PRIMARY KEY,
   MODEL_XML CLOB,
   IMAGE_XML CLOB,
   CREATE_USER_ID VARCHAR(50),
   CREATE_DATE TIMESTAMP,
   UPDATE_USER_ID VARCHAR(50),
   UPDATE_DATE TIMESTAMP
);