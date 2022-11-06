create database okulOdevi

use okulOdevi 

create table unvanlar(
U_No varchar(50) primary key,
Unvan varchar(50) not null
)

create table donemler(
D_No varchar(50) primary key,
Donem varchar(50)
)

create table alanlar(
A_No varchar(50) primary key,
Alan varchar(50)
)

create table fakulteler(
F_No varchar(50) primary key,
F_Ad varchar(50) not null,
Adres varchar(50),
Tel varchar(11),
Eposta varchar(50),
D_Sicil_No varchar(50)
)

create table personeller(
Sicil_No varchar(50) primary key,
TC_Kimlik varchar(11),
B_No varchar(50),
A_No varchar(50),
U_No varchar(50)
)

create table bolumler(
B_No varchar(50) primary key,
B_Ad varchar(50) not null,
F_No varchar(50),
BB_Sicil_No varchar(50),
Tur_No varchar(50)
)

create table ogrenim_tur(
Tur_No varchar(50) primary key,
Tur varchar(50)
)

create table kimlik(
TC_Kimlik varchar(11) primary key,
Ad varchar(50),
Soyad varchar(50),
D_Tarih date,
D_Yer varchar(50),
A_Ad varchar(50),
B_Ad varchar(50),
Tel varchar(11),
Eposta varchar(50),
Resim image
)

create table dersler(
D_Kod varchar(50) primary key,
D_Ad varchar(50),
T int,
U int,
K int,
AKTS int,
B_No varchar(50),
Yariyil varchar(1)
)

create table dersler_personel(
Kayıt_No int primary key identity(1,1),
Sicil_No varchar(50),
D_Kod varchar(50),
D_No varchar(50)
)

create table ogrenci_kayıt(
Ogrenci_No varchar(11) primary key,
TC_Kimlik varchar(11)not null,
B_No varchar(50),
K_Tarih date,
K_Tur varchar(50),
M_Tarih date,
GNO float,
Durum bit,
)

create table ders_kayıt(
Kayıt_No int primary key identity(1,1),
Ogrenci_No varchar(11),
D_Kod varchar(50),
Vize int check(vize >= 0 and vize <= 100),
Final int check(Final >= 0 and final <= 100),
Uygulama int check(uygulama >= 0 and uygulama <= 100), 
Butunleme int check(butunleme >= 0 and butunleme <= 100),
Durum bit,
D_No varchar(50)
)


/*çalıştı*/
alter table bolumler add constraint fk_fakulteler_bolumler foreign key(F_No)
references fakulteler (F_No) on update cascade 

alter table bolumler add constraint fk_ogrenim_tur_bolumler foreign key(Tur_No)
references ogrenim_tur(Tur_No) on delete cascade

alter table bolumler add constraint fk_personeller_bolumler foreign key(BB_Sicil_No)
references personeller(Sicil_No)

alter table personeller add constraint fk_bolumler_personeller foreign key(B_No)
references bolumler(B_No)

alter table personeller add constraint fk_alanlar_personeller foreign key(A_No)
references alanlar(A_No)

alter table personeller add constraint fk_unvanlar_personeller foreign key(U_No)
references unvanlar(U_No)

alter table personeller add constraint fk_kimlik_personeller foreign key(TC_Kimlik)
references kimlik(TC_Kimlik)

alter table dersler add constraint fk_bolumler_dersler foreign key(B_No)
references bolumler(B_No)

alter table dersler_personel add constraint fk_donemler_dersler_personel foreign key(D_No)
references donemler(D_No)

alter table dersler_personel add constraint fk_dersler_personeller foreign key(D_Kod)
references dersler(D_Kod)

alter table dersler_personel add constraint fk_personeller_dersler_personel foreign key(Sicil_No)
references personeller(Sicil_No)

alter table ogrenci_kayıt add constraint fk_kimlik_ogrenci_kayit foreign key(TC_Kimlik)
references kimlik(TC_Kimlik)

