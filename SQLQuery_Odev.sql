--1- '986' kimli�ine sahip Y�netici alt�nda �al��an t�m �al��anlar�n EmpId ve FullNam bilgilerini getiren bir SQL sorgusu yaz�n.

select Empld, FullName 
from [3.HaftaOdevDB].[dbo].[EmployeeDetails]
where Managerld = '986';

--2- EmployeeSalary tablosundan farkl� projeleri getiren bir SQL sorgusu yaz�n.

SELECT DISTINCT Project
FROM [3.HaftaOdevDB].[dbo].[EmployeeSalary];

--3- 'P1' projesinde �al��an �al��an say�s�n� getiren bir SQL sorgusu yaz�n.

select count(*) AS CalisanSayisi
from [3.HaftaOdevDB].[dbo].[EmployeeSalary]
where Project = 'P1' ;

--4-  �al��anlar�n en y�ksek, en d���k ve ortalama maa��n� bulan bir SQL sorgusu yaz�n.

SELECT 
    Max (Salary) AS 'En Y�ksek Maa�', 
    Min (Salary) AS 'En D���k Maa�', 
    Avg (Salary) AS 'Ortalama Maa�'
FROM [3.HaftaOdevDB].[dbo].[EmployeeSalary]

--5-  Maa�� 9000 ile 15000 aral���nda olan �al��anlar�n kimlik bilgisini bulan bir SQL sorgusu yaz�n.

select Empld
from [3.HaftaOdevDB].[dbo].[EmployeeSalary]
where Salary BETWEEN 9000 AND 15000;

select *
from [3.HaftaOdevDB].[dbo].[EmployeeDetails]
Where Empld in
(select Empld
from [3.HaftaOdevDB].[dbo].[EmployeeSalary]
where Salary BETWEEN 9000 AND 15000)

select *
from [3.HaftaOdevDB].[dbo].[EmployeeSalary] D, [3.HaftaOdevDB].[dbo].[EmployeeDetails] E
where Salary BETWEEN 9000 AND 15000 AND D.Empld=E.Empld


--6- Toronto'da ya�ayan ve ManagerId'si 321 olan y�netici alt�nda �al��an �al��anlar� getiren bir SQL sorgusu yaz�n.

select *
from [3.HaftaOdevDB].[dbo].[EmployeeDetails]
where City = 'Toronto' And Managerld = 321 ;

--7- Ya Kaliforniya'da ya�ayan ya da ManagerId'si 321 olan bir y�netici alt�nda �al��an t�m �al��anlar� getiren bir SQL sorgusu yaz�n.

select *
from [3.HaftaOdevDB].[dbo].[EmployeeDetails]
where City = 'California' or Managerld = 321 ;

--8- P1 d���ndaki projelerde �al��an t�m �al��anlar� getiren bir SQL sorgusu yaz�n.

select *
from [3.HaftaOdevDB].[dbo].[EmployeeDetails] D, [3.HaftaOdevDB].[dbo].[EmployeeSalary] S
where Project <> 'P1' and D.Empld=S.Empld

--9- Her �al��an�n toplam maa��n�, Salary ve Variable de�erlerini ekleyerek g�r�nt�leyen bir SQL sorgusu yaz�n.

select Salary + Variable as 'Toplam Maa�'
from [3.HaftaOdevDB].[dbo].[EmployeeSalary]

--10- �smi herhangi iki karakterle ba�layan, ard�ndan "hn" metni gelen ve herhangi bir karakter dizisi ile biten �al��anlar� getiren bir SQL sorgusu yaz�n.

SELECT *
FROM [3.HaftaOdevDB].[dbo].[EmployeeDetails]
WHERE FullName LIKE '__hn%';

select *
from [3.HaftaOdevDB].[dbo].[EmployeeDetails]
where CHARINDEX('hn', FullName) = 3

--11- 'EmployeeDetails' ve 'EmployeeSalary' tablolar�n�n herhangi birinde bulunan EmpIds bilgisini getiren bir SQL sorgusu yaz�n.

SELECT Empld FROM [3.HaftaOdevDB].[dbo].[EmployeeDetails]
UNION
SELECT Empld FROM [3.HaftaOdevDB].[dbo].[EmployeeSalary];

--12- �ki tablo aras�ndaki ortak kay�tlar� getiren bir SQL sorgusu yaz�n.

SELECT *
FROM [3.HaftaOdevDB].[dbo].[EmployeeDetails]
INNER JOIN [3.HaftaOdevDB].[dbo].[EmployeeSalary] ON EmployeeDetails.Empld = EmployeeSalary.Empld;

--13- Bir tabloda bulunan ancak di�er tabloda bulunmayan kay�tlar� getiren bir SQL sorgusu yaz�n.

SELECT *
FROM [3.HaftaOdevDB].[dbo].[EmployeeDetails]
LEFT JOIN [3.HaftaOdevDB].[dbo].[EmployeeSalary] ON EmployeeDetails.Empld = EmployeeSalary.Empld
WHERE EmployeeSalary.Empld IS NULL

--14- 'EmployeeDetails' ve 'EmployeeSalary' tablolar�nda bulunan EmpIds bilgisini getiren bir SQL sorgusu yaz�n.

SELECT Empld FROM [3.HaftaOdevDB].[dbo].[EmployeeDetails]
UNION
SELECT Empld FROM [3.HaftaOdevDB].[dbo].[EmployeeSalary];

