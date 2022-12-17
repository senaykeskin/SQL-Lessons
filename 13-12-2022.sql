use universite

select ad, Soyad from kimlik
select Sicil_No from personeller



select kimlik.ad, kimlik.soyad, personeller.Sicil_No from kimlik, personeller
where kimlik.TC_Kimlik = personeller.TC_Kimlik
/* bu ikisi aynı (alttaki ve üstteki kod) */
select kimlik.ad, kimlik.soyad, personeller.Sicil_No from kimlik join personeller /* inner join de yazılabilir */
on kimlik.TC_Kimlik = personeller.TC_Kimlik

select kimlik.ad, kimlik.soyad, personeller.Sicil_No from kimlik left outer join personeller 
on kimlik.TC_Kimlik = personeller.TC_Kimlik /* sol taraf yani kimlik'teki tüm tc'leri getirdi*/

select kimlik.ad, kimlik.soyad, personeller.Sicil_No from kimlik right outer join personeller 
on kimlik.TC_Kimlik = personeller.TC_Kimlik /* sağ taraf yani personel'deki tüm sicil'leri getirdi*/

select kimlik.ad, kimlik.soyad, personeller.Sicil_No from kimlik full outer join personeller 
on kimlik.TC_Kimlik = personeller.TC_Kimlik /* her iki tarafın hepsini getirdi */



select fakulteler.F_Ad, bolumler.B_Ad, ogrenim_tur.Tur
from fakulteler, bolumler, ogrenim_tur
where bolumler.F_No = fakulteler.F_No
and bolumler.Tur_No = ogrenim_tur.Tur_No
/* bu ikisi aynı */
select fakulteler.F_Ad, bolumler.B_Ad, ogrenim_tur.Tur
from fakulteler join bolumler on bolumler.F_No = fakulteler.F_No
join ogrenim_tur on bolumler.Tur_No = ogrenim_tur.Tur_No



select fakulteler.F_Ad, bolumler.B_Ad, ogrenim_tur.Tur, kimlik.Ad, kimlik.Soyad
from fakulteler, bolumler, ogrenim_tur, kimlik, personeller
where bolumler.F_No = fakulteler.F_No
and bolumler.Tur_No = ogrenim_tur.Tur_No
and bolumler.BB_Sicil_No = personeller.Sicil_No
and personeller.TC_Kimlik = kimlik.TC_Kimlik
/* bu ikisi aynı kod */
select fakulteler.F_Ad, bolumler.B_Ad, ogrenim_tur.Tur, kimlik.Ad, kimlik.Soyad
from fakulteler join bolumler on bolumler.F_No = fakulteler.F_No
join ogrenim_tur on bolumler.Tur_No = ogrenim_tur.Tur_No
join personeller on bolumler.BB_Sicil_No = personeller.Sicil_No
join kimlik on personeller.TC_Kimlik = kimlik.TC_Kimlik


select p.sicil_no, u.Unvan, k.Ad, k.Soyad
from personeller p, dersler_personel dp, kimlik k, unvanlar u
where k.TC_Kimlik = p.TC_Kimlik 
and dp.Sicil_No = p.Sicil_No
and  p.U_No = u.U_No
and dp.D_Kod = 'YBS 114'
/* bu ikisi aynı */
/* bu soru sınav sorusu */
select p.sicil_no, u.Unvan, k.Ad, k.Soyad
from personeller p join unvanlar u on p.U_No = u.U_No
join kimlik k on k.TC_Kimlik = p.TC_Kimlik
join dersler_personel dp on dp.Sicil_No = p.Sicil_No 
where dp.D_Kod = 'YBS 114'


/* matematik dersi alan öğrencilerin ortalaması 70 üstü olanlarının
no, ad, soyad, ort bilgilerini listeleyen sorguyu join kullanarak yazınız */

select ok.Ogr_No, k.ad, k.Soyad, (dk.Vize*0.4 + dk.Final*0.5 + Uygulama*0.1) as Ort
from dersler d join ders_kayit dk on d.D_Kod = dk.D_Kod
join ogrenci_kayit ok on dk.Ogr_No = ok.Ogr_No
join kimlik k on ok.TC_Kimlik = k.TC_Kimlik 
where d.D_Ad = 'Matematik'
and dk.Vize*0.4 + dk.Final*0.5 + Uygulama*0.1 > 70
order by Ort desc


