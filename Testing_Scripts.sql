

---Generate Customers FirstName, LastName, Accountno, AccountType, CustomerCountry and Balance  

Select FirstName, LastName, b.AccountNo, b.AccountType, c.Country, b.Balance  
from CustomerInfo a 
join Account b on a.CustomerId = b.CustomerId
join CustomerContact c on b.CustomerId= c.CustomerId


----Generate all account balances greater or equal 500,000. 

Select FirstName, LastName, b.AccountNo, b.Balance  
from CustomerInfo a 
join Account b on a.CustomerId = b.CustomerId
join CustomerContact c on b.CustomerId= c.CustomerId
group by FirstName, LastName, b.AccountNo, b.Balance
having b.Balance >= 500000

---Generate FullName of Guarantors, showing FirstName, LastName, AccountNo of Current Account Holders.  

Select a.FirstName, a.LastName, b.AccountNo, b.AccountType, d.FirstName + ' ' + d.LastName GuarantorFullName   
from CustomerInfo a 
join Account b on a.CustomerId = b.CustomerId
join CustomerContact c on b.CustomerId= c.CustomerId
join GuarantorInfo d on d.GurantorId = a.GuarantorId
join GuarantorContact e on e.GuarantorId = d.GurantorId
where b.AccountType = 'Current' 


--Generate Account number, Lastname, of all accounts and  and Firstname of Accountofficers and their staff ID. 
Select  b.AccountNo, a.LastName Account_LastName, f.FirstName AccountOfficer_FirstName, b.StaffId 
from CustomerInfo a 
join Account b on a.CustomerId = b.CustomerId
join CustomerContact c on b.CustomerId= c.CustomerId
join GuarantorInfo d on d.GurantorId = a.GuarantorId
join GuarantorContact e on e.GuarantorId = d.GurantorId
join StaffInfo f on f.StaffId = b.Staffid 
join Loans g on g.AccountNo = b.AccountNo


---Generate all customers who has loans 

Select  a.FirstName Cus_FirstName, a.LastName Cus_LastName, g.LoanAmount, g.LoanStatus 
from CustomerInfo a 
join Account b on a.CustomerId = b.CustomerId
join CustomerContact c on b.CustomerId= c.CustomerId
join GuarantorInfo d on d.GurantorId = a.GuarantorId
join GuarantorContact e on e.GuarantorId = d.GurantorId
join StaffInfo f on f.StaffId = b.Staffid 
join Loans g on g.AccountNo = b.AccountNo


--A script to generate Customer's FirstName, LastName and all Deposit Transactions and Account no. 

Select  a.FirstName Cus_FirstName, a.LastName Cus_LastName, h.TransactionType, h.AccountNo 
from CustomerInfo a 
join Account b on a.CustomerId = b.CustomerId
join CustomerContact c on b.CustomerId= c.CustomerId
join GuarantorInfo d on d.GurantorId = a.GuarantorId
join GuarantorContact e on e.GuarantorId = d.GurantorId
join StaffInfo f on f.StaffId = b.Staffid 
join Loans g on g.AccountNo = b.AccountNo
join Transactions h on h.AccountNo = b.AccountNo
where h.TransactionType = 'Deposit'

-- Generate Staff Firstname, LastName, Designation, Department and HOD 

select a.FirstName Staff_FirstName, a.LastName Staff_LastName, a.StaffDesignation, b.DeptName Staff_Department, b.DeptHead HOD 
from StaffInfo a
join Departments b on a.DeptId = b.DeptId


--- Generate interest rate, loanAmount, year of loan and type of interst owned by Account holders (Names) in 2021 only -- 


select a.InterestRate, b.LoanAmount, year(b.LoanDate) LoanYear, a.InterestType, b.AccountNo, d.FirstName CusName, d.LastName Cus_LastName    
from [dbo].[Interests] a
join Loans b on a.interestId = b.interestId
join Account c on b.AccountNo = c.AccountNo
join CustomerInfo d on d.CustomerId = c.CustomerId
where year(b.LoanDate) = 2021

---Generate all first Five transactions detais by Amount showing Accountholders full name from Top to bottom 


Select top 5 a.*, c.FirstName, c.LastName
from Transactions a 
join Account b on a.AccountNo = b.AccountNo
join CustomerInfo c on c.CustomerId = b.CustomerId 
order by a.TransactionAmount desc



-----INDEX OPTIMIZATION

CREATE INDEX idx_TransactionId
ON Transactions (TransactionId);

Select * from Transactions


