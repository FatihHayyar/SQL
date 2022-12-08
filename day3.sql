--truncate table talebeler; dersek icerigi geri alinamayacak sekilde siler
--truncate talebeler ; de yazilabilir
--where opsiyonunu kullanamayiz hepsini siler.
CREATE TABLE talebeler
(
id CHAR(3) primary key, 
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
CREATE TABLE notlar( 
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) 
REFERENCES talebeler(id)
on delete cascade
);
-- on delete cascade sayesinde parent taki silinen bir kayıt ile ilişkili olan tüm 
--child kayıtlarını silebiliriz
-- cascade yoksa önce child temizlenir sonra parent
INSERT INTO talebeler VALUES(123, 'Ali 
Can', 'Hasan',75);
INSERT INTO talebeler VALUES(124, 
'Merve Gul', 'Ayse',85);
INSERT INTO talebeler VALUES(125, 
'Kemal Yasa', 'Hasan',85);
INSERT INTO talebeler VALUES(126, 
'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebeler VALUES(127, 
'Mustafa Bak', 'Can',99);
drop table if exists talebeler; --eger talebeler varsa sil demek
INSERT INTO notlar VALUES ('123','kimya',75);
INSERT INTO notlar VALUES ('124', 'fizik',65);
INSERT INTO notlar VALUES ('125', 'tarih',90);
INSERT INTO notlar VALUES ('126', 'Matematik',90); 
select * from talebeler;
insert into talebeler values ('128','Gulsah hayyar','Omer',80);
delete from notlar where talebe_id='123';
delete from talebeler where id='126'; --on delete cascade oldugu icin child daki alakali elemani da siler
drop table talebeler cascade; --cascade ile child silmeden tabloyu sildik
drop table notlar;

CREATE TABLE musteriler 
(
urun_id int, 
musteri_isim varchar(50), 
urun_isim varchar(50)
);
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange'); 
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange'); 
INSERT INTO musteriler VALUES (20, 'John', 'Apple'); 
INSERT INTO musteriler VALUES (30, 'Amy', 'Palm'); 
INSERT INTO musteriler VALUES (20, 'Mark', 'Apple'); 
INSERT INTO musteriler VALUES (10, 'Adem', 'Orange'); 
INSERT INTO musteriler VALUES (40, 'John', 'Apricot');
INSERT INTO musteriler VALUES (20, 'Eddie', 'Apple');
select * FROM musteriler
WHERE urun_isim ='Orange' OR urun_isim ='Apple' OR urun_isim ='Apricot';
--yada ayni classtan istiyorsak tek seferde in ile yazabiliriz
SELECT *
FROM musteriler
WHERE urun_isim IN ('Orange', 'Apple', 'Apricot');
--BETWEEN Condition iki mantiksal ifade ile tanimlayabilecegimiz durumlari tek komutla
yazabilme imkani verir. Yazdigimiz 2 sinirda araliga dahildir (INCLUSIVE)
--1) Urun_id 20 ile 40 arasinda olan urunlerin tum bilgilerini listeleyiniz
select * from musteriler where urun_id between 20 and 40;
--1) Urun_id 20 ile 40 arasinda olmayan urunlerin tum bilgilerini listeleyiniz
select * from musteriler where urun_id not between 20 and 40;
select * from calisanlar;

CREATE TABLE calisanlar2 
(
id int, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas int, 
isyeri VARCHAR(20)
);
CREATE TABLE markalar
(
marka_id int, 
marka_isim VARCHAR(20), 
calisan_sayisi int
);
INSERT INTO calisanlar2 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar2 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar2 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar2 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);
-- Çalisan sayisi 15.000’den cok olan markalarin isimlerini ve bu markada calisanlarin isimlerini ve 
--maaşlarini listeleyin.
select isim,maas,isyeri from calisanlar2 where isyeri in(select marka_isim from markalar where calisan_sayisi>15000);
-- marka_id’si 101’den büyük olan marka çalişanlarinin isim, maaş ve şehirlerini listeleyiniz.
select isim,sehir,maas from calisanlar2 where isyeri in(select marka_isim from markalar where marka_id>101);
-- Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz.
select marka_id,calisan_sayisi from markalar where marka_isim in(select isyeri from calisanlar2 where sehir='Ankara');
-- Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz.
select marka_id,marka_isim,(select count(sehir) from calisanlar2 where marka_isim=isyeri) as sehir_sayisi from markalar;
-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyiniz
select marka_isim,calisan_sayisi,(select sum(maas) from calisanlar2 where marka_isim=isyeri) as toplam_maas from markalar;
-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum ve minumum maaşini listeleyen 
--bir Sorgu yaziniz.
select marka_isim,calisan_sayisi,(select max(maas) from calisanlar2 where marka_isim=isyeri) as max_maas,(select min(maas) from calisanlar2 where marka_isim=isyeri) as min_maas from markalar;
CREATE TABLE mart
(
urun_id int,
musteri_isim varchar(50), 
urun_isim varchar(50)
);
CREATE TABLE nisan 
(
urun_id int ,
musteri_isim varchar(50), 
urun_isim varchar(50)
);
INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');

INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');

select * from mart;
--MART VE NİSAN aylarında aynı URUN_ID ile satılan ürünlerin
--URUN_ID’lerini listeleyen ve aynı zamanda bu ürünleri MART ayında alan
--MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız.
SELECT urun_id,musteri_isim FROM mart 
WHERE exists (select urun_id FROM nisan WHERE mart.urun_id=nisan.urun_id);
--Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri
--NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
SELECT urun_isim,musteri_isim FROM nisan
where exists (select urun_isim from mart where nisan.urun_isim=mart.urun_isim);
--Her iki ayda ortak satilmayan ürünlerin URUN_ISIM'lerini ve bu ürünleri
--NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
select urun_isim,musteri_isim from nisan where not exists (select urun_isim from mart where mart.urun_isim=nisan.urun_isim);
