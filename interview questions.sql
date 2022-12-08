CREATE TABLE personel5 
(
id int,
isim varchar(50), 
sehir varchar(50), 
maas int, 
sirket varchar(20) );
INSERT INTO personel5 VALUES(123456789, 'Johnny Walk', 'New Hampshire', 2500, 'IBM');
INSERT INTO personel5 VALUES(234567891, 'Brian Pitt', 'Florida', 1500, 'LINUX');
INSERT INTO personel5 VALUES(245678901, 'Eddie Murphy', 'Texas', 3000, 'WELLS FARGO');
INSERT INTO personel5 VALUES(456789012, 'Teddy Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO personel5 VALUES(567890124, 'Eddie Murphy', 'Massachuset', 7000, 'MICROSOFT'); 
INSERT INTO personel5 VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'TD BANK');
INSERT INTO personel5 VALUES(123456719, 'Adem Stone', 'New Jersey', 2500, 'IBM');
CREATE TABLE isciler1
(
id int, 
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
);
INSERT INTO isciler1 VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO isciler1 VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO isciler1 VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO isciler1 VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE'); 
INSERT INTO isciler1 VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT'); 
INSERT INTO isciler1 VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO isciler1 VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');
--Her iki tablodaki ortak id’leri ve personel tablosunda 
--bu id’ye sahip isimleri listeleyen query yaziniz
select id,isim from personel5 where id in (select id from isciler1 where personel5.id=isciler1.id);
--Her iki tablodaki ortak id ve isme sahip kayitlari listeleyen query yaziniz
select id,isim from personel5 intersect
select id,isim from isciler1;
-- Personel tablosunda kac farkli sehirden personel var?
select count(distinct sehir) as farkil_sehir_sayisi from personel5;
--Personel tablosunda id’si cift sayi olan personel’in tum bilgilerini listeleyen Query yaziniz
select * from personel5 where id%2=0;
--Personel tablosunda kac tane kayit oldugunu gosteren query yazin
select count(isim) as kayit_sayisi from personel5;
--Isciler tablosunda en yuksek maasi alan kisinin tum bilgilerini gosteren query yazin
select * from personel5 where maas in (select max(maas) from personel5);
--Personel tablosunda en dusuk maasi alan kisinin tum bilgilerini gosteren query yazin
 select * from personel5 where maas in (select min(maas) from personel5);
--Isciler tablosunda ikinci en yuksek maasi maasi gosteren query yazin
 SELECT *
FROM personel5 
ORDER BY maas desc
offset 1 row
FETCH NEXT 1 ROW ONLY;
--Isciler tablosunda en yuksek maasi alan iscinin disindaki
--tum iscilerin, tum bilgilerini gosteren query yazin
 select * from isciler1 except select * from isciler1 where maas in(select max(maas) from isciler1);