alter table ogrenci_kayıt add constraint fk_bolumler_ogrenci_kayit foreign key(B_No)
references bolumler(B_No)

alter table ders_kayıt add constraint fk_donemler_ogrenci_kayit foreign key(D_No)
references donemler(D_No)

alter table ders_kayıt add constraint fk_ogrenci_kayit_ders_kayit foreign key(Ogrenci_No)
references ogrenci_kayıt(Ogrenci_No)

alter table ders_kayıt add constraint fk_dersler_ders_kayit foreign key(D_Kod)
references dersler(D_Kod)

/*çalıştı*/
select * from unvanlar
insert into unvanlar values('1', 'Prof. Dr.')
insert into unvanlar values('2', 'Doç. Dr.')
insert into unvanlar values('3', 'Dr. Ögr. Üyesi')
insert into unvanlar values('4', 'Ögr. Gör.')
insert into unvanlar values('5', 'Aras. Gör.')
insert into unvanlar values('6', 'Uzman')
insert into unvanlar values('7', 'Sef')
insert into unvanlar values('8', 'Memur')

/*çalıştı*/
select * from ogrenim_tur
insert into ogrenim_tur values('1', 'Ön Lisans')
insert into ogrenim_tur values('2', 'Lisans')
insert into ogrenim_tur values('3', 'Yüksek Lisans')
insert into ogrenim_tur values('4', 'Doktora')
insert into ogrenim_tur values('5', 'Master')

/*açalıştı*/
select * from alanlar
insert into alanlar values('1', 'Bilişim')
insert into alanlar values('2', 'Tasarım')
insert into alanlar values('3', 'Pazarlama')
insert into alanlar values('4', 'Bankacılık')
insert into alanlar values('5', 'Sigortacılık')


/*çalıştı*/
select * from fakulteler
insert into fakulteler values('1', 'Diş Hekimliği Fakültesi', 'Kampüs', '02421112211', 'dis@akdeniz.edu.tr', '100')
insert into fakulteler values('2', 'Edebiyat Fakültesi', 'Kampüs', '02421112222', 'edb@akdeniz.edu.tr', '101')
insert into fakulteler values('3', 'Fen Fakültesi', 'Kampüs', '02421112233', 'fen@akdeniz.edu.tr', '102')
insert into fakulteler values('4', 'Edebiyat Fakültesi', 'Kampüs', '02421112244', 'edb@akdeniz.edu.tr', '103')
insert into fakulteler values('5', 'Güzel Sanatlar Fakültesi', 'Kampüs', '02421112255', 'gsf@akdeniz.edu.tr', '104')
insert into fakulteler values('6', 'Hemşirelik Fakültesi', 'Kampüs', '02421112266', 'hems@akdeniz.edu.tr', '105')
insert into fakulteler values('7', 'Hukuk Fakültesi', 'Kampüs', '02421112277', 'huk@akdeniz.edu.tr', '106')
insert into fakulteler values('8', 'İktisadi ve İdari Bilimler Fakültesi', 'Kampüs', '02421112288', 'iibf@akdeniz.edu.tr', '107')
insert into fakulteler values('9', 'İlahiyat Fakültesi', 'Kampüs', '02421112299', 'ilh@akdeniz.edu.tr', '108')
insert into fakulteler values('10', 'İletişim Fakültesi', 'Kampüs', '02421113311', 'ilt@akdeniz.edu.tr', '109')
insert into fakulteler values('11', 'Kemer Denizcilik Fakültesi', 'Kemer', '02421113322', 'kdf@akdeniz.edu.tr', '110')
insert into fakulteler values('12', 'İletişim Fakültesi', 'Kampüs', '02421113322', 'ilt@akdeniz.edu.tr', '111')
insert into fakulteler values('13', 'Kumluca Sağlık Bilimleri Fakültesi', 'Kumluca', '02421113333', 'ksbf@akdeniz.edu.tr', '112')
insert into fakulteler values('14', 'Manavgat Sosyal ve Beşeri Bilimler Fakültesi', 'Manavgat', '02421113344', 'msbbf@akdeniz.edu.tr', '113')
insert into fakulteler values('15', 'Manavgat Turizm Fakültesi', 'Manavgat', '02421113355', 'mtf@akdeniz.edu.tr', '114')
insert into fakulteler values('16', 'Mimarlık Fakültesi', 'Kampüs', '02421113366', 'mim@akdeniz.edu.tr', '115')
insert into fakulteler values('17', 'Mühendislik Fakültesi', 'Kampüs', '02421113377', 'muh@akdeniz.edu.tr', '116')
insert into fakulteler values('18', 'Sağlık Bilimleri Fakültesi', 'Kampüs', '02421113388', 'sbf@akdeniz.edu.tr', '117')
insert into fakulteler values('19', 'Serik İşletme Fakültesi', 'Serik', '02421113399', 'sif@akdeniz.edu.tr', '118')
insert into fakulteler values('20', 'Spor Bilimleri  Fakültesi', 'Kampüs', '02421114400', 'spor@akdeniz.edu.tr', '119')
insert into fakulteler values('21', 'Su Ürünleri  Fakültesi', 'Kampüs', '02421114411', 'suf@akdeniz.edu.tr', '120')
insert into fakulteler values('22', 'Tıp Fakültesi', 'Kampüs', '02421114422', 'tip@akdeniz.edu.tr', '121')
insert into fakulteler values('23', 'Turizm Fakültesi', 'Kampüs', '02421114433', 'turizm@akdeniz.edu.tr', '122')
insert into fakulteler values('24', 'Uygulamalı Bilimler Fakültesi', 'Kampüs', '02421114444', 'ubf@akdeniz.edu.tr', '123')
insert into fakulteler values('25', 'Ziraat Bilimler Fakültesi', 'Kampüs', '02421114455', 'ziraat@akdeniz.edu.tr', '124')


