CREATE TABLE insanlar
(
ssn char(9),
isim varchar(50),
soyisim varchar(50), adres
varchar(50)
);
INSERT INTO insanlar VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar VALUES(234567890, 'Veli','Cem', 'Ankara'); 
INSERT INTO insanlar VALUES(345678901, 'Mine','Bulut', 'Ankara'); 
INSERT INTO insanlar VALUES(256789012, 'Mahmut','Bulut', 'Istanbul'); 
INSERT INTO insanlar VALUES (344678901, 'Mine','Yasa', 'Ankara'); 
INSERT INTO insanlar VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');
--Insanlar tablosundaki datalari adres’e gore siralayin
select * from insanlar order by adres;
--Insanlar tablosundaki ismi Mine olanlari SSN sirali olarak listeleyin
select * from insanlar where isim='Mine' order by ssn;
--Insanlar tablosundaki soyismi Bulut olanlari isim sirali olarak listeleyin
select * from insanlar where soyisim='Bulut' order by isim;
select * from insanlar where soyisim='Bulut' order by 2; -- sirasini yazsamda olur
--nsanlar tablosundaki tum kayitlari SSN numarasi buyukten kucuge olarak siralayin
select * from insanlar order by ssn desc; --tersten siralar
-- insanlar tablosundaki tum kayitlari isimler Natural sirali, Soyisimler ters sirali olarak listeleyin
select * from insanlar order by isim asc, soyisim desc;
--İsim ve soyisim değerlerini soyisim kelime uzunluklarına göre sıralayınız
select isim,soyisim from insanlar order by length(soyisim);
--Tüm isim ve soyisim değerlerini aynı sutunda çağırarak 
--her bir sütun değerini uzunluğuna göre sıralayınız
select isim||' '||soyisim as isim_soyisim from insanlar order by length(isim)+length(soyisim);

CREATE TABLE manav
(
isim varchar(50), 
Urun_adi varchar(50), 
Urun_miktar int
);
INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2); 
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4); 
INSERT INTO manav VALUES( 'Ali', 'Armut', 2); 
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3); 
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5); 
INSERT INTO manav VALUES( 'Ali', 'Armut', 2); 
INSERT INTO manav VALUES( 'Veli', 'Elma', 3); 
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);
--isme gore alinan toplam urunleri bulun
select isim , sum(Urun_miktar) as Toplam_miktar from manav group by isim;
select * from manav;
--Urun ismine gore urunu alan toplam kisi sayisi
select urun_adi, count(isim) as toplam_kisi from manav group by urun_adi;
--Alinan kilo miktarina gore musteri sayisi
select urun_miktar, count(isim) as musteri_sayisi from manav group by urun_miktar;

CREATE TABLE personel1 
(
id int,
isim varchar(50), 
sehir varchar(50), 
maas int, 
sirket varchar(20)
);
INSERT INTO personel1 VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda'); 
INSERT INTO personel1 VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota'); 
INSERT INTO personel1 VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda'); 
INSERT INTO personel1 VALUES(456789012, 'Mehmet Ozturk','Izmir', 6000, 'Ford'); 
INSERT INTO personel1 VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas'); 
INSERT INTO personel1 VALUES(456789012, 'Veli Sahin', 'Ankara', 4500, 'Ford'); 
INSERT INTO personel1 VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');
-- Isme gore toplam maaslari bulun
select isim,sum(maas) as toplam_maas from personel1 group by isim;
-- sehre gore toplam personel sayisini bulun
select sehir, count(isim) as top_personel from personel1 group by sehir;
-- Sirketlere gore maasi 5000 liradan fazla olan personel sayisini bulun
select sirket, count(isim) as pers_sayi from personel1 where maas>5000 group by sirket;
-- Her sirket icin Min ve Max maasi bulun
select sirket,max(maas) as max_maas,min(maas) as min_maas from personel1 group by sirket;


