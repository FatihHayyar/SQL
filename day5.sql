select * from personel;
CREATE TABLE personel2
(
id int,
isim varchar(50), 
sehir varchar(50), 
maas int, 
sirket varchar(20)
);
INSERT INTO personel2 VALUES(123456789, 'Ali Yilmaz', 'Istanbul',5500, 'Honda'); 
INSERT INTO personel2 VALUES(234567890, 'Veli Sahin', 'Istanbul',4500, 'Toyota'); 
INSERT INTO personel2 VALUES(345678901, 'Mehmet Ozturk', 'Ankara',3500, 'Honda'); 
INSERT INTO personel2 VALUES(456789012,  'Mehmet Ozturk' , 'Izmir',6000, 'Ford'); 
INSERT INTO personel2 VALUES(567890123,  'Mehmet Ozturk' , 'Ankara',7000, 'Tofas'); 
INSERT INTO personel2 VALUES(456789012,  'Veli Sahin' , 'Ankara', 4500, 'Ford'); 
INSERT INTO personel2 VALUES(123456710,' Hatice Sahin', 'Bursa', 4500, 'Honda');
--Her sirketin MIN maaslarini eger 2000’den buyukse goster
select sirket, min(maas) as min_maas from personel2 group by sirket having min(maas)>2000;
--Ayni isimdeki kisilerin aldigi toplam gelir 10000 liradan fazla ise ismi 
--ve toplam maasi gosteren sorgu yaziniz
select isim,sum(maas) as top_maas from personel2 group by isim having sum(maas)>10000;
-- Eger bir sehirde calisan personel sayisi 1’den
--coksa sehir ismini ve personel sayisini veren sorgu yaziniz
select sehir, count(isim) as perso_say from personel2 group by sehir having count(isim)>1;
-- Eger bir sehirde alinan MAX maas 5000’den dusukse
--sehir ismini ve MAX maasi veren sorgu yaziniz
select sehir, max(maas) as max_maas from personel2 group by sehir having max(maas)<5000;
select * from personel2;
--Maasi 4000’den cok olan isci isimlerini ve 5000 liradan fazla maas alinan
--sehirleri gosteren sorguyu yaziniz
select isim as isci_veya_sehir, maas from personel2 where maas>4000 
union select sehir as isci_veya_sehir,maas from personel2 where maas>5000;
-- Mehmet Ozturk ismindeki kisilerin aldigi maaslari ve Istanbul’daki personelin maaslarini
--bir tabloda gosteren sorgu yaziniz
select isim as mehmet_Istanbul_maas, maas from personel2 where isim='Mehmet Ozturk'
union select sehir as mehmet_istanbul_maas, maas from personel2 where sehir='Istanbul';
--Sehirlerden odenen ucret 3000’den fazla olanlari ve personelden ucreti 5000’den az
--olanlari bir tabloda maas miktarina gore sirali
--olarak gosteren sorguyu yaziniz
select sehir as sehir_personel , maas from personel2  where maas>3000
union select isim as sehir_personel,maas from personel2 where maas<5000 order by maas;
cREATE TABLE personel3
(
id int,
isim varchar(50), 
sehir varchar(50), 
maas int, 
sirket varchar(20),
CONSTRAINT personel_pk PRIMARY KEY (id)
);
INSERT INTO personel3 VALUES(123456789, 'Ali Yilmaz', 'Istanbul',5500, 'Honda'); 
INSERT INTO personel3 VALUES(234567890, 'Veli Sahin', 'Istanbul',4500, 'Toyota'); 
INSERT INTO personel3 VALUES(345678901, 'Mehmet Ozturk', 'Ankara',3500, 'Honda'); 
INSERT INTO personel3 VALUES(456789012,  'Mehmet Ozturk' , 'Izmir',6000, 'Ford'); 
INSERT INTO personel3 VALUES(567890123,  'Mehmet Ozturk' , 'Ankara',7000, 'Tofas'); 
INSERT INTO personel3 VALUES(456711012,  'Veli Sahin' , 'Ankara', 4500, 'Ford'); 
INSERT INTO personel3 VALUES(123456710,' Hatice Sahin', 'Bursa', 4500, 'Honda');
select * from personel3;
CREATE TABLE personel_bilgi (
id int,
tel char(10) UNIQUE , 
cocuk_sayisi int,
CONSTRAINT personel_bilgi_fk FOREIGN KEY 
(id) REFERENCES personel3(id)
);
INSERT INTO personel_bilgi VALUES(123456789, '5302345678' , 5); 
INSERT INTO personel_bilgi VALUES(234567890, '5422345678', 4);
INSERT INTO personel_bilgi VALUES(345678901, '5354561245', 3);
INSERT INTO personel_bilgi VALUES(456789012,'5411452659', 3);
INSERT INTO personel_bilgi VALUES(567890123, '5551253698', 2);
INSERT INTO personel_bilgi VALUES(456789012, '5524578574', 2);
INSERT INTO personel_bilgi VALUES(123456710, '5537488585', 1);
select * from personel_bilgi;
--id’si 12345678 olan personelin Personel tablosundan sehir ve maasini
-- personel_bilgi tablosundan da tel ve cocuk sayisini yazdirin
select sehir as sehir_tel,maas as maas_cocuk from personel3 where id='123456789'
union select tel ,cocuk_sayisi from personel_bilgi where id='123456789';
--Tabloda personel maasi 4000’den cok olan tum sehirleri ve maaslari yazdirin
select sehir,maas from personel3 where maas>4000;
-- Tabloda personel maasi 5000’den az olan tum isimleri ve maaslari yazdirin
select isim,maas from personel3 where maas<5000;
--Iki sorguyu UNION ve UNION ALL ile birlestirin
select sehir as sehir_isim,maas from personel3 where maas>4000 union
select isim as sehir_isim,maas from personel3 where maas<5000;
select sehir as sehir_isim,maas from personel3 where maas>4000 union all
select isim as sehir_isim,maas from personel3 where maas<5000;
--Personel tablosundan Istanbul veya Ankara’da calisanlarin id’lerini yazdir
select id from personel3 where sehir in('Ankara','Istanbul');
--Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini yazdirin
select id from personel_bilgi where cocuk_sayisi in (2,3);
--Iki sorguyu INTERSECT ile birlestirin
select id from personel3 where sehir in('Ankara','Istanbul') intersect
select id from personel_bilgi where cocuk_sayisi in (2,3);
--Maasi 4800’den az olanlar veya 5000’den cok olanlarin id’lerini
--listeleyin
select id from personel3 where maas<4800 or maas>5000;
--Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini yazdirin
select id from personel_bilgi where cocuk_sayisi in (2,3);
--Iki sorguyu INTERSECT ile birlestirin
select id from personel3 where maas<4800 or maas>5000 intersect
select id from personel_bilgi where cocuk_sayisi in (2,3);
--5000’den az maas alip Honda’da calismayanlari yazdirin
select isim,sirket from personel3 where maas<5000 except
select isim,sirket from personel3 where sirket='Honda';
--ismi Mehmet Ozturk olup Istanbul’da calismayanlarin isimlerini ve sehirlerini listeleyin
select isim,sehir from personel3 where isim='Mehmet Ozturk' except
select isim,sehir from personel3 where sehir='Istanbul';


