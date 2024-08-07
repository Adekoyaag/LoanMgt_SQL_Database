USE [Bank_MAF]
GO
INSERT [dbo].[Departments] ([DeptId], [DeptName], [DeptHead]) VALUES (N'01', N'Marketing', N'OloriNla')
INSERT [dbo].[Departments] ([DeptId], [DeptName], [DeptHead]) VALUES (N'02', N'Customer Care', N'Mufu')
INSERT [dbo].[Departments] ([DeptId], [DeptName], [DeptHead]) VALUES (N'03', N'Loan Recovery', N'Danger')
INSERT [dbo].[Departments] ([DeptId], [DeptName], [DeptHead]) VALUES (N'04', N'Credit Risk', N'Risky')
GO
INSERT [dbo].[StaffInfo] ([StaffId], [FirstName], [LastName], [StaffDesignation], [DeptId]) VALUES (1414, N'James', N'Sam', N'Account Officer', N'02')
INSERT [dbo].[StaffInfo] ([StaffId], [FirstName], [LastName], [StaffDesignation], [DeptId]) VALUES (1503, N'Yusuf', N'Ali', N'Accout Officer', N'04')
INSERT [dbo].[StaffInfo] ([StaffId], [FirstName], [LastName], [StaffDesignation], [DeptId]) VALUES (1510, N'Adisa', N'Payan', N'Disbursement', N'01')
INSERT [dbo].[StaffInfo] ([StaffId], [FirstName], [LastName], [StaffDesignation], [DeptId]) VALUES (1554, N'Ateef', N'Iain', N'Account Officer', N'01')
GO
SET IDENTITY_INSERT [dbo].[GuarantorInfo] ON 

