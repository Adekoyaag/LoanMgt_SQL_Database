-- Create a new database called 'Bank_MAF'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT [name]
        FROM sys.databases
        WHERE [name] = N'Bank_MAF'
)
CREATE DATABASE Bank_MAF
GO


USE Bank_Maf

-- Create a new table called '[CustomerInfo]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[CustomerInfo]', 'U') IS NOT NULL
DROP TABLE [dbo].[CustomerInfo]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[CustomerInfo]
(
    [CustomerId] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [FirstName] NVARCHAR(50) NOT NULL,
    [LastName] NVARCHAR(50) NOT NULL,
    [Gender] NVARCHAR(50),
    [PhoneNumber] NVARCHAR(50) NOT NULL,
    [EmailAddress] NVARCHAR(50) NOT NULL,
    [Nationality] NVARCHAR(50) NOT NULL
    
    -- Specify more columns here
);
GO


-- Add a new column '[GuarantorId]' to table '[CustomerInfo]' in schema '[dbo]'
ALTER TABLE [dbo].[CustomerInfo]
    ADD [GuarantorId] /*new_column_name*/ int /*new_column_datatype*/ NOT NULL /*new_column_nullability*/
GO

ALTER TABLE [dbo].[CustomerInfo]
    ADD FOREIGN KEY ([GuarantorId]) REFERENCES GuarantorInfo(GurantorId)
GO

-- Create a new table called '[CustomerContact]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[CustomerContact]', 'U') IS NOT NULL
DROP TABLE [dbo].[CustomerContact]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[CustomerContact]
(
    [CustomerContactID] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [CustomerId] INT NOT NULL,
    [Address] NVARCHAR(50) NOT NULL,
    [City] NVARCHAR(50) NOT NULL,
    [State] NVARCHAR(50) NOT NULL,
    [Country] NVARCHAR (50) not NULL,
    FOREIGN KEY (CustomerId) REFERENCES CustomerInfo(CustomerId)
    --Specify more columns here
);
GO



-- Create a new table called '[GuarantorInfo]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[GuarantorInfo]', 'U') IS NOT NULL
DROP TABLE [dbo].[GuarantorInfo]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[GuarantorInfo]
(
    [GurantorId] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [FirstName] NVARCHAR(50) NOT NULL,
    [LastName] NVARCHAR(50) NOT NULL,
    [Gender] NVARCHAR(50),
    [PhoneNumber] NVARCHAR(50) NOT NULL,
    [EmailAddress] NVARCHAR(50) NOT NULL,
    [Nationality] NVARCHAR(50) NOT NULL
    
    -- Specify more columns here
);
GO


-- Create a new table called '[CustomerContact]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[GuarantorContact]', 'U') IS NOT NULL
DROP TABLE [dbo].[GuarantorContact]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[GuarantorContact]
(
    [GuarantorContactID] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [GuarantorId] INT NOT NULL,
    [Address] NVARCHAR(50) NOT NULL,
    [City] NVARCHAR(50) NOT NULL,
    [State] NVARCHAR(50) NOT NULL,
    [Country] NVARCHAR (50) not NULL,
    FOREIGN KEY (GuarantorId) REFERENCES GuarantorInfo(GurantorId)
    --Specify more columns here
);
GO


-- Create a new table called '[Account]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Account]', 'U') IS NOT NULL
DROP TABLE [dbo].[Account]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Account]
(
    [AccountNo] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [CustomerId] int NOT NULL,
    [AccountType] NVARCHAR(50) NOT NULL,
    [OpenDate] date NOT NULL,
    [Balance] Money,
    [TransactionId] NVARCHAR(50) NOT NULL
    FOREIGN KEY (CustomerId) REFERENCES CustomerInfo(CustomerId) 
    -- Specify more columns here
);
GO


-- Create a new table called '[Transactions]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Transactions]', 'U') IS NOT NULL
DROP TABLE [dbo].[Transactions]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Transactions]
(
    [TransactionId] NVARCHAR(50) NOT NULL PRIMARY KEY, -- Primary Key column
    [TransactionType] NVARCHAR(20) NOT NULL,
    [TransactionDate] DATE, 
    [TransactionAmount] Money

    -- Specify more columns here
);
GO

ALTER TABLE Account
ADD FOREIGN KEY (TransactionId) REFERENCES Transactions(TransactionID);



-- Create a new table called '[Deposits]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Deposits]', 'U') IS NOT NULL
DROP TABLE [dbo].[Deposits]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Deposits]
(
    [DepositId] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [Accountno] INT NOT NULL,
    [AmountPayable] NVARCHAR(50) NOT NULL,
    [TransactionId] NVARCHAR(50) NOT NULL,
    FOREIGN KEY (TransactionId) REFERENCES Transactions(TransactionID)
    -- Specify more columns here
);
GO


ALTER TABLE Deposits
ADD FOREIGN KEY (AccountNo) REFERENCES Account(AccountNo);



-- Create a new table called '[Departments]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Departments]', 'U') IS NOT NULL
DROP TABLE [dbo].[Departments]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Departments]
(
    [DeptId] NVARCHAR(10) NOT NULL PRIMARY KEY, -- Primary Key column
    [DeptName] NVARCHAR(50) NOT NULL,
    [DeptHead] NVARCHAR(50) NOT NULL
    -- Specify more columns here
);
GO



-- Create a new table called '[StaffInfo]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[StaffInfo]', 'U') IS NOT NULL
DROP TABLE [dbo].[StaffInfo]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[StaffInfo]
(
    [StaffId] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [FirstName] NVARCHAR(50) NOT NULL,
    [LastName] NVARCHAR(50) NOT NULL,
    [StaffDesignation] NVARCHAR(50),
    [DeptId] NVARCHAR(10) NOT NULL,
    FOREIGN KEY (DeptId) REFERENCES Departments(DeptId)
    -- Specify more columns here
);
GO




-- Create a new table called '[Interests]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Interests]', 'U') IS NOT NULL
DROP TABLE [dbo].[Interests]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Interests]
(
    [interestId] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [InterestType] NVARCHAR(50) NOT NULL,
    [InterestRate] NVARCHAR(50) NOT NULL,
    [InterestAmount] Money


    -- Specify more columns here
);
GO


-- Create a new table called '[Loans]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Loans]', 'U') IS NOT NULL
DROP TABLE [dbo].[Loans]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Loans]
(
    [LoanId] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [LoanAmount] Money,
    [LoanDuration] NVARCHAR (3),
    [LoanDate] DATE,
    [LoanStatus] NVARCHAR(50),
    [AccountNo] INT NOT NULL,
    [interestId] INT NOT NULL,

    FOREIGN KEY (AccountNo) REFERENCES Account(AccountNo),
    FOREIGN KEY (interestId) REFERENCES Interests(interestId)
    -- Specify more columns here
);
GO



-- Create a new table called '[Repayment]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Repayment]', 'U') IS NOT NULL
DROP TABLE [dbo].[Repayment]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Repayment]
(
    [RepaymentId] INT NOT NULL PRIMARY KEY, -- Primary Key column
    [AccountNo] INT NOT NULL,
    [TransactionId] NVARCHAR(50) NOT NULL, 
    
    -- Specify more columns here
    FOREIGN KEY (AccountNo) REFERENCES Account(AccountNo),
    FOREIGN KEY (TransactionId) REFERENCES Transactions(TransactionID)
);
GO






