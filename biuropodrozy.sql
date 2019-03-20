CREATE TABLE KATEGORIE_ZAROBKOWE
(
    id_kategorii_zarobkowej int NOT NULL PRIMARY KEY,
    kategoria_zarobkowa VARCHAR(30),
);

CREATE TABLE STANY_CYWILNE
(
    id_stanu_cywilnego int NOT NULL PRIMARY KEY,
    stan_cywilny VARCHAR(30),
);


CREATE TABLE KLIENCI
(
    id_klienta int NOT NULL PRIMARY KEY,
	imie CHAR(40),
	nazwisko VARCHAR(50),
	adres VARCHAR(60),
	PESEL CHAR(15),
	telefon CHAR(20),
	email CHAR(35),
	nr_dowodu CHAR(12),
	id_kategorii_zarobkowej NCHAR(6) REFERENCES KATEGORIE_ZAROBKOWE,
	id_stanu_cywilnego NCHAR(6) REFERENCES STANY_CYWILNE
);

CREATE TABLE KRAJE
(
	id_kraju int NOT NULL PRIMARY KEY,
	nazwa_kraju VARCHAR(30)
);

CREATE TABLE UMOWY
(
	id_umowy int NOT NULL PRIMARY KEY,
	data DATE,
	id_klienta NCHAR(6) REFERENCES Klienci
);

CREATE TABLE P�ATNO�CI
(
	id_p�atno�ci int NOT NULL PRIMARY KEY,
	kwota DECIMAL(10,2),
	data_czas_p�atno�ci DATE,
	typ VARCHAR(20),
	id_umowy NCHAR(6) REFERENCES Umowy
);

CREATE TABLE OPERATORZY
(
	id_operatora int NOT NULL PRIMARY KEY,
	nazwa_firmy VARCHAR(20),
	telefon CHAR(15),
	email CHAR(25)
);
CREATE TABLE SIECI_HOTELI
(
	id_sieci_hoteli int NOT NULL PRIMARY KEY,
	nazwa_sieci VARCHAR(30)
);

CREATE TABLE HOTELE
(
	id_hotelu int NOT NULL PRIMARY KEY,
	adres VARCHAR(60),
	email CHAR(35),
	telefon CHAR(20),
	id_kraju NCHAR(6) REFERENCES KRAJE,
	id_sieci_hotelu NCHAR(6) REFERENCES SIECI_HOTELI
);

CREATE TABLE WYCIECZKI
(
	id_wycieczki int NOT NULL PRIMARY KEY,
	cena DECIMAL(10,2),
	data_rozpocz�cia DATE NOT NULL,
	data_zako�czenia DATE NOT NULL,
	id_operatora NCHAR(6) REFERENCES OPERATORZY,
	id_umowy NCHAR(6) REFERENCES UMOWY,
	id_hotelu NCHAR(6) REFERENCES HOTELE
);

