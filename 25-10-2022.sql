use okul

select Sicil_No, A_No from personeller
select D_Kod, D_Ad, AKTS from dersler
select * from ogrenci_kayıt
select * from ogrenci_kayıt, dersler
select * from kimlik where Ad= 'Şenay'

select * from kimlik where Ad= 'İrem' or Soyad= 'Oktay' 
select * from ogrenci_kayıt where GNO >= 3
select * from ogrenci_kayıt where GNO = 3
select * from ogrenci_kayıt where GNO < 3


select * from fakulteler
select * from bolumler 

insert into ogrenim_tur values('11', 'Lisans')
select * from ogrenim_tur
insert into ogrenim_tur values('10', 'Ön Lisans')
insert into bolumler values('3', 'YBS', '1', null, '1')
select * from bolumler 
insert into alanlar values(3, 'PC')
select * from alanlar
insert into unvanlar values(11, 'sdfghjk')
select * from unvanlar
insert into kimlik values('87456874533', 'sdfgkjd', 'xcvbhrf', null, null, null, null, null, null, null)
insert into kimlik (TC_Kimlik, Ad, Soyad) values('12300077799', 'vveeelliii', 'yyaazzaarr')
select * from kimlik



select * from personeller
insert into personeller values('2345678', '10000999887', '1', '1', '3')

select * from ogrenim_tur
insert into ogrenim_tur values('12', 'fghcvb')


select * from ders_kayıt
/*  update ders_kayıt set Vize= 50      hepsi 50 olur böyle*/
update ders_kayıt set Vize= 50 where Ogrenci_No = '20214703003' and D_Kod = 'YBS 113'  /* bu kısıt lazım*/

select * from kimlik 
update kimlik set D_Tarih = '1999/12/12' where TC_Kimlik = '11111111111'

/* delete from bolumler where B_No = '3'  silmek için*/ 
/*----bağlantısı yapılırken on delete cascade yazdıysan bağlantılılar silinir yoksa hata verir bağlantısı olduğu için-----*/
