--1- '986' kimli�ine sahip Y�netici alt�nda �al��an t�m �al��anlar�n EmpId ve FullNam bilgilerini getiren bir SQL sorgusu yaz�n.select Empld, FullName from EmployeeDetailswhere Managerld = '986';--2- EmployeeSalary tablosundan farkl� projeleri getiren bir SQL sorgusu yaz�n.SELECT DISTINCT Project
FROM EmployeeSalary;
--3- 'P1' projesinde �al��an �al��an say�s�n� getiren bir SQL sorgusu yaz�n.select count(*) AS CalisanSayisifrom EmployeeSalarywhere Project = 'P1' ;--4-  �al��anlar�n en y�ksek, en d���k ve ortalama maa��n� bulan bir SQL sorgusu yaz�n.???????????????--SELECT 
    --MAX(Salary) AS EnYuksekMaas, 
    --MIN(Salary) AS EnDusukMaas, 
    --AVG(Salary AS OrtalamaMaas
--FROM EmployeeSalary;--5-  Maa�� 9000 ile 15000 aral���nda olan �al��anlar�n kimlik bilgisini bulan bir SQL sorgusu yaz�n.select Empldfrom EmployeeSalarywhere Salary BETWEEN 9000 AND 15000;--6- Toronto'da ya�ayan ve ManagerId'si 321 olan y�netici alt�nda �al��an �al��anlar� getiren bir SQL sorgusu yaz�n.

select *from EmployeeDetailswhere City = 'Toronto' And Managerld = 321 ;
--7- Ya Kaliforniya'da ya�ayan ya da ManagerId'si 321 olan bir y�netici alt�nda �al��an t�m �al��anlar� getiren bir SQL sorgusu yaz�n.

select *from EmployeeDetailswhere City = 'California' or Managerld = 321 ;--8- P1 d���ndaki projelerde �al��an t�m �al��anlar� getiren bir SQL sorgusu yaz�n.select *from EmployeeDetailswhere Project <> 'P1';