 ---- USO DE RECORD

DECLARE  TYPE emp IS TABLE OF NUMBER INDEX BY VARCHAR2(64);
  employee emp;
  which VARCHAR2(64);
BEGIN
  employee('number') := 1; 
  employee('number') := 2;   

  which := employee.FIRST;
END;
/

-----  USO DE ESTRUTURA DE DADOS DO TIPO TABLE

DECLARE TYPE population IS TABLE OF NUMBER INDEX BY VARCHAR2(64);
city_population  population;        -- Associative array variable
  i                VARCHAR2(64);

BEGIN

  city_population('Recife')  := 2000;
  city_population('Olinda')     := 750000;
  city_population('Paulista') := 1000000;


  city_population('Olinda') := 2001;


  i := city_population.FIRST;

  WHILE i IS NOT NULL LOOP
    DBMS_Output.PUT_LINE
      ('População de ' || i || ' é ' || TO_CHAR(city_population(i)));
    i := city_population.NEXT(i);
  END LOOP;
END;
/


 ----- BLOCO ANÔNIMO

BEGIN
   DBMS_OUTPUT.PUT_LINE('Output:' || CHR(10) || TO_CHAR(SYSDATE,'DAY'));
END;
/


---- CREATE PROCEDURE

CREATE TABLE CIDADES
(
  COD_CIDADE  INTEGER NOT NULL,
  NOME        VARCHAR2(100 BYTE),
  UF          CHAR(2 BYTE)
);

CREATE OR REPLACE PROCEDURE "SP_CIDADES" (
  vCOD_CIDADE  INTEGER,
  vNOME       VARCHAR2,
  vUF         CHAR,
  vOPR        CHAR)
IS
  vEXCEPTION EXCEPTION;
BEGIN   
  IF (vOPR = 'I') THEN
    INSERT INTO CIDADES(COD_CIDADE, NOME, UF) VALUES (vCOD_CIDADE, vNOME, vUF);
  ELSE
  IF(vOPR = 'A') THEN
    UPDATE CIDADES SET NOME = NOME, UF = vUF WHERE COD_CIDADE = vCOD_CIDADE;
  ELSE
  IF(vOPR = 'D')THEN
    DELETE FROM CIDADES WHERE COD_CIDADE = vCOD_CIDADE;
  ELSE
    RAISE vEXCEPTION;
  END IF;
  END IF;
  END IF;
  EXCEPTION
    WHEN vEXCEPTION THEN
      RAISE_APPLICATION_ERROR(-20999,'ATENÇÃO! Operação diferente de I, D, A.', FALSE);
END SP_CIDADES;

 --- --CREATE FUNCTION

CREATE TABLE CIDADES
(
  COD_CIDADE  INTEGER NOT NULL,
  NOME        VARCHAR2(100 BYTE),
  UF          CHAR(2 BYTE)
);

CREATE OR REPLACE Function FindCidade
   ( name_in IN varchar2 )
   RETURN number
IS
   cnumber number;

   cursor c1 is
   SELECT NOME
     FROM CIDADES
     WHERE nome = name_in;

BEGIN

   open c1;
   fetch c1 into cnumber;

   if c1%notfound then
      cnumber := 9999;
   end if;

   close c1;

RETURN cnumber;

EXCEPTION
WHEN OTHERS THEN
   raise_application_error(-20001,'Erro:  - '||SQLCODE||' -ERROR- '||SQLERRM);
END;

----  %TYPE

DROP TABLE telefone PURGE;
create table telefone(
    id NUMBER(15) PRIMARY KEY,
    phone NUMBER(15) NOT NULL
);

INSERT INTO telefone (id, phone) values (1, 998989898);

DECLARE
   CURSOR cur_DADOS (p_phone telefone.phone%TYPE) IS
   SELECT ID, phone
     FROM telefone;
   
   v_ID        telefone.ID%TYPE;
   v_PHONE      telefone.PHONE%TYPE;
   
