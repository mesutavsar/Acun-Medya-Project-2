--1- '986' kimliðine sahip Yönetici altýnda çalýþan tüm çalýþanlarýn EmpId ve FullNam bilgilerini getiren bir SQL sorgusu yazýn.

select Empld, FullName 
from EmployeeDetails
where Managerld = '986';

--2- EmployeeSalary tablosundan farklý projeleri getiren bir SQL sorgusu yazýn.

SELECT DISTINCT Project
FROM EmployeeSalary;

--3- 'P1' projesinde çalýþan çalýþan sayýsýný getiren bir SQL sorgusu yazýn.

select count(*) AS CalisanSayisi
from EmployeeSalary
where Project = 'P1' ;

--4-  Çalýþanlarýn en yüksek, en düþük ve ortalama maaþýný bulan bir SQL sorgusu yazýn.

SELECT 
    Max (Salary) AS 'En Yüksek Maaþ', 
    Min (Salary) AS 'En Düþük Maaþ', 
    Avg (Salary) AS 'Ortalama Maaþ'
FROM EmployeeSalary

--5-  Maaþý 9000 ile 15000 aralýðýnda olan çalýþanlarýn kimlik bilgisini bulan bir SQL sorgusu yazýn.

select Empld
from EmployeeSalary
where Salary BETWEEN 9000 AND 15000;

select *
from EmployeeDetails
Where Empld in
(select Empld
from EmployeeSalary
where Salary BETWEEN 9000 AND 15000)

select *
from EmployeeSalary D, EmployeeDetails E
where Salary BETWEEN 9000 AND 15000 AND D.Empld=E.Empld


--6- Toronto'da yaþayan ve ManagerId'si 321 olan yönetici altýnda çalýþan çalýþanlarý getiren bir SQL sorgusu yazýn.

select *
from EmployeeDetails
where City = 'Toronto' And Managerld = 321 ;

--7- Ya Kaliforniya'da yaþayan ya da ManagerId'si 321 olan bir yönetici altýnda çalýþan tüm çalýþanlarý getiren bir SQL sorgusu yazýn.

select *
from EmployeeDetails
where City = 'California' or Managerld = 321 ;

--8- P1 dýþýndaki projelerde çalýþan tüm çalýþanlarý getiren bir SQL sorgusu yazýn.

select *
from EmployeeDetails D, EmployeeSalary S
where Project <> 'P1' and D.Empld=S.Empld

--9- Her çalýþanýn toplam maaþýný, Salary ve Variable deðerlerini ekleyerek görüntüleyen bir SQL sorgusu yazýn.

select Salary + Variable as 'Toplam Maaþ'
from EmployeeSalary

--10- Ýsmi herhangi iki karakterle baþlayan, ardýndan "hn" metni gelen ve herhangi bir karakter dizisi ile biten çalýþanlarý getiren bir SQL sorgusu yazýn.

SELECT *
FROM EmployeeDetails
WHERE FullName LIKE '__hn%';

select *
from EmployeeDetails
where CHARINDEX('hn', FullName) = 3

--11- 'EmployeeDetails' ve 'EmployeeSalary' tablolarýnýn herhangi birinde bulunan EmpIds bilgisini getiren bir SQL sorgusu yazýn.

SELECT Empld FROM EmployeeDetails
UNION
SELECT Empld FROM EmployeeSalary;

--12- Ýki tablo arasýndaki ortak kayýtlarý getiren bir SQL sorgusu yazýn.

SELECT *
FROM EmployeeDetails
INNER JOIN EmployeeSalary ON EmployeeDetails.Empld = EmployeeSalary.Empld;

--13- Bir tabloda bulunan ancak diðer tabloda bulunmayan kayýtlarý getiren bir SQL sorgusu yazýn.

SELECT *
FROM EmployeeDetails
LEFT JOIN EmployeeSalary ON EmployeeDetails.Empld = EmployeeSalary.Empld
WHERE EmployeeSalary.Empld IS NULL

--14- 'EmployeeDetails' ve 'EmployeeSalary' tablolarýnda bulunan EmpIds bilgisini getiren bir SQL sorgusu yazýn.

SELECT Empld FROM EmployeeDetails
UNION
SELECT Empld FROM EmployeeSalary;

--15- EmployeeDetails tablosunda bulunan ancak EmployeeSalary tablosunda bulunmayan EmpIds bilgisini getiren bir SQL sorgusu yazýn.

