--1- '986' kimliðine sahip Yönetici altýnda çalýþan tüm çalýþanlarýn EmpId ve FullNam bilgilerini getiren bir SQL sorgusu yazýn.select Empld, FullName from EmployeeDetailswhere Managerld = '986';--2- EmployeeSalary tablosundan farklý projeleri getiren bir SQL sorgusu yazýn.SELECT DISTINCT Project
FROM EmployeeSalary;
--3- 'P1' projesinde çalýþan çalýþan sayýsýný getiren bir SQL sorgusu yazýn.select count(*) AS CalisanSayisifrom EmployeeSalarywhere Project = 'P1' ;--4-  Çalýþanlarýn en yüksek, en düþük ve ortalama maaþýný bulan bir SQL sorgusu yazýn.???????????????--SELECT 
    --MAX(Salary) AS EnYuksekMaas, 
    --MIN(Salary) AS EnDusukMaas, 
    --AVG(Salary AS OrtalamaMaas
--FROM EmployeeSalary;--5-  Maaþý 9000 ile 15000 aralýðýnda olan çalýþanlarýn kimlik bilgisini bulan bir SQL sorgusu yazýn.select Empldfrom EmployeeSalarywhere Salary BETWEEN 9000 AND 15000;--6- Toronto'da yaþayan ve ManagerId'si 321 olan yönetici altýnda çalýþan çalýþanlarý getiren bir SQL sorgusu yazýn.

select *from EmployeeDetailswhere City = 'Toronto' And Managerld = 321 ;
--7- Ya Kaliforniya'da yaþayan ya da ManagerId'si 321 olan bir yönetici altýnda çalýþan tüm çalýþanlarý getiren bir SQL sorgusu yazýn.

select *from EmployeeDetailswhere City = 'California' or Managerld = 321 ;--8- P1 dýþýndaki projelerde çalýþan tüm çalýþanlarý getiren bir SQL sorgusu yazýn.select *from EmployeeDetailswhere Project <> 'P1';