/*çalıştı*/
select * from kimlik
insert into kimlik values('11111111111', 'Senay', 'Keskin', '07.07.2003', 'Hatay', 'Sumeyye', 'Hikmet', '05511052955', 'senay.keskn00@gmail.com', null)
insert into kimlik values('11111111112', 'Ceylin', 'Çınuk', '05.10.2002', 'Antalya', 'Ayşe', 'Ahmet', '05551975423', 'dfghytgh@gmail.com', null)
insert into kimlik values('11111111113', 'Dilara', 'Aslankurt', '10.11.2000', 'Aydın', 'Asiye', 'Mahmut', '05501239865', 'scvbuhdhcn@gmail.com', null)
insert into kimlik values('11111111114', 'Aleyna', 'Güldiken', '11.03.2001', 'Malatya', 'Ayse', 'Fatih', '05324561234', 'rtcvsdwe@gmail.com', null)
insert into kimlik values('11111111115', 'Yusuf', 'Denishan', '09.12.2000', 'Tekirdağ', 'Fatma', 'Mithat', '05517890011', 'seyecdasxd@gmail.com', null)
insert into kimlik values('11111111116', 'Umut', 'Peksert', '11.02.2003', 'Antalya', 'Ayça', 'Melih', '05431651198', 'qwertbvsd@gmail.com', null)
insert into kimlik values('11111111117', 'Sefa', 'Çetin', '11.01.2001', 'Kayseri', 'Melike', 'Hakan', '05761098767', 'sdfgtfg1@gmail.com', null)
insert into kimlik values('11111111118', 'Asya', 'Yılmaz', '02.03.2002', 'İstanbul', 'Nuriye', 'Nebi', '05124329912', 'kmswıdjeu@gmail.com', null)
insert into kimlik values('11111111119', 'Mira', 'Beylice', '10.11.2002', 'Kocaeli', 'Sude', 'Faruk', '05523451231', 'opehfecbub@gmail.com', null)
insert into kimlik values('11111111110', 'Yaman', 'Koper', '12.21.2001', 'İzmir', 'Ender', 'Selim', '05561290987', 'qazxswefc@gmail.com', null)

