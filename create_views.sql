CREATE VIEW [dbo].[HOTELE_VIEW] AS
SELECT adres, email, telefon, NAZWA_KRAJU
FROM  dbo.HOTELE as t1
JOIN dbo.KRAJE as t2 on t1.id_kraju = t2.ID
;

CREATE VIEW [dbo].[HOTELE_W_SIECI] AS
SELECT NAZWA_SIECI, adres, email, telefon
FROM  dbo.SIECI_HOTELI as t1
JOIN dbo.HOTELE as t2 on t1.id = t2.id_sieci_hotelu
;

CREATE VIEW [dbo].[UMOWY_KLIENTOW] AS
SELECT data, imie, nazwisko 
from dbo.UMOWY as t1
JOIN dbo.KLIENCI as t2 on t1.id_klienta = t2.id_klienta
JOIN dbo.WYCIECZKI as t3 on t1.ID = t3.id_umowy
;

CREATE VIEW [dbo].[WYCIECZKI_OPERATOROW] AS
SELECT NAZWA_FIRMY,TELEFON,EMAIL, cena,data_rozpoczecia,data_zakonczenia
from dbo.OPERATORZY as t1
JOIN dbo.WYCIECZKI as t2 on t1.ID = t2.id_operatora
;

CREATE VIEW [dbo].[ZAROBKI_KLIENTOW] AS
SELECT imie, nazwisko, pesel, kategoria_zarobkowa
from dbo.KLIENCI as t1
JOIN dbo.KATEGORIE_ZAROBKOWE as t2 on t1.id_kategorii_zarobkowej = t2.ID
;