CREATE SCHEMA Book;

CREATE SCHEMA Person;

CREATE TABLE [Book].[Book](
	[Book_ID] [int] PRIMARY KEY NOT NULL,
	[Book_Name] [nvarchar](50) NOT NULL,
	Author_ID INT NOT NULL,
	Publisher_ID INT NOT NULL

	);

CREATE TABLE [Book].[Author](
	[Author_ID] [int] ,
	[Author_FirstName] [nvarchar](50) Not NULL,
	[Author_LastName] [nvarchar](50) Not NULL
	);

CREATE TABLE [Book].[Publisher](
	[Publisher_ID] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[Publisher_Name] [nvarchar](100) NULL
	);

CREATE TABLE [Person].[Person](
	[SSN] [bigint] PRIMARY KEY NOT NULL,
	[Person_FirstName] [nvarchar](50) NULL,
	[Person_LastName] [nvarchar](50) NULL
	);    

CREATE TABLE [Person].[Loan](
	[SSN] BIGINT NOT NULL,
	[Book_ID] INT NOT NULL,
	PRIMARY KEY ([SSN], [Book_ID])
	);   

CREATE TABLE [Person].[Person_Phone](
	[Phone_Number] [bigint] PRIMARY KEY NOT NULL,
	[SSN] [bigint] NOT NULL	
	);     

CREATE TABLE [Person].[Person_Mail](
	[Mail_ID] INT PRIMARY KEY IDENTITY (1,1),
	[Mail] NVARCHAR(MAX) NOT NULL,
	[SSN] BIGINT UNIQUE NOT NULL	
	);    

INSERT INTO Person.Person (SSN, Person_FirstName, Person_LastName) VALUES (33789290021, 'Ali', 'Kaya')
INSERT into Person.Person (SSN, Person_FirstName, Person_LastName) VALUES (56770451120, 'Burcu', 'Dogan')
SELECT * FROM Person.Person

ALTER TABLE Book.Book ADD CONSTRAINT FK_Author FOREIGN KEY (Author_ID) REFERENCES Book.Author(Author_ID);
ALTER TABLE book.Author ADD CONSTRAINT Pk_author PRIMARY KEY (Author_ID);
ALTER TABLE Book.Author ALTER COLUMN Author_ID INT NOT NULL;

ALTER TABLE Book.book ADD CONSTRAINT FK_publisher FOREIGN KEY (Publisher_ID) REFERENCES Book.Publisher(Publisher_ID);

---Person.Loan
ALTER TABLE [Person].[Loan] ADD CONSTRAINT FK_SSN FOREIGN KEY (SSN) REFERENCES Person.Person (SSN);
ALTER TABLE [Person].[Loan] ADD CONSTRAINT FK_book FOREIGN KEY (Book_ID) REFERENCES Book.Book (Book_ID);
---Person.person_phone
ALTER TABLE [Person].[Person_Phone] ADD CONSTRAINT FK_SSN2 FOREIGN KEY (SSN) REFERENCES Person.Person (SSN);
ALTER TABLE [Person].[Person_Mail] ADD CONSTRAINT FK_SSN3 FOREIGN KEY (SSN) REFERENCES Person.Person (SSN);