insert into kimlik values('12312312312', 'Filiz', 'Kutluk', '10.10.1978', 'Burdur', 'Ayşe', 'Mehmet', '05112213212', 'filiz@gmail.com', null) /*hoca bu 1*/
insert into kimlik values('13413413434', 'Olgun', 'Kitapçı', '12.10.1965', 'Manisa', 'Ayşe', 'Mehmet', '05990001122', 'olgun@gmail.com', null) /*hoca bu 2*/
insert into kimlik values('14514514545', 'Yunus', 'Kılıç', '07.05.1987', 'Antalya', 'Ayşe', 'Mehmet', '05661110011', 'yunus@gmail.com', null) /*hoca bu 3*/
insert into kimlik values('15615615656', 'Ramazan', 'Erturgut', '12.01.1977', 'Hakkari', 'Ayşe', 'Mehmet', '05330990099', 'ramazan@gmail.com', null) /*hoca bu 4*/
insert into kimlik values('16716716767', 'Sezgin', 'Irmak', '11.05.1970', 'Mersin', 'Ayşe', 'Mehmet', '05001112211', 'sezgin@gmail.com', null) /*hoca bu 5*/
insert into kimlik values('17817817878', 'Tayfun', 'Yörük', '09.10.1980', 'Edirne', 'Ayşe', 'Mehmet', '05991213121', 'tayfun@gmail.com', null) /*hoca bu 6*/
insert into kimlik values('18918918989', 'Ömür', 'Tosun', '10.02.1971', 'Samsun', 'Ayşe', 'Mehmet', '05881120099', 'omur@gmail.com', null) /*hoca bu 7*/
insert into kimlik values('19919919999', 'Kerim', 'Çevik', '11.08.1972', 'Aydın', 'Ayşe', 'Mehmet', '05226665566', 'kerim@gmail.com', null) /*hoca bu 8*/
insert into kimlik values('11211211212', 'Nuray', 'Akar', '02.01.1975', 'Gümüşhane', 'Ayşe', 'Mehmet', '05110004499', 'nuray@gmail.com', null) /*hoca bu 9*/
insert into kimlik values('11311311313', 'Hande', 'Erdoğan', '02.11.1974', 'Denizli', 'Ayşe', 'Mehmet', '05220001890', 'hande@gmail.com', null) /*hoca bu 10*/
insert into kimlik values('11411411414', 'Hasan', 'Erdoğan', '01.04.1969', 'Elazığ', 'Ayşe', 'Mehmet', '05550998876', 'hasan@gmail.com', null) /*hoca bu 11*/
insert into kimlik values('11511511515', 'Güray', 'Tonguç', '12.12.1970', 'Manisa', 'Ayşe', 'Mehmet', '05446667766', 'guray@gmail.com', null) /*hoca bu 12*/



/*çalıştı*/
select * from ogrenci_kayıt
insert into ogrenci_kayıt values('20214703003', '11111111111', '5', '09.09.2021', 'YKS', '06.06.2025', '3.20', '1')
insert into ogrenci_kayıt values('20214703004', '11111111112', '5', '09.09.2021', 'YKS', '06.06.2025', '3.30', '1')
insert into ogrenci_kayıt values('20214703005', '11111111113', '5', '10.09.2021', 'YKS', '06.06.2025', '3', '1')
insert into ogrenci_kayıt values('20214703006', '11111111114', '5', '09.09.2021', 'OSS', '06.06.2025', '3.40', '1')
insert into ogrenci_kayıt values('20214703007', '11111111115', '5', '10.09.2021', 'YKS', '06.06.2025', '3.20', '1')
insert into ogrenci_kayıt values('20214703008', '11111111116', '5', '09.09.2021', 'YKS', '06.06.2025', '2.90', '1')
insert into ogrenci_kayıt values('20214703009', '11111111117', '5', '09.09.2021', 'OSS', '06.06.2025', '2.80', '1')
insert into ogrenci_kayıt values('20214703010', '11111111118', '5', '11.09.2021', 'YKS', '06.06.2025', '3.50', '1')
insert into ogrenci_kayıt values('20214703011', '11111111119', '5', '09.09.2021', 'OSS', '06.06.2025', '3.10', '1')
insert into ogrenci_kayıt values('20214703012', '11111111110', '5', '07.09.2021', 'YKS', '06.06.2025', '4', '1')