/*alanı bilgisayar bilimleri olan ve doçent ünvanına sahip personllerin girmiş olduğu 
derslerin listesini veren sorgu */

select a.A_No,u.Unvan,d.D_Ad,dp.D_Kod,k.Ad,k.Soyad
from alanlar a ,dersler d,unvanlar u ,dersler_personel dp,personeller p,kimlik k
where dp.D_Kod=d.D_Kod
and p.A_No=a.A_No 
and p.U_No=u.U_No 
and dp.Sicil_No=p.Sicil_No 
and p.TC_Kimlik=k.TC_Kimlik
and a.Alan='Bilgisayar Bilimleri'
and u.Unvan='Doçent Doktor'
/* bu ikisi aynı */
select  d.* /*a.A_No,u.Unvan,d.D_Ad,dp.D_Kod */
from dersler d join dersler_personel dp on d.D_Kod = dp.D_Kod
join personeller p on dp.Sicil_No = p.Sicil_No
join unvanlar u on u.U_No = p.U_No
join alanlar a on p.A_No = a.A_No
where a.Alan = 'Bilgisayar Bilimleri' 
and u.Unvan = 'Doçent Doktor'



/*alanı bilgisayar bilimleri olan profesör doktor ünvanına sahip personllerin girmiş olduğu 
derslerin listesini ve personel bilgilerini veren sorgu join ile */
select a.A_No,u.Unvan,d.D_Ad,dp.D_Kod,k.Ad,k.Soyad
from alanlar a ,dersler d,unvanlar u ,dersler_personel dp,personeller p,kimlik k
where dp.D_Kod=d.D_Kod
and p.A_No=a.A_No 
and p.U_No=u.U_No 
and dp.Sicil_No=p.Sicil_No 
and p.TC_Kimlik=k.TC_Kimlik
and a.Alan='Bilgisayar Bilimleri' 
and u.Unvan='Profesör Doktor'
/* bu ikisi aynı */
select dp.D_Kod, d.D_Ad, a.A_No,u.Unvan, k.Ad,k.Soyad
from dersler d join dersler_personel dp on d.D_Kod = dp.D_Kod
join personeller p on dp.Sicil_No = p.Sicil_No
join kimlik k on p.TC_Kimlik = k.TC_Kimlik
join unvanlar u on u.U_No = p.U_No
join alanlar a on p.A_No = a.A_No
where a.Alan = 'Bilgisayar Bilimleri' 
and u.Unvan = 'Profesör Doktor'


/* GNO ortalaması 3 üzerinde olan öğrencilerin ve aldıkları derslerin akts toplamlarını veren sorgu join ile */

select d.AKTS,k.Ad,k.Soyad,ok.Ogr_No,d.D_Ad
from dersler d ,ogrenci_kayit ok,kimlik k ,ders_kayit dk
where ok.Ogr_No=dk.Ogr_No
and k.TC_Kimlik=ok.TC_Kimlik 
and dk.D_Kod=d.D_Kod
and ok.GNO>3 
/* bu ikisi aynı */
select ok.Ogr_No, k.Ad, k.Soyad, ok.GNO, sum(d.AKTS) as AKTS
from dersler d join ders_kayit dk on dk.D_Kod=d.D_Kod
join ogrenci_kayit ok  on ok.Ogr_No = dk.Ogr_No
join kimlik k on k.TC_Kimlik = ok.TC_Kimlik
where ok.GNO > 3
group by ok.Ogr_No, k.Ad, k.Soyad, ok.GNO
order by ok.GNO desc


/* doç. dr kerim kürşat cevikin girmiş olduğu derslerden ortalaması 70 
üstü alan öğrencilerin kimlik bilgileri ve ders isimlerinin listesini veren sorguyu join kullanarak yazınız */

select ok.Ogr_No, k.Ad, k.Soyad, d.D_Ad, (dk.Vize*0.4 + dk.Final*0.5 + dk.Uygulama*0.1) as ort
from kimlik k, personeller p, unvanlar u, dersler_personel dp, dersler d, ders_kayit dk, ogrenci_kayit ok
where k.TC_Kimlik = ok.TC_Kimlik
and p.U_No = u.U_No
and p.Sicil_No = dp.Sicil_No
and dp.D_Kod = d.D_Kod
and d.D_Kod = dk.D_Kod
and dk.Ogr_No = ok.Ogr_No
and p.Sicil_No = '114'
and dk.Vize*0.4 + dk.Final*0.5 + dk.Uygulama*0.1 > 70