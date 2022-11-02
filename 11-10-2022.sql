create database universite2

/*create table Unvanlar22( 
U_No int,
Unvan varchar(50) not null,
constraint pk_unvan_uno primary key(U_No)
)

create table ders_kayit2(
Kayit_No int identity(1,1),
Ogr_No varchar(11),
D_Kod varchar(10),
Vize int, Final int, Uygulama int, Butunleme int, Durum bit, D_No int,
constraint chk_ders_kayit_vize check(vize >= 0 and vize<= 100),
constraint chk_ders_kayit_final check(final >= 0 and final<= 100),
constraint chk_ders_kayit_uygulama check(uygulama >= 0 and uygulama<= 100),
constraint chk_ders_kayit_kayit_no primary key(Kayit_No)
)
*/
create table fakulteler_ab(
F_No varchar(50),
F_Ad varchar(50) not null,
Adres varchar(50),
Tel varchar(11),
Eposta varchar(50),
D_Sicil_No varchar(50),
constraint pk_fakulteler_F_No primary key(F_No)
)
/*
create table bolumler_a(
B_No varchar(50),
B_Ad varchar(50) not null ,
F_No varchar(50),
BB_Sicil_No varchar(50),
Tur_No varchar(50)
constraint pk_bolumler_B_No primary key(B_No),
constraint fk_fakulteler_bolumler foreign key(F_No)
references fakulteler_a(F_No) on delete cascade on update cascade
)
*/

create table ogrenim_tur_a(
Tur_No varchar(50),
Tur varchar(50),
constraint pk_ogrenim_tur_no1 primary key(Tur_No)
)
/*
create table alanlar(
A_No varchar(3) primary key,
Alan varchar(50)
)


create table donemler(
D_No int primary key identity(1,1),
Donem varchar(50)
)  */

create table bolumler(
B_No varchar(50)primary key,
B_Ad varchar(50) not null,
F_No varchar(50),
BB_Sicil_No varchar(50),
Tur_No varchar(50),
constraint fk_fakulteler_bolumler foreign key(F_No)
references fakulteler_ab(F_No) on update cascade,
constraint fk_ogrenim_tur_bolumler foreign key(Tur_No)
references ogrenim_tur_a(Tur_No),
/*constraint fk_personel_bolumler foreign key(BB_Sicil_No)
references personeller(Sicil_No) 
*/
)

create table personeller(
/* burası tamam*/
Sicil_No varchar(50) primary key,
TC_Kimlik varchar(11),
B_No varchar(50),
A_No varchar(50),
U_No varchar(50)
constraint fk_kimlik_personeller foreign key(TC_Kimlik)
references kimlik(TC_Kimlik) on update cascade,
constraint fk_bolumler_personeller foreign key(B_No)
references bolumler(B_No),
constraint fk_alanlar_personeller foreign key(A_No) 
references alanlar(A_No),
constraint fk_unvanlar_personeller foreign key(U_No)
references unvanlar(U_No)
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
/* burayı doldur */
)

create table dersler(
/* burası tamam*/
D_Kod varchar(50) primary key,
D_Ad varchar(50),
T int,
U int,
K int,
AKTS int,
B_No varchar(50),
Yariyil varchar(1),
constraint fk_bolumler_dersler foreign key(B_No)
references bolumler(B_No)
)

create table dersler_personel(
/*burası tamam*/
Kayıt_No int primary key identity(1,1),
Sicil_No varchar(50),
D_Kod varchar(50),
D_No varchar(50),
constraint fk_personeller_dersler_personel foreign key(Sicil_No)
references personeller(Sicil_No),
constraint fk_dersler_dersler_personel foreign key(D_Kod)
references dersler(D_Kod),
constraint fk_donemler_dersler_personel foreign key(D_No)
references donemler(D_No)
)

create table ogrenci_kayıt(
/*burası tamam*/
Ogrenci_No varchar(11) primary key,
TC_Kimlik varchar(11) not null,
B_No varchar(50),
K_Tarih date,
K_Tur varchar(50),
M_Tarih date,
GNO float,
Durum bit,
constraint fk_bolumler_ogrenci_kayit foreign key(B_No)
references bolumler(B_No),
constraint fk_kimlik_ogrenci_kayit foreign key(TC_Kimlik)
references kimlik(TC_Kimlik)
)

create table ders_kayıt(
/*burası tamam*/
Kayıt_No int primary key identity(1,1),
Ogrenci_No varchar(11),
D_Kod varchar(50),
Vize int check(vize >= 0 and vize <= 100),
Final int check(Final >= 0 and final <= 100),
Uygulama int check(uygulama >= 0 and uygulama <= 100), 
Butunleme int check(butunleme >= 0 and butunleme <= 100),
Durum bit,
D_No varchar(50),
constraint fk_donemler_ders_kayit foreign key(D_No)
references donemler(D_No),
constraint fk_dersler_ders_kayit foreign key(D_Kod)
references dersler(D_Kod),
constraint fk_ogrenci_kayit_ders_kayit foreign key(Ogrenci_No)
references ogrenci_kayit(Ogrenci_No),

)