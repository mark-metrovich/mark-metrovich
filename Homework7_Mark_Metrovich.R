# Mark Metrovich 
# homework7 
# PSTAT 10

library(DBI, RSQLite) # load packages from library
library(sqldf)
my_db<- dbConnect(RSQLite::SQLite(), "my-db.sqlite")
# connect to the database with dbConnect()
dbListTables(my_db) # double check all tables are present 

#1 find the emp number and age of all employees who are less than 50 years 
dbGetQuery(my_db, "SELECT EMP_NO, AGE FROM EMPLOYEE WHERE 
           AGE < 50") # using , to include multiple variables 

#2 find names of all employees at tinylclothes 
dbGetQuery(my_db, "SELECT NAME FROM EMPLOYEE") 
# jut selecting names, no distinct function needed 

#3 find all distinct emp names 
dbGetQuery(my_db, "SELECT DISTINCT NAME FROM EMPLOYEE")
#need to add distinct operator since we need distinct names 

#4 find all employee names that begin with B 
dbGetQuery(my_db, "SELECT NAME FROM EMPLOYEE 
           WHERE NAME LIKE 'B%'")
# remember like isnt case sensitive so R and r return same value, since begin 
# with B use % after 

#5 find names and NI numbers of all employees
dbGetQuery(my_db, "SELECT NAME, NI_NO FROM EMPLOYEE")
# remember to use , to return multiple values 

#6find details of employee between age 31 and 65, inclusive 
dbGetQuery(my_db, "SELECT * FROM EMPLOYEE 
           WHERE AGE BETWEEN 31 AND 65")
# can use the between operator after "where age"

#7 have all departments been assigned a manager?
dbGetQuery(my_db, "SELECT * FROM DEPARTMENT") # selecting all to see if all are 
# assigned to manager
# yes they all have a manager 

#8 On what date did customer C3 place their order?
dbGetQuery(my_db, "SELECT DATE FROM SALES_ORDER 
           WHERE CUST_NO == 'C3'")
# use == to find when CUst_no is c3
# C3 made the order on 7/9/19

#9 what products are available in white?
dbGetQuery( my_db, "SELECT NAME FROM PRODUCT WHERE COLOR =='WHITE'")
# return the name of the products, will show what products are white 
#socks and shirts are available in white 

#10 which office does employee E2 occupy?
dbGetQuery(my_db, "SELECT OFFICE FROM EMPLOYEE_PHONE 
           WHERE EMP_NO =='E2'")
# make sure you have correct relation when checking the data sheet 
# E2 occupies office r10