DROP VIEW IF EXISTS HOTELE_VIEW;
DROP VIEW IF EXISTS WYCIECZKI_KRAJE_VIEW;
DROP VIEW IF EXISTS WYCIECZKI_KLIENCI_VIEW;
DROP VIEW IF EXISTS WYCIECZKI_OPERATOROW;
DROP VIEW IF EXISTS KLIENCI_VIEW;
GO

CREATE VIEW [dbo].[KLIENCI_VIEW]
AS
    SELECT k.*, kz.kategoria_zarobkowa, sc.stan_cywilny
    FROM dbo.KLIENCI as k
        INNER JOIN dbo.KATEGORIE_ZAROBKOWE as kz on k.id_kategorii_zarobkowej = kz.id
        INNER JOIN dbo.STANY_CYWILNE as sc on k.id_stanu_cywilnego = sc.id
GO

CREATE VIEW [dbo].[HOTELE_VIEW]
AS
    SELECT adres, email, telefon, NAZWA_KRAJU, NAZWA_SIECI
    FROM dbo.HOTELE as t1
        JOIN dbo.KRAJE as t2 on t1.id_kraju = t2.id
        JOIN dbo.SIECI_HOTELI as t3 on t1.id_sieci_hotelu = t3.id
GO

CREATE VIEW [dbo].[WYCIECZKI_KRAJE_VIEW]
AS
    SELECT cena, data_rozpoczecia, data_zakonczenia, NAZWA_KRAJU
    FROM dbo.WYCIECZKI as t1
        JOIN dbo.HOTELE as t2 on t2.id= t1.id_hotelu
        JOIN dbo.KRAJE as t3 on t2.id_kraju = t3.ID
GO

CREATE VIEW [dbo].[WYCIECZKI_KLIENCI_VIEW]
AS
    SELECT w.cena, w.data_rozpoczecia, w.data_zakonczenia, k.*
    FROM WYCIECZKI as w
        INNER JOIN dbo.UMOWY as u on w.id_umowy = u.id
        INNER JOIN dbo.KLIENCI_VIEW as k on u.id_klienta = k.id
GO

CREATE VIEW [dbo].[WYCIECZKI_OPERATOROW]
AS
    SELECT NAZWA_FIRMY, TELEFON, EMAIL, cena, data_rozpoczecia, data_zakonczenia
    from dbo.OPERATORZY as t1
        JOIN dbo.WYCIECZKI as t2 on t1.ID = t2.id_operatora
GO

