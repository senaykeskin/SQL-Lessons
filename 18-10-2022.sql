create database uni

use uni

create table unvanlar(
U_No varchar(50) primary key,
Unvan varchar(50) not null
)

create table donemler(
D_No varchar(50) primary key,
Donem varchar(50)
)

create table alanlar(
A_No int primary key,
Alan varchar(50)
)

create table fakultelerF(
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
B_Ad varchar(50) not null default 'YBS',
F_No varchar(50),
BB_Sicil_No varchar(50),
Tur_No varchar(50)
)

create table ogrenim_turR(
Tur_No varchar(50) primary key,
Tur varchar(50)
)

create table kimlik(
TC_Kimlik varchar(11) primary key,
Ad varchar(50),
Soyad varchar(50),
D_Tarih date default '2000/01/01',
D_Yer varchar(50) default 'Antalya',
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

create table ders_kayıtT(
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

alter table kimlik add adres varchar(100)
alter table fakultelerF add webadres varchar(50)

alter table fakultelerF add webadres varchar(50) default 'www.akdeniz.edu.tr'

alter table fakultelerF drop column webadres

alter table kimlik drop column adres 
alter table alanlar add kayit_no int primary key identity(1,1)
alter table alanlar drop PK__alanlar__F0C55A49970C51E1 
alter table alanlar drop column kayit_no

alter table unvanlar alter column unvan varchar(25)

alter table alanlar alter column A_No int
alter table alanlar add constraint pk_alanlar_a_no primary key(A_No)
alter table alanlar drop pk_alanlar_a_no
alter table alanlar add check(A_No > 0)



/*1*/ alter table bolumler add constraint fk_fakulteler_bolumler foreign key(F_No)
references fakultelerF (F_No) on update cascade 

/*2*/ alter table bolumler add constraint fk_ogrenim_tur_bolumler foreign key(Tur_No)
references ogrenim_turR(Tur_No) on delete cascade

/*3*/ alter table bolumler add constraint fk_personeller_bolumler foreign key(BB_Sicil_No)
references personeller(Sicil_No)

/*4*/ alter table personeller add constraint fk_bolumler_personeller foreign key(B_No)
references bolumler(B_No)

alter table personeller alter column A_No int

/*5*/ alter table personeller add constraint fk_alanlar_personeller foreign key(A_No)
references alanlar(A_No)

/*6*/ alter table personeller add constraint fk_unvanlar_personeller foreign key(U_No)
references unvanlar(U_No)

/*7*/ alter table personeller add constraint fk_kimlik_personeller foreign key(TC_Kimlik)
references kimlik(TC_Kimlik)

/*8*/ alter table dersler add constraint fk_bolumler_dersler foreign key(B_No)
references bolumler(B_No)

/*9*/ alter table dersler_personel add constraint fk_donemler_dersler_personel foreign key(D_No)
references donemler(D_No)

/*10*/ alter table dersler_personel add constraint fk_dersler_personeller foreign key(D_Kod)
references dersler(D_Kod)

/*11*/ alter table dersler_personel add constraint fk_personeller_dersler_personel foreign key(Sicil_No)
references personeller(Sicil_No)

/*12*/ alter table ogrenci_kayıt add constraint fk_kimlik_ogrenci_kayit foreign key(TC_Kimlik)
references kimlik(TC_Kimlik)

/*13*/ alter table ogrenci_kayıt add constraint fk_bolumler_ogrenci_kayit foreign key(B_No)
references bolumler(B_No)

/*14*/ alter table ders_kayıtT add constraint fk_donemler_ogrenci_kayit foreign key(D_No)
references donemler(D_No)

/*15*/ alter table ders_kayıtT add constraint fk_ogrenci_kayit_ders_kayit foreign key(Ogrenci_No)
references ogrenci_kayıt(Ogrenci_No)

/*16*/ alter table ders_kayıtT add constraint fk_dersler_ders_kayit foreign key(D_Kod)
references dersler(D_Kod)



alter table ders_kayıtT drop fk_dersler_ders_kayit /*çalıştırma*/
