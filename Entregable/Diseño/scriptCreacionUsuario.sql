CREATE TABLESPACE mytablespace
   DATAFILE 'mytablespace.dbf' SIZE 20M
   AUTOEXTEND ON NEXT 500K MAXSIZE 100M
   LOGGING
   ;
  
  

CREATE TEMPORARY TABLESPACE mytemptablespace
  TEMPFILE 'mytemptablespace.dbf' SIZE 5M AUTOEXTEND ON
  TABLESPACE GROUP mytemptablespacegroup;
  

create user tiendas identified by abc123 
DEFAULT TABLESPACE mytablespace 
 TEMPORARY TABLESPACE mytemptablespace
 ;
 
 
 grant all privileges to tiendas identified by abc123; 