/*çalıştı*/
select * from donemler
insert into donemler values('1', '2021-2022 Güz')
insert into donemler values('2', '2021-2022 Bahar')
insert into donemler values('3', '2022-2023 Güz')
insert into donemler values('4', '2022-2023 Bahar')
insert into donemler values('5', '2023-2024 Güz')
insert into donemler values('6', '2023-2024 Bahar')
insert into donemler values('7', '2024-2025 Güz')
insert into donemler values('8', '2024-2025 Bahar')


/*çalıştı*/
select * from bolumler 
insert into bolumler values('1', 'Finans ve Bankacılık', '24', '3200', '2')
insert into bolumler values('2', 'Pazarlama', '24', '3201', '2')
insert into bolumler values('3', 'Sigortacılık', '24', '3202', '1')
insert into bolumler values('4', 'Uluslararası Ticaret ve Lojistik', '24', '3203', '2')
insert into bolumler values('5', 'Yönetim Bilişim Sistemleri', '24', '3204', '2')


/*çalıştı */
select * from personeller
insert into personeller values('3200', '12312312312', '1', '4', '1') /* burası kimliğe eklendi */ 
insert into personeller values('3201', '13413413434', '2', '3', '1') /* pazarlama bb tamam*/
insert into personeller values('3202', '14514514545', '3', '5', '2') /* sigortacılık bb tamam */
insert into personeller values('3203', '15615615656', '4', '4', '1') /* utl bb tamam */
insert into personeller values('3204', '16716716767', '5', '1', '1') /* ybs bb prof tamam*/

insert into personeller values('3205', '17817817878', '5', '1', '3') /* dr*/
insert into personeller values('3206', '18918918989', '5', '1', '2') /* doç */
insert into personeller values('3207', '19919919999', '5', '1', '2') /* doç*/ 
insert into personeller values('3208', '11211211212', '5', '1', '2') /* doç */
insert into personeller values('3209', '11311311313', '5', '1', '3') /* dr */
insert into personeller values('3210', '11411411414', '5', '1', '3') /* dr */
insert into personeller values('3211', '11511511515', '5', '1', '3') /* dr */



/*çalıştı*/
select * from dersler
insert into dersler values('YBS 113', 'Bilişim Sistemleri ve Teknolojilerine Giriş', '3', '0', '3',  '5', '5', '1') 
insert into dersler values('YBS 115', 'Matematik', '3', '0', '3', '5', '5', '1')
insert into dersler values('YBS 117', 'İktisada Giriş 1', '3', '0', '3', '5', '5', '1')
insert into dersler values('YBS 119', 'Pazarlama İlkeleri', '3', '0', '3', '5', '5', '1')
insert into dersler values('TDB 101', 'Türk Dili 1', '2', '0', '2', '2', '5', '1')
insert into dersler values('ATA 101', 'Atatürk İlkeleri ve İnkılap Tarihi 1', '2', '0', '2', '2', '5', '1')
insert into dersler values('YBD 101', 'İngilizce 1', '2', '0', '2', '4', '5', '1')
insert into dersler values('KPD 101', 'Kariyer Planlama', '1', '0', '1', '2', '5', '1')

