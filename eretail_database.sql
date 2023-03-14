CREATE DATABASE IF NOT EXISTS online shopping;
USE online shopping;

CREATE TABLE Customer
(
	Customer_ID INT UNSIGNED NOT NULL PRIMARY KEY,
	Username VARCHAR(15) ,
	UNIQUE KEY unique_Username(Username),
	Password VARCHAR(15),
	EmailID VARCHAR(60),
	UNIQUE KEY unique_EmailID(EmailID),
	First_Name CHAR(20),
	Middle_Name CHAR(20),
	Last_Name CHAR(20),
	Customer_PhoneNo INT UNSIGNED NOT NULL,
	Age INT UNSIGNED NOT NULL CHECK(Age>13)	
);

CREATE TABLE Products
(
	Product_ID INT UNSIGNED NOT NULL PRIMARY KEY,
	Product_Name VARCHAR(40),
	Price INT UNSIGNED NOT NULL,
	Brand VARCHAR(30),
	Discount VARCHAR,
	Description TEXT,
	Stock INT,
	Sold_Units INT UNSIGNED,
	Rating DECIMAL(5),
	Review TEXT
);

CREATE TABLE Cart
(
	Cart_ID INT UNSIGNED NOT NULL PRIMARY KEY, 
	Total_Cost INT UNSIGNED NOT NULL
);

CREATE TABLE Cart_Item
(
	Item_ID INT UNSIGNED NOT NULL PRIMARY KEY,
	Item_Total_Cost INT UNSIGNED NOT NULL,
	Quantity INT UNSIGNED NOT NULL,
	FOREIGN KEY Item_Product_ID(Product_ID),
	FOREIGN KEY Item_Cart_ID(Cart_ID)	
);

CREATE TABLE Orders
(
	Order_ID INT UNSIGNED NOT NULL PRIMARY KEY,
	Order_Date DATETIME,
	FOREIGN KEY OCart_ID(Cart_ID),
	FOREIGN KEY OCustomer_ID(Customer_ID)
);

CREATE TABLE Payemnts
(
	Payment_ID INT UNSIGNED NOT NULL PRIMARY KEY,
	Payement_Type TEXT,
	Account_No INT UNSIGNED NOT NULL,
	FOREIGN KEY PCart_ID(Cart_ID),
	FOREIGN KEY PCustomer_ID(Customer_ID)
);

CREATE TABLE Courier_Local_Address
(
	Courier_ID INT UNSIGNED NOT NULL PRIMARY KEY,
	Courier_Name VARCHAR(50),
	Courier_Phone_No INT UNSIGNED NOT NULL,
	Courier_House_No TEXT,
	Courier_Colony_Name TEXT,
	Courier_Street_Name TEXT,
	Courier_Landmark TEXT,
	Courier_Address_Type TEXT,
	CL_Courier_Pincode INT(6) UNSIGNED NOT NULL,
	FOREIGN KEY COrder_ID(Order_ID)
);

CREATE TABLE Courier_City_State_District
(
	CC_Courier_Pincode INT(6) UNSIGNED NOT NULL PRIMARY KEY,
	Courier_City TEXT,
	Courier_State TEXT,
	Courier_District TEXT
);

CREATE TABLE Supplier_Local_Address
(
	Supplier_ID INT UNSIGNED NOT NULL PRIMARY KEY,
	Supplier_Name VARCHAR(30),
	Supplier_PhoneNo INT UNSIGNED NOT NULL,
	Supplier_Street_Address TEXT,
	Supplier_Landmark TEXT,
	SL_Supplier_Pincode INT(6) UNSIGNED NOT NULL 
);

CREATE TABLE Supplier_City_State_District
(
	SC_Supplier_Pincode INT(6) UNSIGNED NOT NULL PRIMARY KEY,
	Supplier_City TEXT,
	Supplier_State TEXT,
	Supplier_District TEXT
);

CREATE TABLE Supplier_supplies_Products
(
	SP_Supplier_ID INT UNSIGNED NOT NULL,
	SP_Product_ID INT UNSIGNED NOT NULL,
	PRIMARY KEY(SP_Supplier_ID , SP_Product_ID)
);

CREATE TABLE Customer_buys_Product
(
	CP_Customer_ID INT UNSIGNED NOT NULL,
	CP_Product_ID INT UNSIGNED NOT NULL,
	PRIMARY KEY(CP_Customer_ID , CP_Product_ID)
);

CREATE TABLE Category
(
	Cat_Product_ID INT UNSIGNED NOT NULL,
	Category_Name VARCHAR(30),
	PRIMARY KEY(Cat_Product_ID , Cat_Name)
);

CREATE TABLE Product_Subcategory
(
	SubCat_Product_ID INT UNSIGNED NOT NULL,
	SubCategory_Name VARCHAR(30),
	PRIMARY KEY(SubCat_Product_ID , SubCategory_Name)
);

CREATE TABLE Customer_Accounts
(
	Ac_Customer_ID INT UNSIGNED NOT NULL,
	Ac_Account_No INT UNSIGNED NOT NULL,
	PRIMARY KEY(Ac_Customer_ID , Ac_Account_No)
);

CREATE TABLE Account_IFSC
(
	AI_Account_No INT UNSIGNED NOTNULL PRIMARY KEY,
	AI_IFSC INT UNSIGNED NOT NULL
);

CREATE TABLE IFSC_Bank
(
	IB_IFSC INT UNSIGNED NOT NULL PRIMARY KEY,
	BankName VARCHAR(60),
	Branch VARCHAR(30)
);

CREATE TABLE Address_Local
(
	Adrs_Customer_ID VARCHAR(200) PRIMARY KEY,
	Address_ID INT UNSIGNED NOT NULL,
	House_No INT UNSIGNED NOT NULL,
	Colony_Name VARCHAR(30),
	Street_Address VARCHAR(30),
	Landmark VARCHAR(30),
	AL_Pincode INT(6) UNSIGNED NOT NULL,
);

