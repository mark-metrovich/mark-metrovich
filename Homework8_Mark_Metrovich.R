#Mark Metrovich 
# Homework 8 
# PSTAT 10 

library(DBI, RSQLite)
library(sqldf)
my_db <- dbConnect(RSQLite :: SQLite(), "my-db.sqlite")

#1 find suitbale doman for each attribute for PRODUCT
  # Product 
    #PROD_NO <p1,p2,p3,p4,p5,...>
    # NAME <PANTS, SOCKS, SHIRTS,...>
    # COLOR <BLUE, KHAKI, GREEN, WHITE,...>

#2 find the age of oldest employee 
  dbGetQuery(my_db, "SELECT MAX(AGE) FROM EMPLOYEE")
  # using the max() to find the oldest age

#3 are there any employees under age of 50 that have name with R?
  dbGetQuery(my_db, "SELECT * FROM EMPLOYEE WHERE AGE< 50 AND 
           NAME LIKE '%R%'")
  # use operator < to return only ages less than 50 
  # and the %R% to signify R can be preceeded or followed by any letter 

#4 retrieve the emp no of the sales department manager 
  dbGetQuery(my_db, "SELECT EMP_NO FROM EMPLOYEE INNER JOIN 
           DEPARTMENT ON EMPLOYEE.DEPT_NO = DEPARTMENT.DEPT_NO
           WHERE DEPARTMENT.NAME = 'Sales'")
  # Use the inner join to join the two relations

#5 how many departments are there at tiny clothes? 
  dbGetQuery (my_db, "SELECT COUNT(DEPT_NO) FROM DEPARTMENT")
  # use the count() t count the number of departments, from department 
  # where dept_no is the primary key

#6 what is carol's customer number?
  dbGetQuery(my_db, "SELECT CUST_NO FROM CUSTOMER WHERE NAME LIKE 
           'Carol'")
  # selecting the cust_no where name is like carol

#7 Who works in department 2? 
  dbGetQuery( my_db, "SELECT NAME FROM EMPLOYEE WHERE 
            DEPT_NO = 'D2'")
  # selectig the names of employee who work in dept2

#8 use left join to join employee and department on dept_no 
  dbGetQuery( my_db, "SELECT * FROM EMPLOYEE LEFT JOIN 
            DEPARTMENT ON EMPLOYEE.DEPT_NO =
            DEPARTMENT.DEPT_NO")
  # have to be particular of the left join since order does matter 

#9 create a new relation named retired and insert details 
  # of all employees over 50 years old 
  dbSendQuery (my_db, "CREATE TABLE RETIRED
            AS SELECT * FROM EMPLOYEE 
            WHERE AGE>50")
  # can write in one line of code by using the AS operator 
  # and selecting all from employee relation
  # can also do this in two lines

  dbReadTable(my_db, "RETIRED")
  # double check answer is correct 