insert into dersler values('YBS 114', 'Veritabanına Giriş', '3', '0', '3', '5', '5', '2')
insert into dersler values('YBS 116', 'Bilgisayar Donanımı ve İşletim Sistemleri', '3', '0', '3', '5', '5', '2')
insert into dersler values('YBS 118', 'İktisada Giriş 2', '3', '0', '3', '5', '5', '2')
insert into dersler values('YBS 120', 'Yönetim ve Organizasyon', '3', '0', '3', '5', '5', '2')
insert into dersler values('YBS 112', 'İleri Düzey Ofis Uygulamaları', '2', '0', '2', '2', '5', '2')
insert into dersler values('TBD 102', 'Türk Dili 2', '2', '0', '2', '2', '5', '2')
insert into dersler values('ATA 102', 'Atatürk İlkeleri ve İnkılap Tarihi 2', '2', '0', '2', '2', '5', '2')
insert into dersler values('YBD 102', 'İngilizce 2', '2', '0', '2', '4', '5', '2')

insert into dersler values('YBS 203', 'Algoritma ve Programlamaya Giriş', '3', '1', '4', '5', '5', '3')
insert into dersler values('YBS 217', 'Veritabanı Yönetim Sistemleri', '3', '1', '4', '5', '5', '3')
insert into dersler values('YBS 205', 'Örgütsel Davranış', '3', '0', '3', '5', '5', '3')
insert into dersler values('YBS 219', 'İstatistik 1', '3', '0', '3', '5', '5', '3')
insert into dersler values('YBS 223', 'Proje Yönetimi', '3', '0', '3', '5', '5', '3')
insert into dersler values('YBS 221', 'Genel Muhasebe 1', '3', '0', '3', '5', '5', '3')

insert into dersler values('YBS 202', 'Nesne Yönelimli Programlama', '3', '1', '4', '5', '5', '4')
insert into dersler values('YBS 224', 'Sistem Analizi ve Tasarımı', '3', '0', '3', '5', '5', '4')
insert into dersler values('YBS 234', 'Üretim Yönetimi', '3', '0', '3', '5', '5', '4')
insert into dersler values('YBS 220', 'İstatistik 2', '3', '0', '3', '5', '5', '4')
insert into dersler values('YBS 226', 'Bilimsel Araştırma Yöntemleri', '3', '0', '3', '5', '5', '4')
insert into dersler values('YBS 222', 'Genel Muhasebe 2', '3', '0', '3', '5', '5', '4')

insert into dersler values('YBS 301', 'Yapay Zeka ve Öğrenen Algoritmalar', '3', '0', '3', '5', '5', '5')
insert into dersler values('YBS 303', 'Grafik ve Bilişim Arayüz Tasarımı', '3', '1', '4', '5', '5', '5')
insert into dersler values('YBS 305', 'Karar Verme Teknikleri', '3', '0', '3', '5', '5', '5')
insert into dersler values('YBS 307', 'İnsan Kaynakları Yönetimi', '3', '0', '3', '5', '5', '5')
insert into dersler values('YBS 319', 'Yöneylem Araştırması 1', '3', '0', '3', '5', '5', '5')
insert into dersler values('YBS 311', 'Bilişim Hukuku', '3', '0', '3', '5', '5', '5')
insert into dersler values('YBS 313', 'İnsan Bilgisayar Etkileşimi', '3', '0', '3', '5', '5', '5')
insert into dersler values('YBS 315', 'E-İş Yönetimi', '3', '0', '3', '5', '5', '5')
insert into dersler values('YBS 317', 'Maliyet Muhasebesi', '3', '0', '3', '5', '5', '5')