--15- EmployeeDetails tablosunda bulunan ancak EmployeeSalary tablosunda bulunmayan EmpIds bilgisini getiren bir SQL sorgusu yaz�n.

SELECT EmployeeDetails.Empld
FROM [3.HaftaOdevDB].[dbo].[EmployeeDetails]
LEFT JOIN [3.HaftaOdevDB].[dbo].[EmployeeSalary] ON EmployeeDetails.Empld = EmployeeSalary.Empld
WHERE EmployeeSalary.Empld IS NULL;

--16- �al��anlar�n tam isimlerini bo�lu�u '-' ile de�i�tirerek getiren bir SQL sorgusu yaz�n. ('Replace' fonksiyonunu kullanarak)

SELECT     
    REPLACE(FullName, ' ', '-') AS �simSoyisim
FROM [3.HaftaOdevDB].[dbo].[EmployeeDetails];

--17- Verilen karakter(ler)in bir alan i�indeki konumunu getiren bir SQL sorgusu yaz�n.

SELECT CHARINDEX('s', FullName) AS Konum
FROM [3.HaftaOdevDB].[dbo].[EmployeeDetails];

SELECT*
FROM [3.HaftaOdevDB].[dbo].[EmployeeDetails];


--18- EmpId ve ManagerId bilgisini bir arada g�r�nt�leyen bir SQL sorgusu yaz�n.

Select concat (Empld, '  ', Managerld) As 'Birle�tirilmi�'
FROM [3.HaftaOdevDB].[dbo].[EmployeeDetails];

--19- �al��an ad�n� b�y�k harf yaparak ve �ehir de�erlerini k���k harf yaparak getiren bir SQL sorgusu yaz�n.

SELECT 
    UPPER(FullName) AS FullName,
    LOWER(City) AS City
FROM [3.HaftaOdevDB].[dbo].[EmployeeDetails];

--20- FullName alan�nda belirli bir karakter olan 'n' karakterinin toplam ka� kez bulundu�unu bulan bir SQL sorgusu yaz�n.

SELECT 
    FullName,
    LEN(FullName) - LEN(REPLACE(FullName, 'n', '')) AS 'Say�'
FROM [3.HaftaOdevDB].[dbo].[EmployeeDetails];


--21- Ba��nda ve sonunda bo�luklar olan �al��an adlar�n� g�ncelleyen bir SQL sorgusu yaz�n.

UPDATE [3.HaftaOdevDB].[dbo].[EmployeeDetails]
SET FullName = TRIM(FullName)

--Not1: ltrim soldaki silinir
--Not2: rtrim sa�daki silinir

--22- Herhangi bir projede �al��mayan t�m �al��anlar� getiren bir SQL sorgusu yaz�n.

SELECT FullName
FROM [3.HaftaOdevDB].[dbo].[EmployeeDetails]
LEFT JOIN [3.HaftaOdevDB].[dbo].[EmployeeSalary] ON EmployeeDetails.Empld = EmployeeSalary.Empld
WHERE EmployeeSalary.Empld IS null;

--23- Maa�� 5000'den b�y�k ve 10000'den k���k veya e�it olan �al��anlar�n ad�n� getiren bir SQL sorgusu yaz�n.

Select EmployeeDetails.FullName, EmployeeSalary.Salary
FROM [3.HaftaOdevDB].[dbo].[EmployeeDetails]
INNER JOIN [3.HaftaOdevDB].[dbo].[EmployeeSalary] ON EmployeeDetails.Empld = EmployeeSalary.Empld
WHERE EmployeeSalary.Salary > 5000 AND EmployeeSalary.Salary <= 10000;

--24- Ge�erli tarih ve saati bulan bir SQL sorgusu yaz�n.

SELECT GETDATE() AS CurrentDateTime;

--25- EmployeeDetails tablosuna kat�lan t�m �al��an ayr�nt�lar�n�, 2020 y�l�nda kat�lanlar� getiren bir SQL sorgusu yaz�n.

SELECT *
FROM [3.HaftaOdevDB].[dbo].[EmployeeDetails]
WHERE YEAR(DateOfJoining) = 2020

SELECT *
FROM [3.HaftaOdevDB].[dbo].[EmployeeDetails]
WHERE DateOfJoining Like '2020%'

SELECT *
FROM [3.HaftaOdevDB].[dbo].[EmployeeDetails]
WHERE DateOfJoining between convert(datetime,'2000-01-01') and convert(datetime,'2020-12-31')

--26- EmployeeSalary tablosunda maa� kayd� olan t�m �al��an kay�tlar�n� getiren bir SQL sorgusu yaz�n.

select *
from [3.HaftaOdevDB].[dbo].[EmployeeSalary]
where Salary is not null


--27- Projeye g�re s�ralanm��, projenin �al��an say�s�na g�re azalan s�rada projeye �zg� �al��an say�s�n� getiren bir SQL sorgusu yaz�n.



--28- �al��an adlar�n� ve maa� kay�tlar�n� getiren bir sorgu yaz�n. Maa� kayd� �al��an i�in mevcut olmasa bile �al��an ayr�nt�lar�n� g�r�nt�leyin.



--*****************************************************************************************

--Hi� proje yapmam�� �al��anlar

select *
From 
[3.HaftaOdevDB].[dbo].[EmployeeDetails] D left join [3.HaftaOdevDB].[dbo].[EmployeeSalary] S on D.Empld = S.Empld
Where project is null