BEGIN
   OPEN  cur_DADOS (1);
   FETCH cur_DADOS INTO v_ID, v_PHONE;
   CLOSE cur_DADOS;
END;

---- %ROWTYPE

DECLARE
   CURSOR cur_DADOS (p_phone telefone.phone%TYPE) IS
   SELECT ID, phone
     FROM telefone;
   
   v_DADOS     cur_DADOS%ROWTYPE;
   
BEGIN
   OPEN  cur_DADOS (1);
   FETCH cur_DADOS INTO v_DADOS;
   CLOSE cur_DADOS;
END;


---- IF ELSIF

CREATE OR REPLACE Function phone_high
   ( phone_in IN varchar2 )
   RETURN varchar2
IS
   phone_found number(6);
   ILevel varchar2(20);

   cursor c1 is
     SELECT phone
     FROM telefone
     WHERE phone = phone_in;

BEGIN

   open c1;
   fetch c1 into phone_found;
   close c1;

   IF phone_found <= 900000000 THEN
      ILevel := 'Fixo';
      
    ELSIF phone_found <= 900000000 and phone_found >= 600000000 THEN
      ILevel := 'VIVO';

   ELSE
      ILevel := 'OUTROS';

   END IF;

   RETURN ILevel;

END;

---- CASE WHEN

SELECT table_name,
CASE owner
  WHEN 'SYS' THEN 'The owner is SYS'
  WHEN 'SYSTEM' THEN 'The owner is SYSTEM'
  ELSE 'The owner is another value'
END
FROM all_tables;

---- LOOP EXIT WHEN

DECLARE
 v_telefones telefone%ROWTYPE;  -- declare record variable
  CURSOR c1 is SELECT * FROM telefone;
 BEGIN
 OPEN c1; -- open the cursor before fetching
-- An entire row is fetched into the v_employees record
 FOR i IN 1..10 LOOP
FETCH c1 INTO v_telefones;
EXIT WHEN c1%NOTFOUND;
-- process data here
END LOOP;
CLOSE c1;
END;

--- WHILE LOOP

DECLARE
a NUMBER := 1;
BEGIN
WHILE(a <=5)
LOOP
dbms_output.put_line(a);
a:=a+1;
END LOOP;
END;

---- FOR IN LOOP

DECLARE x NUMBER := 0;
BEGIN
    FOR i IN 1..10 LOOP
        dbms_output.put_line(x);
        x:=x+1;
    END LOOP;
END;

--- SELECT ... INTO

declare v_column varchar2(15);
BEGIN
select (
    SELECT phone FROM telefone where id = 1
) into v_column from dual;
END;


CREATE OR REPLACE PACKAGE funcionario AS
  FUNCTION get_nomeCompleto(n_func_id NUMBER)
    RETURN VARCHAR2;
  FUNCTION get_salario(n_func_id NUMBER)
    RETURN NUMBER;
END funcionario;

--- CREATE OR REPLACE TRIGGER (COMANDO​)

CREATE OR REPLACE TRIGGER phone_trigger
    BEFORE INSERT OR UPDATE OR DELETE ON telefone
    BEGIN
        IF TO_CHAR (SYSDATE, 'HH24') NOT BETWEEN '08' AND '18' THEN
        RAISE_APPLICATION_ERROR(-20205,'Alterações são permitidas apenas no horário de expediente');
        END IF;
END phone_trigger;

--- CREATE OR REPLACE TRIGGER (LINHA​)

DROP TABLE telefone PURGE;
create table telefone(
    id NUMBER(15) PRIMARY KEY,
    phone NUMBER(15) NOT NULL
);

CREATE SEQUENCE telephone_seq
 START WITH     1
 INCREMENT BY   1
;


 CREATE OR REPLACE TRIGGER GeneratePhoneID
            BEFORE INSERT OR UPDATE ON telefone
            FOR EACH ROW
BEGIN

            SELECT phone_seq.nextval INTO :new.ID
            FROM dual;

END GeneratePhoneID;