insert into dersler values('YBS 302', 'Veri İletişimi ve Bilgisayar Ağları', '3', '0', '3', '5', '5', '6')
insert into dersler values('YBS 304', 'Web Tabanlı Programlama', '3', '1', '4', '5', '5', '6')
insert into dersler values('YBS 306', 'Uygulamalı Veri Madenciliği', '3', '1', '4', '5', '5', '6')
insert into dersler values('YBS 308', 'Finansal Yönetim', '3', '0', '3', '5', '5', '6')
insert into dersler values('YBS 320', 'Yöneylem Araştırması 2', '3', '0', '3', '5', '5', '6')
insert into dersler values('YBS 312', 'Simülasyon Modelleri ve Analizi', '3', '0', '3', '5', '5', '6')
insert into dersler values('YBS 314', 'Tüketici Davranışları', '3', '0', '3', '5', '5', '6')
insert into dersler values('YBS 316', 'Stratejik Yönetim', '3', '0', '3', '5', '5', '6')

insert into dersler values('YBS 401', 'Kurumsal Kaynak Planlama', '3', '0', '3', '5', '5', '7')
insert into dersler values('YBS 403', 'Yönetim Bilişim Sistemlerinde Güncel Konular', '3', '0', '3', '5', '5', '7')
insert into dersler values('YBS 405', 'Mobil Uygulama Geliştirme', '3', '1', '4', '5', '5', '7')
insert into dersler values('YBS 409', 'Kurumsal Veri Yönetimi ve İş Zekası', '3', '0', '3', '5', '5', '7')
insert into dersler values('YBS 407', 'Robotik Uygulamaları', '3', '1', '4', '5', '5', '7')
insert into dersler values('YBS 411', 'Bilgisayarlı Muhasebe', '3', '1', '4', '5', '5', '7')
insert into dersler values('YBS 413', 'Müşteri İlişkileri Yönetimi', '3', '0', '3', '5', '5', '7')
insert into dersler values('YBS 417', 'Derin Öğrenme', '3', '0', '3', '5', '5', '7')
insert into dersler values('YBS 419', 'Tedarik Zinciri Yönetimi', '3', '0', '3', '5', '5', '7')
insert into dersler values('YBS 423', 'Bulut Bilişim', '3', '0', '3', '5', '5', '7')

