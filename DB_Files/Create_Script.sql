Drop Table If Exists Tags;
Drop Table If Exists Types;

CREATE TABLE Types(
	TY_ID INT NOT NULL AUTO_INCREMENT,
	TY_NAME VARCHAR(30) NOT NULL,
	PRIMARY KEY (TY_ID)
);

Insert into Types (TY_NAME) VALUES ('Room'),('Laptop'),('Dockingstation');

CREATE TABLE Tags (
     T_ID Long NOT NULL,
	 T_TYPE INT,
     T_NAME VARCHAR(30) NOT NULL,
	 T_LASTFOUND Date,
	 T_FOUND_IN_LAST_RUN Boolean NOT NULL,
	 T_ROOMID BIGINT,
     PRIMARY KEY (T_ID),
	 CONSTRAINT FK_TAG_TYPE
		FOREIGN KEY (T_TYPE) REFERENCES Types (TY_ID)	 
 );
 Alter table Tags Add Constraint FK_ROOM_ID FOREIGN KEY (T_ROOMID) References Tags (T_ID);

INSERT INTO Tags (T_ID,T_TYPE,T_NAME) VALUES
    (1,2,'dog');