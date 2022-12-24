use universite

/* 410 nolu bölüme kayıtlı öğrencilerin kimlik bilgilerini giriniz */

select k.* from kimlik k, ogrenci_kayit ok
where k.TC_Kimlik = ok.TC_Kimlik 
and ok.B_No = '430'


select * from kimlik where TC_Kimlik = '12358894088'
select * from kimlik where TC_Kimlik in ('12358894088', '10019901236', '10405772174')

select TC_Kimlik from ogrenci_kayit where B_No= '430'

select * from kimlik where TC_Kimlik in (select TC_Kimlik from ogrenci_kayit where b_No = '430')

/* sicil nosu 100 olan personelin kimlik bilgilerini listeleyiniz */ /* tek tablodan olduğu için in select kullanmak gerekir */

select * from kimlik where TC_Kimlik in (select TC_Kimlik from personeller where Sicil_No = '100')

/* ybs 114 dersini alan öğrencilerin kimlik bilgilerini listeleyiniz */

select * from kimlik where TC_Kimlik in (select TC_Kimlik from ogrenci_kayit where Ogr_No
in (select Ogr_No from ders_kayit where D_Kod = 'YBS 114'))

/* ybs 114 dersini alanlardan 430 nolu bölümde okuyanların kimlik bilgileri */

select * from kimlik where TC_Kimlik 
in (select TC_Kimlik from ogrenci_kayit where b_no = '430' and Ogr_No
in (select Ogr_No from ders_kayit where D_Kod = 'YBS 114' ))

/* yönetim bilişim sistemleri bölümündeki derslere kayıt olan öğrencileri listesi */

select * from ogrenci_kayit where B_No 
in (select B_No from bolumler where B_Ad = 'Yönetim Bilişim Sistemleri') and Ogr_No 
in (select Ogr_No from ders_kayit)

/* yönetim bilişim sistemleri bölümünden veri tabanına giriş dersine kayıt olan öğrencilerin kimlik bilgilerini veren sorgu */

select * from kimlik where TC_Kimlik 
in (select TC_Kimlik from ogrenci_kayit where Ogr_No 
in (select Ogr_No from ders_kayit where D_Kod in (select D_Kod from dersler where D_Ad = 'Veritabanina Giriş')) 
and B_No in(select B_No from bolumler where B_Ad = 'Yönetim Bilişim Sistemleri'))


/* prof unvanlı personellerin grimiş oldukları derslerin listesini veren sorgu */

select * from dersler where D_Kod 
in (select D_Kod from dersler_personel where Sicil_No in (select Sicil_No from personeller where U_No 
in (select U_No from unvanlar where Unvan='Profesör Doktor')))

/* doçent unvanlı personellerin girmiş oldukları dersleri alan öğrencilerin kimlik bilgilerini veren sorgu */

select * from kimlik where TC_Kimlik 
in (select TC_Kimlik from ogrenci_kayit where Ogr_No 
in (select Ogr_No from ders_kayit where D_Kod
in (select D_Kod from dersler where D_Kod
in (select D_Kod from dersler_personel where Sicil_No 
in (select Sicil_No from personeller where U_No 
in (select U_No from unvanlar where Unvan='Doçent Doktor'))))))


/* lisans bölümünde derse giren personellerden alanı bilgisayar olanların kimlik bilgilerini listeleyen sorguyu yazınız */

select * from kimlik where TC_Kimlik
in (select TC_Kimlik from personeller where A_No
in (select A_No from alanlar where Alan = 'Bilgisayar Bilimleri') and Sicil_No 
in (select Sicil_No from dersler_personel) and B_No 
in (select B_No from bolumler where Tur_No 
in (select Tur_No from ogrenim_tur where Tur = 'Lisans')))

