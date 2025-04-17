CREATE DATABASE customer;
USE customer;

DROP TABLE customer;

-- Q1: CREATE THE TABLE CUSTOMER CUS_ID AS PRIMARY KEY...
      
CREATE TABLE customer(
            Cus_ID INT PRIMARY KEY,
            Cus_Name VARCHAR(100) NOT NULL,
            Ref_ID INT,
            Prod_ID INT NOT NULL,
            Date_of_purchase DATE,
            Price INT,
            Discount INT
);

-- Q2: INSERT THE GIVEN RECORDS INTO THE TABLE..

INSERT INTO customer(Cus_ID,Cus_Name,Ref_ID,Prod_ID,Date_of_purchase,Price,Discount)
VALUES(1359,'Elina Taylor',1608,20,STR_TO_DATE('05-10-2006', '%d-%m-%Y'),1000,0),
      (1573,'Mark Lyon',1175,40,STR_TO_DATE('07-09-2008','%d-%m-%Y'),1550,110),
      (1932,'Stuart Twain',1608,60,STR_TO_DATE('23-08-2009','%d-%m-%Y'),1550,230),
      (1875,'Allan Samueles',1610,80,STR_TO_DATE('15-11-2011','%d-%m-%Y'),10000,970),
      (1723,'Peter Russel',0,40,STR_TO_DATE('17-07-2010','%d-%m-%Y'),4000,250),
      (1973,'Andre Finch',1932,60,STR_TO_DATE('12-03-2014','%d-%m-%Y'),6000,530),
      (1205,'Steffi Niculous',1175,20,STR_TO_DATE('07-02-2012','%d-%m-%Y'),1500,0),
      (1608,'Adams Frankin',0,80,STR_TO_DATE('05-01-2010','%d-%m-%Y'),8000,509),
      (1175,'Luke Martin',1932,60,STR_TO_DATE('14-12-2007','%d-%m-%Y'),3500,300),
      (1097,'Joseph Milne',1610,40,STR_TO_DATE('07-04-2007','%d-%m-%Y'),1200,80),
      (1850,'Mary Roberts',1875,20,STR_TO_DATE('12-09-2008','%d-%m-%Y'),1170,0),
      (1610,'Sheldon Moris',1175,80,STR_TO_DATE('08-05-2009','%d-%m-%Y'),11050,915);
      
-- Q3: SELECT TOP 3 CUSTOMER_ID FROM THE TABLE..
      
      SELECT Cus_ID FROM customer
      LIMIT 3;
      
-- Q4: CHANGE CUSTOMER_NAME INTO UPPERCASE..

       SELECT upper(Cus_Name) AS Cus_Name FROM customer;
       
-- Q5: LIST CUSTOMER NAME WHO PURCHASE THE PRODUCT ID IS 80.

       SELECT Cus_name,Prod_ID FROM customer
       WHERE Prod_ID=80;

-- Q6: ALTER CUSTOMER TABLE TO SET THE DEFAULT VALUE OF THE CUSTOMER NAME IS "ABC".
     
        ALTER TABLE customer
        MODIFY Cus_Name VARCHAR(100) DEFAULT 'ABC';

-- Q7: LIST FIRST CUSTOMER ID WHOSE PRICE LESS THEN 2000.

        SELECT Cus_ID,Price FROM customer 
        WHERE Price <2000;

-- Q8: LIST THE CUSTOMER BELONGING TO THE PRODUCT ID 20.
       SELECT * FROM customer
       WHERE Prod_ID=20;
       
-- Q9: LIST THE ID AND NAME OF THE CUSTOMERS WHOSE PRODUCT PRICE IS MORE THAN 4000
        
        SELECT Cus_ID,Cus_Name,Price FROM customer
        WHERE Price>4000;

-- Q10: LIST THE CUSTOMER ID ID OF REFRENCE PERSON

   SELECT Cus_ID,Ref_ID FROM customer;

-- Q11: LIST THE RECORDS IN THE ASSENDING ORDER OF THE CUSTOMER NAME 

        SELECT * FROM customer 
        ORDER BY Cus_Name ASC;
        
-- Q12: LIST THE NAME OF THE CUSTOMER WHO PURCHASE THEIR PRODUCTS BEFORE 05-07-2009 .

        SELECT Cus_Name , Date_of_purchase FROM customer 
        WHERE Date_of_purchase < STR_TO_DATE('05-07-2009','%d-%m-%Y');
        
