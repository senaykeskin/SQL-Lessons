use universite

select * from ders_kayit
select * from ders_kayit where D_Kod = 'YBS 113'
select Ogr_No, vize, final, uygulama from ders_kayit where D_Kod = 'YBS 113'
select Ogr_No, vize+10 as [Yeni Vize], final, uygulama from ders_kayit where D_Kod = 'YBS 113' 
update ders_kayit set Uygulama = 0 where Uygulama is null


/* FİNAL SORUSU ----YBS 114 DERSİNDEN V,F,U BAZ ALINARAK ORTALAMA HESAPLAYAN VE ORTALAMA VE FİNALİ YÜKSEKTEN DÜŞÜĞE SIRALAYAN PROGRAM---- */
select Ogr_No, Vize, final, Uygulama, vize*0.4 + final*0.5 + uygulama*0.1 as Ortalama from ders_kayit where D_Kod = 'YBS 114' and
vize*0.4 + final*0.5 + uygulama*0.1>70
order by Ortalama desc, final desc

select * from kimlik 
select * from kimlik where ad = 'Mert'
select * from kimlik where ad like 'Mert' /* ad = mert ile aynı */
select * from kimlik where ad like 'M%' /* M ile başlayanlar */
select * from kimlik where ad like '%M' /* M ile bitenler */
select * from kimlik where ad like '%M%' /* adında M geçenler */

select * from kimlik where ad like 'M___' /* M ile başlayıp sonrasında 3 karakter */
select * from kimlik where ad like '__n%' /* 3. karakteri n olan */
select * from kimlik where ad like '__n__' /* 3. karakteri n olan ve sonrasında 2 karakter olan*/
select * from kimlik where ad like '__n%' /* 3. karakteri n olan */
select * from kimlik where ad like 's%y' /* s ile başlayıp y ile bitenler */

select * from kimlik where ad like '%[AET]' /* a, e, t ile bitenler */
select * from kimlik where ad like '%[^AET]' /* a, e, t ile bitenler */
select * from kimlik where ad like '%[A-E]' /* a-e arasında bitenler */

/* NOT: sınavda primary keyin olduğu yere bağlantı açma*/

select * from kimlik 
select TC_Kimlik, Ad, Soyad, D_Tarih from kimlik 
select TC_Kimlik, Ad, Soyad, substring(Tel,1,4), Tel from kimlik 

select substring(TC_Kimlik,1,3)+ '*****' + SUBSTRING(TC_Kimlik,9,11), Ad, SUBSTRING(Tel,1,3) from kimlik 

select upper(Ad), upper(Soyad) from kimlik 
select upper(Ad + ' ' + Soyad) from kimlik /* hepsi büyük harf oldu */
select lower(Ad), lower(Soyad) from kimlik /* hepsi küçük harf oldu */

select lower(SUBSTRING(ad,1,1))+ upper(SUBSTRING(ad,2,len(ad))) from kimlik

select rtrim(Ad) from kimlik 
select rtrim(ltrim(Ad)) as Yeniad from kimlik order by Yeniad /* boşlukları siler*/

select Ad, len(Ad) as uzunluk, Soyad, len(Soyad) as uzunluk from kimlik 

select Ad, Soyad, len(Ad + ' ' + soyad), SUBSTRING(ad,1,2) from kimlik

select replace(ad, 'Fatma Nur', 'Fatma') from kimlik

select Ad, Soyad, len(Ad + ' ' + soyad), SUBSTRING(ad,1,len(ad + ' ' + soyad)) from kimlik

select SUBSTRING(ad,1,2) + ' ' + SUBSTRING(soyad, len(soyad)-1,2) from kimlik

select SUBSTRING(Ad, len(ad)-1,2) from kimlik

select SUBSTRING(Ad + ' '+ Soyad,3, len(Ad + ' '+ Soyad)-4) from kimlik 

select replace(Ad + ' '+ Soyad,
SUBSTRING(Ad + ' ' + Soyad, 3, len(Ad + ' '+ Soyad)-4),'****')
from kimlik