insert into dersler values('YBS 402', 'İş Yerinde Eğitim', '0', '40', '40', '30', '5', '8')
/*çalıştı */select * from dersler_personelinsert into dersler_personel(Sicil_No, D_Kod, D_No) values('3204', 'YBS 301', '5')insert into dersler_personel(Sicil_No, D_Kod, D_No) values('3205', 'YBS 112', '2')insert into dersler_personel(Sicil_No, D_Kod, D_No) values('3206', 'YBS 203', '3')insert into dersler_personel(Sicil_No, D_Kod, D_No) values('3207', 'YBS 405', '7')insert into dersler_personel(Sicil_No, D_Kod, D_No) values('3208', 'YBS 120', '2') insert into dersler_personel(Sicil_No, D_Kod, D_No) values('3209', 'YBS 223', '3') insert into dersler_personel(Sicil_No, D_Kod, D_No) values('3210', 'YBS 314', '6') insert into dersler_personel(Sicil_No, D_Kod, D_No) values('3211', 'YBS 116', '2') select * from ders_kayıtinsert into ders_kayıt(Ogrenci_No, D_Kod, Vize, Final, Uygulama, Butunleme, Durum, D_No) values('20214703003', 'YBS 113', '60', '60', '60', '70', '0', '1' ) /* çalıştı*/insert into ders_kayıt(Ogrenci_No, D_Kod, Vize, Final, Uygulama, Butunleme, Durum, D_No) values('20214703003', 'YBS 115', '60', '60', '60', '70', '0', '1' )insert into ders_kayıt(Ogrenci_No, D_Kod, Vize, Final, Uygulama, Butunleme, Durum, D_No) values('20214703003', 'YBS 117', '60', '60', '60', '70', '0', '1' )insert into ders_kayıt(Ogrenci_No, D_Kod, Vize, Final, Uygulama, Butunleme, Durum, D_No) values('20214703003', 'YBS 119', '60', '60', '60', '70', '0', '1' )insert into ders_kayıt(Ogrenci_No, D_Kod, Vize, Final, Uygulama, Butunleme, Durum, D_No) values('20214703003', 'TDB 101', '60', '60', '60', '70', '0', '1' )insert into ders_kayıt(Ogrenci_No, D_Kod, Vize, Final, Uygulama, Butunleme, Durum, D_No) values('20214703003', 'ATA 101', '60', '60', '60', '70', '0', '1' )insert into ders_kayıt(Ogrenci_No, D_Kod, Vize, Final, Uygulama, Butunleme, Durum, D_No) values('20214703003', 'YBD 101', '60', '60', '60', '70', '0', '1' )insert into ders_kayıt(Ogrenci_No, D_Kod, Vize, Final, Uygulama, Butunleme, Durum, D_No) values('20214703003', 'KPD 101', '60', '60', '60', '70', '0', '1' )insert into ders_kayıt(Ogrenci_No, D_Kod, Vize, Final, Uygulama, Butunleme, Durum, D_No) values('20214703003', 'YBS 114', '60', '60', '60', '70', '0', '2' )insert into ders_kayıt(Ogrenci_No, D_Kod, Vize, Final, Uygulama, Butunleme, Durum, D_No) values('20214703003', 'YBS 116', '60', '60', '60', '70', '0', '2' )insert into ders_kayıt(Ogrenci_No, D_Kod, Vize, Final, Uygulama, Butunleme, Durum, D_No) values('20214703003', 'YBS 118', '60', '60', '60', '70', '0', '2' )insert into ders_kayıt(Ogrenci_No, D_Kod, Vize, Final, Uygulama, Butunleme, Durum, D_No) values('20214703003', 'YBS 120', '60', '60', '60', '70', '0', '2' )insert into ders_kayıt(Ogrenci_No, D_Kod, Vize, Final, Uygulama, Butunleme, Durum, D_No) values('20214703003', 'YBS 112', '60', '60', '60', '70', '0', '2' )insert into ders_kayıt(Ogrenci_No, D_Kod, Vize, Final, Uygulama, Butunleme, Durum, D_No) values('20214703003', 'TBD 102', '60', '60', '60', '70', '0', '2' )insert into ders_kayıt(Ogrenci_No, D_Kod, Vize, Final, Uygulama, Butunleme, Durum, D_No) values('20214703003', 'YBD 102', '60', '60', '60', '70', '0', '2' )insert into ders_kayıt(Ogrenci_No, D_Kod, Vize, Final, Uygulama, Butunleme, Durum, D_No) values('20214703003', 'ATA 102', '60', '60', '60', '70', '0', '2' )insert into ders_kayıt(Ogrenci_No, D_Kod, Vize, Final, Uygulama, Butunleme, Durum, D_No) values('20214703003', 'YBS 203', '60', '60', '60', '70', '1', '3' )insert into ders_kayıt(Ogrenci_No, D_Kod, Vize, Final, Uygulama, Butunleme, Durum, D_No) values('20214703003', 'YBS 205', '60', '60', '60', '70', '1', '3' )insert into ders_kayıt(Ogrenci_No, D_Kod, Vize, Final, Uygulama, Butunleme, Durum, D_No) values('20214703003', 'YBS 217', '60', '60', '60', '70', '1', '3' )insert into ders_kayıt(Ogrenci_No, D_Kod, Vize, Final, Uygulama, Butunleme, Durum, D_No) values('20214703003', 'YBS 219', '60', '60', '60', '70', '1', '3' )insert into ders_kayıt(Ogrenci_No, D_Kod, Vize, Final, Uygulama, Butunleme, Durum, D_No) values('20214703003', 'YBS 221', '60', '60', '60', '70', '1', '3' )insert into ders_kayıt(Ogrenci_No, D_Kod, Vize, Final, Uygulama, Butunleme, Durum, D_No) values('20214703003', 'YBS 223', '60', '60', '60', '70', '1', '3' )