SELECT EmployeeDetails.Empld
FROM EmployeeDetails
LEFT JOIN EmployeeSalary ON EmployeeDetails.Empld = EmployeeSalary.Empld
WHERE EmployeeSalary.Empld IS NULL;

--16- Çalýþanlarýn tam isimlerini boþluðu '-' ile deðiþtirerek getiren bir SQL sorgusu yazýn. ('Replace' fonksiyonunu kullanarak)

SELECT     
    REPLACE(FullName, ' ', '-') AS ÝsimSoyisim
FROM EmployeeDetails;

--17- Verilen karakter(ler)in bir alan içindeki konumunu getiren bir SQL sorgusu yazýn.

SELECT CHARINDEX('s', FullName) AS Konum
FROM EmployeeDetails;

SELECT*
FROM EmployeeDetails;


--18- EmpId ve ManagerId bilgisini bir arada görüntüleyen bir SQL sorgusu yazýn.

Select concat (Empld, '  ', Managerld) As 'Birleþtirilmiþ'
FROM EmployeeDetails;

--19- Çalýþan adýný büyük harf yaparak ve þehir deðerlerini küçük harf yaparak getiren bir SQL sorgusu yazýn.

SELECT 
    UPPER(FullName) AS FullName,
    LOWER(City) AS City
FROM EmployeeDetails;

--20- FullName alanýnda belirli bir karakter olan 'n' karakterinin toplam kaç kez bulunduðunu bulan bir SQL sorgusu yazýn.

SELECT 
    FullName,
    LEN(FullName) - LEN(REPLACE(FullName, 'n', '')) AS 'Sayý'
FROM EmployeeDetails;


--21- Baþýnda ve sonunda boþluklar olan çalýþan adlarýný güncelleyen bir SQL sorgusu yazýn.

UPDATE EmployeeDetails
SET FullName = TRIM(FullName)

--Not1: ltrim soldaki silinir
--Not2: rtrim saðdaki silinir

--22- Herhangi bir projede çalýþmayan tüm çalýþanlarý getiren bir SQL sorgusu yazýn.

SELECT FullName
FROM EmployeeDetails
LEFT JOIN EmployeeSalary ON EmployeeDetails.Empld = EmployeeSalary.Empld
WHERE EmployeeSalary.Empld IS null;

--23- Maaþý 5000'den büyük ve 10000'den küçük veya eþit olan çalýþanlarýn adýný getiren bir SQL sorgusu yazýn.

Select EmployeeDetails.FullName, EmployeeSalary.Salary
FROM EmployeeDetails
INNER JOIN EmployeeSalary ON EmployeeDetails.Empld = EmployeeSalary.Empld
WHERE EmployeeSalary.Salary > 5000 AND EmployeeSalary.Salary <= 10000;

--24- Geçerli tarih ve saati bulan bir SQL sorgusu yazýn.

SELECT GETDATE() AS CurrentDateTime;

--25- EmployeeDetails tablosuna katýlan tüm Çalýþan ayrýntýlarýný, 2020 yýlýnda katýlanlarý getiren bir SQL sorgusu yazýn.

SELECT *
FROM EmployeeDetails
WHERE YEAR(DateOfJoining) = 2020

SELECT *
FROM EmployeeDetails
WHERE DateOfJoining Like '2020%'

SELECT *
FROM EmployeeDetails
WHERE DateOfJoining between convert(datetime,'2000-01-01') and convert(datetime,'2020-12-31')

--26- EmployeeSalary tablosunda maaþ kaydý olan tüm çalýþan kayýtlarýný getiren bir SQL sorgusu yazýn.

select *
from EmployeeSalary
where Salary is not null


--27- Projeye göre sýralanmýþ, projenin çalýþan sayýsýna göre azalan sýrada projeye özgü çalýþan sayýsýný getiren bir SQL sorgusu yazýn.



--28- Çalýþan adlarýný ve maaþ kayýtlarýný getiren bir sorgu yazýn. Maaþ kaydý çalýþan için mevcut olmasa bile çalýþan ayrýntýlarýný görüntüleyin.



--*****************************************************************************************

--Hiç proje yapmamýþ çalýþanlar

select *
From 
EmployeeDetails D left join EmployeeSalary S on D.Empld = S.Empld
Where project is null
