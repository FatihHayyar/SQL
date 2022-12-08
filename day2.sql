insert into short_info values ('Betul','2016-06-29');
create table short_info as select student_name,datum from students;
select * from short_info
create table schuler(
schuler_name varchar(20)not null, --bos gecilemez
	nummer char(7) unique, --iki kere yazilamaz artik
	notes real,
	datum date

);
insert into schuler values ('ummu gulsum','1114',95.6,'2014-12-16');
select * from schuler;
select * from students;
insert into schuler values ('osman furkan','1113',85.6,'2012-09-14');
insert into schuler (nummer,notes,datum) values ('1115',90.4,'2016-06-29');
create table myfamily(
schuler_name varchar(20)not null, --bos gecilemez
	nummer char(7) primary key, --iki kere yazilamaz artik
	notes real,
	geburts_datum date

);--primary key icin 2. yol (constraint ismini kendimiz verebiliriz)
create table myfamily1(
schuler_name varchar(20)not null, --bos gecilemez
	nummer char(7), --iki kere yazilamaz artik
	notes real,
	geburts_datum date,
constraint schlr primary key (nummer)
);
“tedarikciler3” isimli bir tablo olusturun. Tabloda “tedarikci_id”, “tedarikci_ismi”, “iletisim_isim” field’lari olsun ve “tedarikci_id” yi Primary Key yapin.
“urunler” isminde baska bir tablo olusturun “tedarikci_id” ve “urun_id” field’lari olsun ve
“tedarikci_id” yi Foreign Key yapin.
create table urunler(
tedarikci_id char(4),
	urun_id varchar(20),
foreign key (tedarikci_id) references tedarikci(tedarikci_id)
);
create table tedarikci(
tedarikci_id char(4) primary key,
	tedarikci_ismi varchar(20),
	iletisim_ismi varchar(20)
);
“calisanlar” isimli bir Tablo olusturun. Icinde “id”, 
“isim”, “maas”, “ise_baslama” field’lari olsun. “id” yi Primary Key yapin
“isim” i Unique, “maas” i Not Null yapın.
“adresler” isminde baska bir tablo olusturun.Icinde
“adres_id”, “sokak”, “cadde” ve “sehir” fieldlari olsun.
“adres_id” field‘i ile Foreign Key oluşturun.
create table calisanlar(
	id char(20) primary key,
isim varchar(20) unique,
	maas int not null,
	ise_baslama date
); 
create table adresler(
	adres_id char(20),
sokak varchar(20),
	cadde varchar(20),
	sehir varchar(20),
	foreign key (adres_id) references calisanlar (id)
); 
INSERT INTO calisanlar VALUES('1002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('1008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('1010', 'Mehmet Yılmaz', 5000, '2018-04-14');--cift isim hatasi
INSERT INTO calisanlar VALUES('1004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('1005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('1006', 'Canan Yaş', NULL, '2019-04-12');--null hatasi
INSERT INTO calisanlar VALUES('1003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('1007', 'CAN', 5000, '2018-04-14');--cift isim
INSERT INTO calisanlar VALUES('1009', 'cem', '', '2018-04-14'); --bosluk syntex hatasi
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14'); --key tekrar hatasi
INSERT INTO calisanlar VALUES( '1002', 'ayse Yılmaz' ,12000, '2018-04-14'); --key tekrar hatasi
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14'); --key null olmaz hatasi

INSERT INTO adresler VALUES('1003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('1003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('1002','Ağa Sok', '30.Cad.','Antep');
-- Parent tabloda olmayan id ile child a ekleme yapamayiz
INSERT INTO adresler VALUES('1012','Ağa Sok', '30.Cad.','Antep');
-- FK'ye null değeri atanabilir.
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Maraş');
select * from calisanlar;
select *from adresler;
create table calisanlar1(
	id char(20) ,
isim varchar(20) ,
	maas int check (maas>10000),--altini eklemez
	ise_baslama date
);
INSERT INTO calisanlar1 VALUES('1002', 'Mehmet Yılmaz' ,19000, '2018-04-14');
select isim,maas from calisanlar where maas<10000; //maaasi 10k dan az olanlari listeleme
--ismi velihan olani bulalim
select * from calisanlar where isim='Veli Han';
CREATE TABLE ogrenciler6
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int 
);
INSERT INTO ogrenciler6 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler6 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler6 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler6 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler6 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler6 VALUES(127, 'Mustafa Bak', 'Ali', 99);
-- id'si 124 olan ogrenciyi siliniz.
-- ismi Kemal Yasa olan satırını siliniz.
delete from ogrenciler6 where id=124;
delete from ogrenciler6 where isim='Kemal Yasa';
select * from ogrenciler6;
--parent direkt silinemez once child i silmek gerekir
--“DELETE FROM ogrenciler” -tablodaki tum datalari siler, fakat tabloyu
--silmez. 
--“DELETE FROM ogrenciler”, kodunu kullaninca bos bir tablo kalirz

