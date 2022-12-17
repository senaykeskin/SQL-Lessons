use universite

select * from kimlik
select CHARINDEX('a', ad) as sıra , Ad from kimlik order by sıra
select CHARINDEX(' ', ad) as sıra , Ad from kimlik order by sıra

select substring(Ad, CHARINDEX(' ', ad)+1, len(Ad) - CHARINDEX(' ', ad)+1) from kimlik 

select * from personeller
select Tc_Kimlik from personeller
select *, case TC_Kimlik when '11111111111' then 'Ramazan Erturgut' when '11111111112' then 'Kursat Çevik' end from personeller

select * from kimlik
select reverse(Ad), reverse(Soyad)from kimlik /* string ifadeyi tersten yazma */

select * from ders_kayit
select vize, abs(Final), Uygulama from ders_kayit /* mutlak değer */

select * from ders_kayit
select vize*0.4 + Final*0.5 + Uygulama*0.1 as ortalama, 
floor(vize*0.4 + Final*0.5 + Uygulama*0.1) as ortalamaAsagi from ders_kayit /* aşağı yuvarlama: 74.9 -> 74 */

select vize*0.4 + Final*0.5 + Uygulama*0.1 as ortalama, 
ceiling(vize*0.4 + Final*0.5 + Uygulama*0.1) as ortalamaYukari from ders_kayit /* yukarı yuvarlama: 74.3 -> 75 */

select vize*0.4 + Final*0.5 + Uygulama*0.1 as ortalama, 
round(vize*0.4 + Final*0.5 + Uygulama*0.1,1) as ortalamaYuvarla from ders_kayit /* virgülden sonra kaç basamak isteniyorsa ona göre yuvarlama yapılıyor */

select vize from ders_kayit
select power(vize,2) from ders_kayit /* üs alma */
select sqrt(vize) from ders_kayit /* karekök alma */
select sqrt(vize), round(sqrt(vize),3) from ders_kayit
select (vize % 3) from ders_kayit /* modunu alma */
select max(vize) from ders_kayit 
select min(vize) from ders_kayit

select sum(vize) from ders_kayit /* toplam */
select sum(final) from ders_kayit 

select avg(vize) from ders_kayit /* ortalama */
select avg(final) as finalOrtalama from ders_kayit

select count(vize) from ders_kayit /* <vizeye> kayıt sayısı */
select count(final) from ders_kayit
select sum(vize)/count(vize) from ders_kayit

select * from kimlik
select d_tarih, cast(D_Tarih as char) from kimlik /* tip dönüşümü */
select d_tarih, cast(D_Tarih as char(5)) from kimlik /* char'a dönüştür ve 5 karaktere kadar al */


