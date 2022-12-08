CREATE TABLE sirketler 
(
sirket_id int, 
sirket_isim varchar(20)
);
INSERT INTO sirketler VALUES(100, 'Toyota'); 
INSERT INTO sirketler VALUES(101, 'Honda'); 
INSERT INTO sirketler VALUES(102, 'Ford'); 
INSERT INTO sirketler VALUES(103, 'Hyundai');
CREATE TABLE siparisler 
(
siparis_id int, 
sirket_id int, 
siparis_tarihi date
);
INSERT INTO siparisler VALUES(11, 101,
'17-Apr-2020');
INSERT INTO siparisler VALUES(22, 102,
'18-Apr-2020');
INSERT INTO siparisler VALUES(33, 103,
'19-Apr-2020');
INSERT INTO siparisler VALUES(44, 104,
'20-Apr-2020');
INSERT INTO siparisler VALUES(55, 105,
'21-Apr-2020');
--Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
--siparis_tarihleri ile yeni bir tablo olusturun
select sirketler.sirket_isim,siparisler.siparis_id,siparisler.siparis_tarihi from
sirketler inner join siparisler on sirketler.sirket_id=siparisler.sirket_id;
--ayni islemi left ile yapalim
SELECT sirketler.sirket_isim, siparisler. siparis_id, siparisler. siparis_tarihi 
FROM sirketler LEFT JOIN siparisler
ON sirketler.sirket_id = siparisler.sirket_id;
--ayni islemi right ile yapalim
SELECT sirketler.sirket_isim, siparisler. siparis_id, siparisler. siparis_tarihi 
FROM sirketler right JOIN siparisler
ON sirketler.sirket_id = siparisler.sirket_id;
--ayni islemi full ile yapalim
SELECT sirketler.sirket_isim, siparisler. siparis_id, siparisler. siparis_tarihi 
FROM sirketler FULL JOIN siparisler
ON sirketler.sirket_id = siparisler.sirket_id;
CREATE TABLE personel4 
(
id int,
isim varchar(20), 
title varchar(60), 
yonetici_id int
);
INSERT INTO personel4 VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO personel4 VALUES(2, 'Veli Cem', 'QA', 3);
INSERT INTO personel4 VALUES(3, 'Ayse Gul', 'QA Lead', 4); 
INSERT INTO personel4 VALUES(4, 'Fatma Can', 'CEO', 5);
select * from personel4;
--Her personelin yanina yonetici ismini yazdiran bir tablo olusturun
SELECT p1.isim AS personel_ismi, p2.isim AS yonetici_ismi
FROM personel p1 INNER JOIN personel p2
ON p1.yonetici_id = p2.id;
CREATE TABLE musteriler1 
(
id int UNIQUE,
isim varchar(50) NOT NULL,
gelir int
);
INSERT INTO musteriler1 (id, isim, gelir) VALUES (1001, 'Ali', 62000); 
INSERT INTO musteriler1 (id, isim, gelir) VALUES (1002, 'Ayse', 57500); 
INSERT INTO musteriler1 (id, isim, gelir) VALUES (1003, 'Feride', 71000);
INSERT INTO musteriler1 (id, isim, gelir) VALUES (1004, 'Fatma', 42000); 
INSERT INTO musteriler1 (id, isim, gelir) VALUES (1005, 'Kasim', 44000);
--Ismi A harfi ile baslayan musterilerin 
--tum bilgilerini yazdiran QUERY yazin
select * from musteriler1 where isim like 'A%';
-- Ismi e harfi ile biten musterilerin 
--isimlerini ve gelir’lerini yazdiran QUERY yazin
select isim,gelir from musteriler1 where isim like '%e';
--Isminin icinde er olan musterilerin 
--isimlerini ve gelir’lerini yazdiran QUERY yazin
select isim,gelir from musteriler1 where isim like '%er%';
--Ismi 5 harfli olup son 4 harfi atma olan musterilerin
 --tum bilgilerini yazdiran QUERY yazin
