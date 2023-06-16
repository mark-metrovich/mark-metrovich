# Mark Metrovich 
# PSTAT 10 
# homework9 

library(DBI, RSQLite)
library(sqldf)
my_db <- dbConnect(RSQLite :: SQLite(), "my-db.sqlite")
dbListTables(my_db)
#1 
  #a find the phone extension for all employees named brown 
  dbGetQuery(my_db, "SELECT EXTENSION FROM EMPLOYEE_PHONE 
             JOIN EMPLOYEE ON EMPLOYEE_PHONE.EMP_NO = 
             EMPLOYEE.EMP_NO 
             WHERE EMPLOYEE.NAME = 'BROWN'")
    # need to join the emloyee_phone relation with 
    # employee relation to find the name to extension connection 
  
  #B find the name AND phone extension of the accounts manager 
  dbGetQuery(my_db,"SELECT EMPLOYEE.NAME, EMPLOYEE_PHONE.EXTENSION 
             FROM EMPLOYEE JOIN EMPLOYEE_PHONE ON 
             EMPLOYEE.EMP_NO = EMPLOYEE_PHONE.EMP_NO 
             JOIN DEPARTMENT ON EMPLOYEE.EMP_NO = 
             DEPARTMENT.MANAGER 
             WHERE DEPARTMENT.NAME= 'Accounts'") 
    # have to join department, employee_phone, and employee
  
  #C find the names and phone extension of all emps who share an office 
  dbGetQuery(my_db, "SELECT EMPLOYEE.NAME, EMPLOYEE_PHONE.EXTENSION
           FROM EMPLOYEE JOIN EMPLOYEE_PHONE ON 
           EMPLOYEE.EMP_NO = EMPLOYEE_PHONE.EMP_NO
           WHERE EMPLOYEE_PHONE.OFFICE =
           (SELECT OFFICE FROM EMPLOYEE_PHONE GROUP BY 
           OFFICE HAVING COUNT(*)>1)")
  
#2 customer C3 didn't receive their order 
  # write one query to find customer's name, address, date they placed 
  # their order, name, color, and quantities of products purchased 
  # need to join customer, sales_order, 
  dbGetQuery(my_db, "SELECT CUSTOMER.NAME, CUSTOMER.ADDRESS, 
             SALES_ORDER.ORDER_NO, PRODUCT.NAME, PRODUCT.COLOR, 
             INVOICES.QUANTITY 
             FROM CUSTOMER 
             JOIN SALES_ORDER ON 
             CUSTOMER.CUST_NO = SALES_ORDER.CUST_NO 
             JOIN INVOICES ON 
             SALES_ORDER.ORDER_NO = INVOICES.ORDER_NO 
             JOIN PRODUCT ON 
             INVOICES.PROD_NO = PRODUCT.PROD_NO 
             WHERE CUSTOMER.CUST_NO ='C3'")
#3 
  #a add tuple to department 
  dbSendStatement(my_db, "INSERT INTO DEPARTMENT 
                  VALUES('D4', 'COMPLAINTS', 'E3')")
  dbReadTable(my_db, "DEPARTMENT")  

  #b create new department relation that includes the tuple above 
  dbSendQuery(my_db, "CREATE TABLE NEW_DEPARTMENT 
              AS SELECT * FROM DEPARTMENT WHERE 
              DEPT_NO = 'D4'")
    # recall to use create table.. as... to create a new table
    # with existing information
  
  #c check that new_department is in my_db 
  dbListTables(my_db)   # it is in the database 
  
  #d delete new_department 
  dbRemoveTable(my_db, "NEW_DEPARTMENT")
    # use the removetable() to delete the relation
  
  #e check it has been deleted 
  dbListTables(my_db)  # it is removed
  