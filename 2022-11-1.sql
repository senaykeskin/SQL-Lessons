use okulOdevi
create user deneme

grant select on alanlar to deneme 
grant update on alanlar to deneme
grant select, update, delete on alanlar to deneme
grant create table to deneme

deny select on alanlar to deneme
deny select, update, delete on alanlar to deneme

revoke select on alanlar to deneme
revoke create table to deneme

select * from personeller
select * from kimlik
select TC_Kimlik, Ad, Soyad from kimlik

select personeller.TC_Kimlik, kimlik.Soyad from kimlik, personeller

select * from kimlik where Ad= 'Senay'
select * from kimlik where Ad = 'Filiz' or Soyad= 'Yörük'
select * from kimlik where Ad = 'Filiz' and Soyad= 'Kutluk'

select * from ders_kayıt
select * from ders_kayıt where vize > 40 and D_Kod = 'YBS 113'


select * from ders_kayıt
select distinct(Ogrenci_No) from ders_kayıt

select distinct(vize) from ders_kayıt

select * from personeller
select * from dersler_personel
select distinct(Sicil_No) from dersler_personel /* seçilen sütündan farklı birer tane getirir */
/* select distinct(Sicil_No) , Kod from dersler_personel  hatalı kullanım */

select * from kimlik
select * from kimlik order by Ad /* özel sıralama */
select * from kimlik order by Soyad 
select * from kimlik order by Ad asc /* sıralamaya baştan başlar (default bu zaten) */
select * from kimlik order by Ad  desc /* sıralamaya sondan başlar */
select * from kimlik order by Ad, Soyad /* aynı addan 2 tane varsa ikinci kısıta bak*/
select * from kimlik order by Ad asc, Soyad desc /* ters sıralama */

select distinct(vize) from ders_kayıt where Ogrenci_No = '20214703003' order by Vize desc /**Şenay'ın vizede almış olduğu 
notların büyükten küçüğe sıralanmmış hali */ /* sınav sorusu*/

select * from kimlik
select Ad+Soyad from kimlik
select Ad+' '+Soyad as [Adı ve Soyadı] from kimlik

select TC_Kimlik as [TC KİMLİK] from kimlik

select * from ders_kayıt
select * from ders_kayıt where vize <> 60 /* 60 olmayanlar */
select * from ders_kayıt where not Vize > 90

select * from kimlik
select * from kimlik where D_Tarih > '10.10.2000'
select * from kimlik where D_Tarih > '10.10.2000' order by D_Tarih desc