INSERT [dbo].[GuarantorInfo] ([GurantorId], [FirstName], [LastName], [Gender], [PhoneNumber], [EmailAddress], [Nationality]) VALUES (1, N'Jimoh', N'Aliu', N'Male', N'0805', N'jimohaliu@fam.com', N'Nigerian')
INSERT [dbo].[GuarantorInfo] ([GurantorId], [FirstName], [LastName], [Gender], [PhoneNumber], [EmailAddress], [Nationality]) VALUES (2, N'Max ', N'Nero', N'Male', N'08063575', N'NeroMax@yahoo.com', N'Ghanian')
INSERT [dbo].[GuarantorInfo] ([GurantorId], [FirstName], [LastName], [Gender], [PhoneNumber], [EmailAddress], [Nationality]) VALUES (3, N'Bisola', N'Ayo', N'Female', N'0807757', N'bisolayo@gfam.com', N'British')
SET IDENTITY_INSERT [dbo].[GuarantorInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[CustomerInfo] ON 

INSERT [dbo].[CustomerInfo] ([CustomerId], [FirstName], [LastName], [Gender], [PhoneNumber], [EmailAddress], [Nationality], [GuarantorId]) VALUES (7, N'Michael ', N'Adekoya', N'Male', N'08056685', N'mike@olowo.com', N'Nigerian', 1)
INSERT [dbo].[CustomerInfo] ([CustomerId], [FirstName], [LastName], [Gender], [PhoneNumber], [EmailAddress], [Nationality], [GuarantorId]) VALUES (8, N'Folashade', N'Olowo', N'Female', N'07855200', N'Folashade@mail.com', N'Togolese', 2)
INSERT [dbo].[CustomerInfo] ([CustomerId], [FirstName], [LastName], [Gender], [PhoneNumber], [EmailAddress], [Nationality], [GuarantorId]) VALUES (9, N'Darsha', N'Ali', N'Male', N'078854223', N'Alid@mail.com', N'Parkistian', 3)
SET IDENTITY_INSERT [dbo].[CustomerInfo] OFF
GO
INSERT [dbo].[Account] ([AccountNo], [CustomerId], [AccountType], [OpenDate], [Balance], [StaffId]) VALUES (N'000001', 7, N'Savings', CAST(N'2022-01-08' AS Date), 500000.0000, 1414)
INSERT [dbo].[Account] ([AccountNo], [CustomerId], [AccountType], [OpenDate], [Balance], [StaffId]) VALUES (N'000002', 7, N'Current', CAST(N'2022-01-07' AS Date), 250000.0000, 1414)
INSERT [dbo].[Account] ([AccountNo], [CustomerId], [AccountType], [OpenDate], [Balance], [StaffId]) VALUES (N'000003', 8, N'Current', CAST(N'2022-01-05' AS Date), 4000000.0000, 1414)
INSERT [dbo].[Account] ([AccountNo], [CustomerId], [AccountType], [OpenDate], [Balance], [StaffId]) VALUES (N'000010', 8, N'Savings', CAST(N'2022-01-08' AS Date), 5200000.0000, 1554)
INSERT [dbo].[Account] ([AccountNo], [CustomerId], [AccountType], [OpenDate], [Balance], [StaffId]) VALUES (N'004845', 9, N'Current', CAST(N'2022-01-08' AS Date), 7400000.0000, 1554)
GO
INSERT [dbo].[Transactions] ([TransactionId], [TransactionType], [TransactionDate], [TransactionAmount], [AccountNo]) VALUES (N'50007', N'Deposit', CAST(N'2021-05-01' AS Date), 2300000.0000, N'000001    ')
INSERT [dbo].[Transactions] ([TransactionId], [TransactionType], [TransactionDate], [TransactionAmount], [AccountNo]) VALUES (N'50008', N'Deposit', CAST(N'2021-05-09' AS Date), 450000.0000, N'000001    ')
INSERT [dbo].[Transactions] ([TransactionId], [TransactionType], [TransactionDate], [TransactionAmount], [AccountNo]) VALUES (N'50009', N'Deposit', CAST(N'2021-01-09' AS Date), 230000.0000, N'000003    ')
INSERT [dbo].[Transactions] ([TransactionId], [TransactionType], [TransactionDate], [TransactionAmount], [AccountNo]) VALUES (N'50010', N'Repayment', CAST(N'2022-01-08' AS Date), 10000.0000, N'000002    ')
INSERT [dbo].[Transactions] ([TransactionId], [TransactionType], [TransactionDate], [TransactionAmount], [AccountNo]) VALUES (N'50011', N'Repayment', CAST(N'2022-01-07' AS Date), 20000.0000, N'000003    ')
INSERT [dbo].[Transactions] ([TransactionId], [TransactionType], [TransactionDate], [TransactionAmount], [AccountNo]) VALUES (N'50013', N'Repayment', CAST(N'2022-01-09' AS Date), 30000.0000, N'000002    ')
INSERT [dbo].[Transactions] ([TransactionId], [TransactionType], [TransactionDate], [TransactionAmount], [AccountNo]) VALUES (N'50014', N'Deposit', CAST(N'2022-01-09' AS Date), 500000.0000, N'000001    ')
INSERT [dbo].[Transactions] ([TransactionId], [TransactionType], [TransactionDate], [TransactionAmount], [AccountNo]) VALUES (N'50021', N'Repayment', CAST(N'2021-02-28' AS Date), 15000.0000, N'000002    ')
GO
INSERT [dbo].[Deposits] ([DepositId], [Accountno], [TransactionId]) VALUES (N'40001', N'000001', N'50007')
INSERT [dbo].[Deposits] ([DepositId], [Accountno], [TransactionId]) VALUES (N'40002', N'000001', N'50008')
INSERT [dbo].[Deposits] ([DepositId], [Accountno], [TransactionId]) VALUES (N'40003', N'000003', N'50009')
INSERT [dbo].[Deposits] ([DepositId], [Accountno], [TransactionId]) VALUES (N'40004', N'000001', N'50014')
GO
INSERT [dbo].[Repayment] ([RepaymentId], [AccountNo], [TransactionId]) VALUES (N'9001', N'000002    ', N'50010')
INSERT [dbo].[Repayment] ([RepaymentId], [AccountNo], [TransactionId]) VALUES (N'9002', N'000003    ', N'50011')
INSERT [dbo].[Repayment] ([RepaymentId], [AccountNo], [TransactionId]) VALUES (N'9003', N'000002    ', N'50013')
INSERT [dbo].[Repayment] ([RepaymentId], [AccountNo], [TransactionId]) VALUES (N'9004', N'000002    ', N'50021')
GO
INSERT [dbo].[Interests] ([interestId], [InterestType], [InterestRate]) VALUES (600, N'Long term', N'0.50')
INSERT [dbo].[Interests] ([interestId], [InterestType], [InterestRate]) VALUES (601, N'Short term', N'0.20')
INSERT [dbo].[Interests] ([interestId], [InterestType], [InterestRate]) VALUES (602, N'Long term', N'0.45')
INSERT [dbo].[Interests] ([interestId], [InterestType], [InterestRate]) VALUES (603, N'Short ', N'0.1')
INSERT [dbo].[Interests] ([interestId], [InterestType], [InterestRate]) VALUES (604, N'Long term', N'0.34')
GO
INSERT [dbo].[Loans] ([LoanId], [LoanAmount], [LoanDuration], [LoanDate], [LoanStatus], [AccountNo], [interestId]) VALUES (200, 20000.0000, N'20', CAST(N'2022-01-08' AS Date), N'Active', N'000001', 600)
INSERT [dbo].[Loans] ([LoanId], [LoanAmount], [LoanDuration], [LoanDate], [LoanStatus], [AccountNo], [interestId]) VALUES (201, 50000.0000, N'31', CAST(N'2021-01-08' AS Date), N'Active', N'000002', 600)
INSERT [dbo].[Loans] ([LoanId], [LoanAmount], [LoanDuration], [LoanDate], [LoanStatus], [AccountNo], [interestId]) VALUES (202, 100000.0000, N'60', CAST(N'2021-12-08' AS Date), N'Active', N'000003', 604)
INSERT [dbo].[Loans] ([LoanId], [LoanAmount], [LoanDuration], [LoanDate], [LoanStatus], [AccountNo], [interestId]) VALUES (203, 15000000.0000, N'365', CAST(N'2020-01-08' AS Date), N'Active', N'000003', 603)
GO
INSERT [dbo].[GuarantorContact] ([GuarantorContactID], [GuarantorId], [Address], [City], [State], [Country]) VALUES (1, 1, N'15 Owode', N'Abule Egba', N'Lagos ', N'Nigeria')
INSERT [dbo].[GuarantorContact] ([GuarantorContactID], [GuarantorId], [Address], [City], [State], [Country]) VALUES (100, 2, N'12 Jude road', N'Capetown', N'Capetown', N'SouthAfrica')
INSERT [dbo].[GuarantorContact] ([GuarantorContactID], [GuarantorId], [Address], [City], [State], [Country]) VALUES (120, 3, N'120 Rickman Drive', N'Nechells', N'Birmingham', N'United Kingdom')
GO