SELECT *
FROM musteriler1
WHERE isim LIKE '_atma';
--Ikinci harfi a olan musterilerin tum bilgilerini yazdiran QUERY yazin
SELECT *
FROM musteriler1
WHERE isim LIKE '_a%';
--Ucuncu harfi s olan musterilerin tum bilgilerini yazdiran QUERY yazin
SELECT *
FROM musteriler1
WHERE isim LIKE '__s%';
--Ucuncu harfi s olan ismi 4 harfli musterilerin tum bilgilerini yazdiran QUERY yazin
SELECT *
FROM musteriler1
WHERE isim LIKE '__s_';
-- Ilk harfi F olan en az 4 harfli musterilerin tum bilgilerini yazdiran QUERY yazin
SELECT *
FROM musteriler1
WHERE isim LIKE 'F___%';
-- Ikinci harfi a,4.harfi m olan musterilerin tum bilgilerini yazdiran QUERY yazin
SELECT *
FROM musteriler1
WHERE isim LIKE '_a_m%';
CREATE TABLE kelimeler 
(
id int UNIQUE,
kelime varchar(50) NOT NULL, 
Harf_sayisi int
);
INSERT INTO kelimeler VALUES (1001, 'hot', 3); 
INSERT INTO kelimeler VALUES (1002, 'hat', 3); 
INSERT INTO kelimeler VALUES (1003, 'hit', 3); 
INSERT INTO kelimeler VALUES (1004, 'hbt', 3); 
INSERT INTO kelimeler VALUES (1008, 'hct', 3); 
INSERT INTO kelimeler VALUES (1005, 'adem', 4); 
INSERT INTO kelimeler VALUES (1006, 'selim', 5); 
INSERT INTO kelimeler VALUES (1007, 'yusuf', 5);
-- Ilk harfi h,son harfi t olup 2.harfi a veya i olan 
--3 harfli kelimelerin tum bilgilerini yazdiran QUERY yazin
select * from kelimeler where kelime ~ 'h[ai]t';
--Ilk harfi h,son harfi t olup 2.harfi a ile k arasinda olan
--3 harfli kelimelerin tum bilgilerini  yazdiran QUERY yazin
select * from kelimeler where kelime ~ 'h[a-k]t';
-- Icinde m veya i olan kelimelerin tum bilgilerini yazdiran QUERY yazin
select * from kelimeler where kelime ~ '[mi]';
-- a veya s ile baslayan kelimelerin tum bilgilerini yazdiran QUERY yazin
select * from kelimeler where kelime ~ '^[as]';
-- m veya f ile biten kelimelerin tum bilgilerini yazdiran QUERY yazin
select * from kelimeler where kelime ~ '[mf]$';
--ilk harfi h olmayan kelimelerin tum bilgilerini yazdiran QUERY yazin
select * from kelimeler where kelime not like 'h%';
--a harfi icermeyen kelimelerin tum bilgilerini yazdiran QUERY yazin
select * from kelimeler where kelime not like '%a%';
-- ikinci ve ucuncu harfi ‘de’ olmayan kelimelerin tum bilgilerini yazdiran QUERY yazin
select * from kelimeler where kelime not like '_de%';
--2. harfi e,i veya o olmayan kelimelerin tum bilgilerini yazdiran QUERY yazin
select * from kelimeler where kelime !~'[_eio]';
--UPPER – LOWER - INITCAP
--Tablolari yazdirirken buyuk harf, kucuk harf veya ilk harfleri buyuk digerleri
--kucuk harf yazdirmak icin kullaniriz
SELECT UPPER(kelime)
FROM kelimeler;
SELECT LOWER(kelime) 
FROM kelimeler;
SELECT INITCAP(kelime)
FROM kelimeler;
--DISTINCT clause, çağrılan terimlerden tekrarlı olanların sadece birincisini alır
CREATE TABLE musteri_urun 
(
urun_id int, 
musteri_isim varchar(50),
urun_isim varchar(50) 
);
INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal'); 
INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal'); 
INSERT INTO musteri_urun VALUES (20, 'Veli', 'Elma'); 
INSERT INTO musteri_urun VALUES (30, 'Ayse', 'Armut'); 
INSERT INTO musteri_urun VALUES (20, 'Ali', 'Elma'); 
INSERT INTO musteri_urun VALUES (10, 'Adem', 'Portakal'); 
INSERT INTO musteri_urun VALUES (40, 'Veli', 'Kaysi'); 
INSERT INTO musteri_urun VALUES (20, 'Elif', 'Elma');
SELECT DISTINCT urun_isim 
FROM musteri_urun;
SELECT DISTINCT musteri_isim 
FROM musteri_urun;
--Tabloda kac farkli meyve vardir ?
select count(distinct urun_isim) as farkli_meyve_Sayisi from musteri_urun;
--Tabloyu urun_id ye gore siralayiniz
select * from musteri_urun order by urun_id;
--Sirali tablodan ilk 3 kaydi listeleyin
select * from musteri_urun order by urun_id FETCH NEXT 3 ROW ONLY ;
--Sirali tablodan 4. kayittan 7.kayida kadar olan kayitlari listeleyin
select * from musteri_urun order by urun_id OFFSET 3 ROW FETCH NEXT 4 ROW ONLY ;
CREATE TABLE personel5 
(
id int,
isim varchar(50), 
sehir varchar(50), 
maas int, 
sirket varchar(20),
CONSTRAINT personel_pk5 PRIMARY KEY (id)
);
select * from personel5
INSERT INTO personel5 VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda'); 
INSERT INTO personel5 VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota'); 
INSERT INTO personel5 VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda'); 
INSERT INTO personel5 VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford'); 
INSERT INTO personel5 VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas'); 
INSERT INTO personel5 VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford'); 
INSERT INTO personel5 VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');
-- ADD default deger ile tabloya bir field ekleme
ALTER TABLE personel5
ADD ulke_isim varchar(20) DEFAULT 'Turkiye';
-- Tabloya birden fazla field ekleme
ALTER TABLE personel5
ADD cinsiyet varchar(20) , ADD yas int;
--DROP tablodan sutun silme
ALTER TABLE personel5 
DROP COLUMN yas;
-- RENAME COLUMN sutun adi degistirme
ALTER TABLE personel5
RENAME COLUMN ulke_isim TO ulke_adi;
ALTER TABLE personel 
DROP COLUMN ulke_isim;
-- RENAME tablonun ismini degistirme
ALTER TABLE personel5 
RENAME TO isciler;
--TYPE/SET sutunlarin ozelliklerini degistirme
ALTER TABLE isciler
ALTER COLUMN ulke_adi TYPE varchar(30), 
ALTER COLUMN ulke_adi SET NOT NULL;

