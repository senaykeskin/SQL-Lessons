use universite

select * from ders_kayit
select vize, final, uygulama from ders_kayit
select min(vize), max(final), avg(uygulama), sum(final) from ders_kayit where D_Kod = 'YBS 113' /* örneğin avg olmasaydı çalışmazdı, diğerleri tek ifade o hepsini getirir*/
select d_Kod, min(vize), max(final), avg(uygulama), sum(final), count(vize) from ders_kayit group by D_Kod


select d_kod, avg(vize*0.4 + final*0.5 + uygulama*0.1) as [ders ortalama] from ders_kayit 
group by d_kod order by [ders ortalama] desc /* derslerin ortalaması */ /* sınav sorusu */


select d_kod, sum(vize*0.4 + uygulama*0.1 + final*0.5) as ortalama, sum(vize*0.4 + uygulama*0.1 + final*0.5)/ count(D_Kod) as tumOrtalama
from ders_kayit group by D_Kod order by ortalama desc 

select count(yariyil) from dersler /* bunu gruplandır */
select yariyil, count(yariyil) as dersSayisi from dersler group by yariyil /* hangi yarıyılda kaç ders var */

select * from dersler_personel where Sicil_No ='120'
select sicil_no, count(d_kod) as [ders Sayisi] from dersler_personel 
group by Sicil_No having count(D_Kod)>3 order by [ders Sayisi] desc /* hangi personel kaç derse */

select d_kod, avg(vize*0.4 + final*0.5 + uygulama*0.1) as [ders ortalama] from ders_kayit where (vize*0.4 + final*0.5 + uygulama*0.1) is not null
group by d_kod having avg(vize*0.4 + final*0.5 + uygulama*0.1)>65 order by [ders ortalama] desc /* sınav sorusu */


select sum(AKTS) from dersler 
select yariyil, sum(AKTS) from dersler group by Yariyil having sum(akts) > 30 /* akts toplamı 30 dan büyük olanlar yarıyıllarına göre hesaplandı */

select * from personeller
select U_No, count(U_No) from personeller group by U_No /* hangi unvandan kaç tane */

select * from kimlik
select * from dersler
select * from ogrenci_kayit

/* öğrencinin adı, soyadı, bölüm nosu, gno'sunu listeleyen sorguyu yazınız */
select kimlik.ad, kimlik.soyad, ogrenci_kayit.B_No, ogrenci_kayit.GNO from kimlik, ogrenci_kayit where kimlik.TC_Kimlik = ogrenci_kayit.TC_Kimlik

/* birkaç tablo birleştirme */
select fakulteler.F_Ad, bolumler.B_Ad from fakulteler, bolumler where fakulteler.F_No = bolumler.F_No /* 1. adım */

select fakulteler.F_Ad, bolumler.B_Ad, ogrenim_tur.Tur from fakulteler, bolumler, ogrenim_tur /* 2. adım */
where fakulteler.F_No = bolumler.F_No and bolumler.Tur_No = ogrenim_tur.Tur_No 

select fakulteler.F_Ad, bolumler.B_Ad, ogrenim_tur.Tur, kimlik.Ad, kimlik.Soyad
from fakulteler, bolumler, ogrenim_tur, kimlik, personeller
where fakulteler.F_No = bolumler.F_No 
and bolumler.Tur_No = ogrenim_tur.Tur_No 
and bolumler.BB_Sicil_No = personeller.Sicil_No 
and personeller.TC_Kimlik = kimlik.TC_Kimlik /* 3. adım */ /* sicil noları null diye çalışmadı */

select f.F_Ad, b.B_Ad, ot.Tur, k.Ad, k.Soyad 
from fakulteler f, bolumler b, ogrenim_tur ot, kimlik k, personeller p
where f.F_No = b.F_No 
and b.Tur_No = ot.Tur_No 
and b.BB_Sicil_No = p.Sicil_No 
and p.TC_Kimlik = k.TC_Kimlik /* kısaltma yaptık*/



/*personellerin listesi unvan ad soyad bolum alan */
select unvanlar.Unvan, kimlik.Ad, kimlik.Soyad, bolumler.B_Ad, alanlar.Alan
from unvanlar, kimlik, bolumler, alanlar, personeller
where  personeller.TC_Kimlik = kimlik.TC_Kimlik 
and personeller.A_No = alanlar.A_No
and unvanlar.U_No = personeller.U_No 
and bolumler.B_No = personeller.B_No
order by kimlik.Ad, kimlik.Soyad


/* ogrenci ad, soyad, dersin adı, ortalaması */
select ok.Ogr_No, k.ad, k.Soyad, d.D_Kod, d.D_Ad, dk.vize*0.4 + dk.Final*0.5 + dk.Uygulama*0.1 as ortalama
from kimlik k, dersler d, ders_kayit dk, ogrenci_kayit ok
where dk.D_Kod = d.D_Kod 
and dk.Ogr_No = ok.Ogr_No 
and ok.TC_Kimlik = k.TC_Kimlik 

/* oğrencinin nosu adı soyadı, ortalaması */
/* derslerin ortalamalarını derslerin adıyla beraber liste haliyle */