CREATE TABLE KATEGORIE_ZAROBKOWE
(
    id_kategorii_zarobkowej INT NOT NULL PRIMARY KEY,
    kategoria_zarobkowa VARCHAR(50) NOT NULL,
);

CREATE TABLE STANY_CYWILNE
(
    id_stanu_cywilnego INT NOT NULL PRIMARY KEY,
    stan_cywilny VARCHAR(50) NOT NULL,
);


CREATE TABLE KLIENCI
(
    id_klienta INT NOT NULL PRIMARY KEY,
	imie CHAR(40),
	nazwisko VARCHAR(50),
	adres VARCHAR(60),
	PESEL CHAR(15),
	telefon CHAR(20),
	email CHAR(35),
	nr_dowodu CHAR(12),
	id_kategorii_zarobkowej INT REFERENCES KATEGORIE_ZAROBKOWE,
	id_stanu_cywilnego INT REFERENCES STANY_CYWILNE
);

CREATE TABLE KRAJE
(
	id_kraju INT NOT NULL PRIMARY KEY,
	nazwa_kraju VARCHAR(50) NOT NULL
);

CREATE TABLE UMOWY
(
	id_umowy INT NOT NULL PRIMARY KEY,
	data DATE NOT NULL,
	id_klienta INT REFERENCES Klienci
);

CREATE TABLE PLATNOSCI
(
	id_platnosci INT NOT NULL PRIMARY KEY,
	kwota DECIMAL(10,2),
	data_czas_platnosci DATE,
	typ VARCHAR(20),
	id_umowy INT NOT NULL REFERENCES Umowy
);

CREATE TABLE OPERATORZY
(
	id_operatora INT NOT NULL PRIMARY KEY,
	nazwa_firmy VARCHAR(50) NOT NULL,
	telefon CHAR(50) NOT NULL,
	email CHAR(50) NOT NULL
);
CREATE TABLE SIECI_HOTELI
(
	id_sieci_hoteli INT NOT NULL PRIMARY KEY,
	nazwa_sieci VARCHAR(50)
);

CREATE TABLE HOTELE
(
	id_hotelu INT NOT NULL PRIMARY KEY,
	adres VARCHAR(60),
	email CHAR(35),
	telefon CHAR(20),
	id_kraju INT REFERENCES KRAJE,
	id_sieci_hotelu INT REFERENCES SIECI_HOTELI
);

CREATE TABLE WYCIECZKI
(
	id_wycieczki INT NOT NULL PRIMARY KEY,
	cena DECIMAL(10,2),
	data_rozpoczecia DATE NOT NULL,
	data_zakonczenia DATE NOT NULL,
	id_operatora INT REFERENCES OPERATORZY,
	id_umowy INT REFERENCES UMOWY,
	id_hotelu INT REFERENCES HOTELE
);