CREATE TABLE ogrenciler2
(
id serial,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu real 
);
BEGIN;
INSERT INTO ogrenciler2 VALUES(default, 'Ali Can', 'Hasan',75.5);
INSERT INTO ogrenciler2 VALUES(default, 'Merve Gul', 'Ayse',85.3);
savepoint x;
INSERT INTO ogrenciler2 VALUES(default, 'Kemal Yasa', 'Hasan',85.6);
INSERT INTO ogrenciler2 VALUES(default, 'Nesibe Yilmaz', 'Ayse',95.3);
savepoint y;
INSERT INTO ogrenciler2 VALUES(default, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler2 VALUES(default, 'Can Bak', 'Ali', 67.5);
ROLLBACK to y;
COMMIT;
/*
NOT :PostgreSQL de Transaction kullanımı için «Begin;» komutuyla başlarız sonrasında tekrar
yanlış bir veriyi düzelmek veya bizim için önemli olan verilerden 
sonra ekleme yapabilmek için "SAVEPOINT savepointismi" komutunu
kullanırız ve bu savepointe dönebilmek için "ROLLBACK TO savepointismi" komutunu 
kullanırız ve rollback çalıştırıldığında savepoint yazdığımız satırın üstündeki 
verileri tabloda bize verir ve son olarak Transaction'ı sonlandırmak için mutlaka 
"COMMIT" komutu kullanılır.
*/