-- Q13: LIST THE NAME OF THE CUSTOMERS WHO DOES NOT REFER ANY PERSON        
       
       SELECT Cus_Name FROM customer
       WHERE Ref_ID=0;
       
-- Q14: LIST THE DIFFERENT PRODUCT ID AVAILABLE IN THE CUSTOMER TABLE

        SELECT DISTINCT Prod_ID 
        FROM customer ;   
  
-- Q15: LIST THE CUSTOMER NAME WHO ARE NOT ELIGIBLE FOR DISCOUNT
 
       SELECT Cus_Name FROM customer 
       WHERE Discount=0;     
       
-- Q16: LIST THE ID OF THE CUSTOMER HAVING "a" AS SECOND CHARECTER OF THEIR NAME 

         SELECT * FROM customer  WHERE Cus_Name LIKE '_a%';
         
-- Q17: LIST THE CUSTOMERS NAME PRODUCT PRICE & PRODUCT ID IN ACCENDING ORDER OF PRODUCT ID THEN ON DECENDING ORDER OF PRICE

         SELECT Cus_Name, Prod_ID,Price FROM customer
		ORDER BY Cus_Name, Prod_ID ASC , Price DESC;
       
-- Q18: COUNT THE NUMBER OF DIFFERENT PRODUCT_ID AVAILABLE IN THE CUSTOMER TABLE 

            SELECT COUNT(DISTINCT Prod_ID) AS PRODUCT
			FROM customer;
            
-- Q19: LIST THE TOTAL PRICE PAID  BY CUSTOMER

         SELECT SUM(Price) AS Total_Price 
         FROM customer;
         
-- Q20: LIST THE MAXIMUM PRICE OF THE PRODUCTS CATEGORIZE AS EQUIPMENT

          SELECT Cus_Name,Price AS EQUIPMENT FROM customer 
          ORDER BY Price DESC LIMIT 1;

-- Q21: LIST THE MINIMUM PRICE OF PRODUCTS IN CUSTOMER TABLE

      SELECT Cus_Name ,Price FROM customer
      ORDER BY Price ASC LIMIT 1;
      
-- Q22: LIST THE AVARAGE PRICE AND THE NO OF CUSTOMERS PURCHASING PRODUCTS HAVING ID 60.

        SELECT AVG(Price) AS AVG_PRICE, COUNT(DISTINCT Cus_Name) AS TOTAL_CUSTOMERS
		FROM customer
         WHERE Prod_ID = 60;
         
 -- Q23: LIST THE avarage price from each job excluding Cosmtics
 
 
 -- Q24: LIST TOTAL PRICE ,MAXIMUM PRICE ,MINIMUM PRICE AND THE AVERAGE PRICE FOR PRODUCT ID 20AND 80
 
      SELECT Prod_ID , SUM(Price) , MIN(Price) , MAX(Price) , AVG(Price) 
      FROM customer
      WHERE Prod_ID IN(20,80)
      GROUP BY Prod_ID;

-- Q25: LIST THE AVERAGE PRICE FOR EACH PRODUCT WITHIN EACH PRODUCT CATOGERY

       
-- Q26: UPATE THE DISCOUNT OF MARK LYON FROM 110 TO 100.

	select * FROM customer; 
    SET SQL_SAFE_UPDATES = 0;
        UPDATE customer
        SET Discount = 100
        WHERE Cus_Name='Mark Lyon' AND Discount=110;
        
-- Q27:  DELETE THE RECORD OF "LUKE MARTIN"

        DELETE FROM customer WHERE Cus_Name = 'Luke Martin';
        
-- Q28: CHANGE THE DATA TYPE SIZE OF CUS_NAME. 

         ALTER TABLE customer MODIFY Cus_Name VARCHAR (200);       

-- Q29: CREATE A COPY OF CUSTOMER TABLES AS NEW CUSTOMER 

        CREATE TABLE new_customer AS
		SELECT * FROM new_customer;

-- Q30: REMOVE THE NEW CUSTOMER TABLE WHILE MAINTAINING ITS STRUCTURE.
           
	     TRUNCATE new_customer;
        
-- Q31: REMOVE THE NEWCUSTOMER TABLE COMPLETLY FROM THE DISK

          DROP TABLE new_customer;   
      
      
  ---- TO VIEW OUR TABLE--------
      SELECT * FROM customer;
      
      
      ---------- THANK YOU -------------
      
      
           



      