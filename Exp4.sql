SQL>  create table customerAB(ID int primary key,NAME varchar(30),AGE int,ADDRESS varchar(30),salary float);

Table created.

SQL> insert into customerAB values(1,'abi',32,'tamilnadu',2000.00);

1 row created.

SQL> insert into customerAB values(2,'gokul',29,'kerala',1500.00);

1 row created.

SQL> insert into customerAB values(3,'karthi',22,'villupuram',2000.00);

1 row created.

SQL> insert into customerAB values(4,'kavi',23,'goa',6500.00);

1 row created.

SQL> insert into customerAB values(5,'hardik',27,'bhopal',8500.00);

1 row created.

SQL>  insert into customerAB values(6,'komal',25,'MP',4500.00);

1 row created.

SQL>  select*from customerAB;

        ID NAME                                  AGE
---------- ------------------------------ ----------
ADDRESS                            SALARY
------------------------------ ----------
         1 abi                                    32
tamilnadu                            2000

         2 gokul                                  29
kerala                               1500

         3 karthi                                 22
villupuram                           2000


        ID NAME                                  AGE
---------- ------------------------------ ----------
ADDRESS                            SALARY
------------------------------ ----------
         4 kavi                                   23
goa                                  6500

         5 hardik                                 27
bhopal                               8500

         6 komal                                  25
MP                                   4500


6 rows selected
 
SQL> SET SERVEROUTPUT ON;
SQL> DECLARE
  2  total_rows number(2);
  3  BEGIN
  4  UPDATE customerAB SET salary = salary + 500;
  5  IF sql%notfound THEN
  6  dbms_output.put_line('no customers selected');
  7  ELSIF sql%found THEN
  8  total_rows := sql%rowcount;
  9  dbms_output.put_line( total_rows || 'customerAB selected');
 10  END IF;
 11  END;
 12  /

6 customerAB selected

PL/SQL procedure successfully completed.

SQL> select*from customerAB;

        ID NAME                                  AGE
---------- ------------------------------ ----------
ADDRESS                            SALARY
------------------------------ ----------
         1 abi                                    32
tamilnadu                            2500

         2 gokul                                  29
kerala                               2000

         3 karthi                                 22
villupuram                           2500


        ID NAME                                  AGE
---------- ------------------------------ ----------
ADDRESS                            SALARY
------------------------------ ----------
         4 kavi                                   23
goa                                  7000

         5 hardik                                 27
bhopal                               9000

         6 komal                                  25
MP                                   5000


6 rows selected.


SQL> DECLARE
  2  c_id customerAB.id%type;
  3  c_name customerAB.name%type;
  4  c_addr customerAB.address%type;
  5  CURSOR c_customerAB IS
  6  SELECT id, name, address
  7  FROM customerAB;
  8  BEGIN OPEN c_customerAB;
  9  LOOP
 10  FETCH c_customerAB INTO c_id, c_name, c_addr;
 11  EXIT WHEN c_customerAB%notfound;
 12  dbms_output.put_line(c_id||''||c_name||''||c_addr);
 13  END LOOP;
 14  CLOSE c_customerAB;
 15  END;
 16  /

1 abi tamilnadu
2 gokul kerala
3 karthi villupuram
4 kavi goa
5 hardik bhopal
6 komal MP

PL/SQL procedure successfully completed.

 