CREATE TABLE Address_City_State_District
(
	AC_Pincode INT(6) UNSIGNED NOT NULL PRIMARY KEY,
	City VARCHAR(30),
	State VARCHAR(30),
	District VARCHAR(30),
);

-- Addition of new Customers

INSERT INTO Customer VALUES( ‘C_ID’ , ’C_Username’ , ’C_Password’ , ’C_EmaiID’ , ’C_First_Name’ , ’C_Middle_Name’ , ’C_Last_Name’ , ’C_PhoneNo’ , ’C_Age’ );

-- Addition of new Products

INSERT INTO Products VALUES( ‘P_ID’ , ‘P_Name’ , ‘P_Price’ , ‘P_Brand’ , ‘P_Discount’ , ‘P_Description’ , ‘P_Stock’ , ‘P_Sold_Units’ , ‘P_Rating’ , ‘P_Review’ );

-- Addition of Products into a Category

INSERT INTO Category VALUES( ‘Cat_P_ID’ , ‘Cat_Name’ );

-- Addition of Products into a Sub Category

INSERT INTO Product_Subcategory VALUES( ‘SubCat_P_ID’ , ‘SubCat_Name’ );

-- Storing Customer Local Address

INSERT INTO Address_Local VALUES( ‘AL_C_ID’ , ‘AL_ID’ , ‘AL_House_No’ , ‘AL_Colony’ , ‘AL_Street’ , ‘AL_Landmark’ , ‘AL_Pincode’ );

-- Storing Customer State Address

INSERT INTO Address_City_State_District VALUES( ‘AC_Pincode’ , ‘AC_City’ , ‘AC_State’ , ‘AC_District’ );

-- Storing Customer Accounts

INSERT INTO Customer_Accounts VALUES( ‘Ac_C_ID’ , ‘Ac_Account_No’ );

-- Storing Account IFSC

INSERT INTO Account_IFSC VALUES( ‘AI_Account_No’ , ‘AI_IFSC’ );

-- Storing Custommer Bank Details

INSERT INTO IFSC_Bank VALUES( ‘IB_IFSC’ , ‘IB_Name’ , ‘IB_Branch’ );

-- Addition of new Cart

INSERT INTO Cart VALUES( ‘Cart_ID’ , ‘Cart_Total_Cost’ );

-- Addition of items into Cart

INSERT INTO Cart_Item VALUES( ‘CItem_ID’ , ‘CItem_Total_Cost’ , ‘Citem_Quantity’ , ‘CItem_P_ID’ , ‘CItem_Cart_ID’ );

-- Addition of new Orders

INSERT INTO Orders VALUES( ‘O_ID’ , ‘O_Date’ , ‘O_Cart_ID’ , ‘O_C_ID’ );

-- Addition of Payments of Orders

INSERT INTO Payments VALUES( ‘Pay_ID’ , ‘Pay_Type’ , ‘Pay_Account_No’ , ‘Pay_Cart_ID’ , ‘Pay_C_ID’ );

-- Storing Supplier Local Address

INSERT INTO Supplier_Local_Address VALUES( ‘SL_ID’ , ‘SL_Name’ , ‘SL_PhoneNo’ , ‘SL_Street’ , ‘SL_Landmark’ ,’SL_Pincode’ );

-- Storing Supplier State Address

INSERT INTO Supplier_City_State_District VALUES( ‘SC_Pincode’ , ‘SC_City’ , ‘SC_State’ , ‘SC_District’ );

-- Storing Courier Local Address

INSERT INTO Courier_Local_Address VALUES( ‘CL_ID’ , ‘CL_Name’ , ‘CL_Phone_No’ , ‘CL_House_No’ , ‘CL_Colony’ , ‘CL_Street’ , ‘CL_Landmark’ , ‘CL_Address_Type’ , ‘CL_Pincode’ , ‘CL_O_ID’ );

-- Storing Courier State Address

INSERT INTO Courier_City_State_District VALUES( ‘CC_Pincode’ , ‘CC_City’ , ‘CC_State’ , ‘CC_District’ );

-- Customer buying Products

INSERT INTO Customer_buys_Product VALUES( ‘CP_C_ID’ , ‘CP_P_ID’ );

-- Supplier supplying Products

INSERT INTO Supplier_supplies_Products VALUES( ‘SP_SL_ID’ , ‘SP_P_ID’ );

-- Displaying detailed list of all Customers

SELECT * FROM Customer;

-- Displaying detailed list of all Products

SELECT * FROM Products;

-- Displaying list of all Carts

SELECT * FROM Cart;

-- Displaying list of all items in cart

SELECT * FROM Cart_Item;

-- Displaying details of all Orders

SELECT * FROM Orders;

-- Display the available stock of a particular Product

SELECT Stock
FROM Products
WHERE Product_Name = P_Name;

-- Display the sold amount of a particular Product

SELECT Sold_Units
FROM Products
WHERE Product_Name = P_Name;

-- Displaying all the products belonging to a particular category

SELECT Cat_Product_ID 
FROM Customer
WHERE Category_Name = Cat_Name;

-- Displaying all the products belonging to a particular Sub Category

SELECT SubCat_Product_ID
FROM Customer
WHERE SubCategory_Name = SubCat_Name;

-- Displaying details of a particuar Product

SELECT * 
FROM Products
WHERE Product_Name = P_Name;

-- Displaying previous Order details of a Customer (Order History)

SELECT *
FROM Orders
WHERE Customer_Name = C_Name;

-- Removing Items from Cart 

DELETE FROM Cart_Item
WHERE Item_ID = CItem_ID;

