CREATE TABLE meslekler
(
id int PRIMARY KEY,
isim VARCHAR(50),
soyisim VARCHAR(50),
meslek CHAR(9),
maas int
);
INSERT INTO meslekler VALUES(1, 'Ali', 'Can', 'Doktor', '20000' );
INSERT INTO meslekler VALUES(2, 'Veli', 'Cem', 'Mühendis', '18000');
INSERT INTO meslekler VALUES(3, 'Mine', 'Bulut', 'Avukat', '17000');
INSERT INTO meslekler VALUES(4, 'Mahmut', 'Bulut', 'Ögretmen', '15000');
INSERT INTO meslekler VALUES (5, 'Mine', 'Yasa', 'Teknisyen', '13000');
INSERT INTO meslekler VALUES (6, 'Veli', 'Yilmaz', 'Hemşire', '12000');
INSERT INTO meslekler VALUES(7, 'Ali', 'Can', 'Marangoz', '10000' );
INSERT INTO meslekler VALUES(8, 'Veli', 'Cem', 'Tekniker', '14000');
select * from meslekler;
-- SORU1: meslekler tablosunu isim'e göre sıralayarak sorgulayınız.
select * from meslekler order by isim;
-- SORU2: meslekler tablosunda maas'i buyukten kucuge siralayiniz
select * from meslekler order by maas desc;
-- SORU3: meslekler tablosunda isim'i 'Ali' olanları,
-- maas'a göre büyükten küçüge sıralayarak sorgulayınız
select * from meslekler where isim='Ali' order by maas desc;
-- SORU4: meslekler tablosunda soyisim 'i 'Bulut' olanları,
-- maas sıralı olarak sorgulayınız.
select * from meslekler where soyisim='Bulut' order by maas;
-- SORU5: meslekler tablosunda id degeri 5 den büyük olan,
-- ilk 2 veriyi listeleyiniz
select * from meslekler where id>5 limit 2;
-- SORU6: meslekler tablosunda maası en yüksek 3 kişinin bilgilerini listeleyiniz
select * from meslekler order by maas desc limit 3;
-- SORU7: meslekler tablosunda ilk 2 veriden sonra 5 veriyi getirin
select * from meslekler offset 2 limit 5;
-- SORU8: meslekler tablosunda en yüksek maaşı
--alan 4. 5. 6. kişilerin bilgilerini listele
select * from meslekler order by maas desc offset 3 limit 3;
create table filmler
(film_id int,
film_name varchar(30),
category varchar(30)
);
insert into filmler values (1, 'Eyvah Eyvah', 'Komedi');
insert into filmler values (2, 'Kurtlar Vadisi', 'Aksiyon');
insert into filmler values (3, 'Eltilerin Savasi', 'Komedi');
insert into filmler values (4, 'Aile Arasinda', 'Komedi');
insert into filmler values (5, 'GORA', 'Bilim Kurgu');
insert into filmler values (6, 'Organize Isler', 'Komedi');
insert into filmler values (7, 'Babam ve Oglum', 'Dram');
create table aktorler
(id int,
actor_name varchar(30),
film_id int
);
insert into aktorler values (1, 'Ata Demirer', 1);
insert into aktorler values (2, 'Necati Sasmaz', 2);
insert into aktorler values (3, 'Gupse Ozay', 3);
insert into aktorler values (4, 'Engin Gunaydin', 4);
insert into aktorler values (5, 'Cem Yilmaz', 5);

-- SORU1: Tüm film_name'leri, category'lerini ve
--filimlerde oynayan actor_name'leri listeleyiniz.
select filmler.film_name,filmler.category,aktorler.actor_name from filmler full join aktorler
on filmler.film_id=aktorler.film_id;
-- SORU2: Tüm actor_name'leri ve film_name'lerini listeleyiniz.
select filmler.film_name,aktorler.actor_name from filmler full join
aktorler on filmler.film_id=aktorler.film_id;
create table qa_dersler
(
ders_id int,
ders_ismi varchar(30),
ders_saati varchar(30)
);
insert into qa_dersler values (101, 'Core Java', 40);
insert into qa_dersler values (102, 'Selenium', 30);
insert into qa_dersler values (103, 'API', 15);
insert into qa_dersler values (104, 'SQL', 10);
insert into qa_dersler values (105, 'SDLC', 10);
insert into qa_dersler values (106, 'LAMDA', 12);
create table developer_dersler
(
ders_id int,
ders_ismi varchar(30),
ders_saati varchar(30)
);
insert into developer_dersler values (101, 'Core Java', 40);
insert into developer_dersler values (103, 'API', 15);
insert into developer_dersler values (104, 'SQL', 10);
insert into developer_dersler values (105, 'SDLC', 10);
insert into developer_dersler values (106, 'LAMDA', 12);
insert into developer_dersler values (107, 'Spring Framework', 20);
insert into developer_dersler values (108, 'Micro Services', 12);
--SORU4: join kullanarak qa_dersleri ve developer_dersleri benzersiz sorgula
select qa_dersler.ders_ismi,developer_dersler.ders_ismi from qa_dersler
full join developer_dersler on qa_dersler.ders_id=developer_dersler.ders_id;

select A.ders_id, A.ders_ismi,A.ders_saati from qa_dersler as A
left join developer_dersler as B
on A.ders_ismi=B.ders_ismi
union
select B.ders_id, B.ders_ismi,B.ders_saati from qa_dersler as A
right join developer_dersler as B
on A.ders_ismi=B.ders_ismi;