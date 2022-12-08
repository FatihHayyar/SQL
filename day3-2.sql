CREATE TABLE tedarikciler -- parent
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);
INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Çin Li');
INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammen');
INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');
select * from tedarikciler;
CREATE TABLE urunler -- child
(
ted_vergino int, 
urun_id int, 
urun_isim VARCHAR(50), 
musteri_isim VARCHAR(50),
CONSTRAINT fk_urunler FOREIGN KEY(ted_vergino) 
REFERENCES tedarikciler(vergi_no)
on delete cascade
); 
INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ayşe Can');
INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan Öz');
INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Yılmaz');
select * from urunler;
-- vergi_no’su 102 olan tedarikcinin firma ismini 'Vestel' olarak güncelleyeniz
update tedarikciler set firma_ismi='Vestel' where vergi_no=102;
-- vergi_no’su 101 olan tedarikçinin firma ismini 'casper' ve
--irtibat_ismi’ni 'Ali Veli' olarak güncelleyiniz.
update tedarikciler set firma_ismi='Casper',irtibat_ismi='Ali Veli' where vergi_no=101;
select * from tedarikciler;
-- urunler tablosundaki 'Phone' değerlerini 'Telefon' olarak güncelleyiniz.
update urunler set urun_isim='Telefon' where urun_isim='Phone';
-- urunler tablosundaki urun_id değeri 1004'ten büyük olanların urun_id’sini 1 arttırın.
update urunler set urun_id=urun_id+1 where urun_id>1004;
-- urunler tablosundaki tüm ürünlerin urun_id değerini ted_vergino sutun değerleri ile toplayarak 
--güncelleyiniz.
update urunler set urun_id=urun_id+ted_vergino;
select * from urunler;
-- urunler tablosundan Ali Bak’in aldigi urunun ismini, tedarikci tablosunda irtibat_ismi 
--'Adam Eve' olan firmanın ismi (firma_ismi) ile degistiriniz.
update urunler set urun_isim=(select firma_ismi from tedarikciler where irtibat_ismi='Adam Eve') where musteri_isim='Ali Bak';
--Urunler tablosunda laptop satin alan musterilerin ismini,
--firma_ismi Apple’in irtibat_isim'i ile degistirin.
update  urunler set musteri_isim=(select irtibat_ismi from tedarikciler where firma_ismi='Apple') where urun_isim='Laptop';
create view apple --metot gibi view olusturup sonradan cagirabiliriz
as select musteri_isim from urunler;
select * from apple;

create table personel_list
(
	id char(9),
	isim varchar(20),
	soyisim varchar(20),
	email varchar(20),
	ise_baslama_tarihi date,
	is_unvani varchar(20),
	maas real
);
insert into personel_list values(123456789,'Ali','Can','alican@gmail.com','10-Apr-10','Isci',5000);
insert into personel_list values(123456788,'Veli','Cem','velicem@gmail.com','10-Jan-10','Isci',5500);
insert into personel_list values(123456787,'Ayse','Gul','aysegul@gmail.com','01-May-1a','Muhasebeci',4500);
insert into personel_list values(123456789,'Fatma','Yasa','fatmayasa@gmail.com','10-Apr-09','Muhasebeci',7500);
select * from personel_list;
update personel_list set is_unvani='Muhendis' where isim='Fatma';
--Tablodan maasi 5000’den az veya unvani isci olanlarin isimlerini listeleyin
select isim,soyisim from personel_list where maas<5000 or is_unvani='isci';
--iscilerin tum bilgilerini listeleyin
select * from personel_list where is_unvani='Isci';
--Soyadi Can,Cem veya Gul olanlarin unvanlarini ve maaslarini listeleyin
select is_unvani,maas from personel_list where soyisim in('Can','Cem','Gul');
--Maasi 5000’den cok olanlarin emailve is baslama tarihlerini listeleyin
select email,ise_baslama_tarihi from personel_list where maas>5000;
-- Maasi 5000’den cok ve 7000’den az olanlarin tum bilgilerini listeleyin
select * from personel_list where maas>5000 and maas<7000;
select isim||soyisim as ad_soyad,is_unvani as meslek, maas from personel_list;


