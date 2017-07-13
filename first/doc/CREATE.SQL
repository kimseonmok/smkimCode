drop table tbl_mbr;
CREATE TABLE TBL_MBR(
	MBR_NUM	varchar2(4)	PRIMARY KEY,
	MBR_NAME	VARCHAR2(10)	,
	MBR_JOIN_DATE	DATE,	
	MBR_PWD	VARCHAR2(20),
	MBR_ID VARCHAR2(20)
	);
	
	
insert into tbl_mbr values(select lpad(nvl(mbr_num,0)+1,4,'0') from tbl_mbr,'김선목',sysdate,'1234','smkim91');    