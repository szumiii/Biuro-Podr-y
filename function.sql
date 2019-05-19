CREATE FUNCTION [dbo].[wycieczkiCenaWiekszaOd](
@cena int
)
RETURNS TABLE
AS
RETURN(
SELECT NAZWA_FIRMY, TELEFON, EMAIL, cena, DATEDIFF(day,data_rozpoczecia,data_zakonczenia) as liczbaDni
from dbo.OPERATORZY as t1
    JOIN dbo.WYCIECZKI as t2 on t1.ID = t2.id_operatora
WHERE cena > @cena
)
GO

CREATE FUNCTION [dbo].[wycieczkiCzasTrwania](
@lidzbaDni int
)
RETURNS TABLE
AS
RETURN(
SELECT NAZWA_FIRMY, TELEFON, EMAIL, cena, DATEDIFF(day,data_rozpoczecia,data_zakonczenia) as liczbaDni
from dbo.OPERATORZY as t1
    JOIN dbo.WYCIECZKI as t2 on t1.ID = t2.id_operatora
WHERE DATEDIFF(day,data_rozpoczecia,data_zakonczenia) > @lidzbaDni
)
GO


CREATE FUNCTION [dbo].[przychodOperatora](
@id int
)
RETURNS INT
AS
BEGIN
    RETURN(
    SELECT SUM(cena)
    FROM dbo.OPERATORZY as t1
        JOIN dbo.WYCIECZKI as t2 on t1.ID = t2.id_operatora
    WHERE ID=@id
    GROUP BY NAZWA_FIRMY)
END;
GO

CREATE FUNCTION [dbo].[liczbaSprzedanychWycieczekOperatora](
@id int
)
RETURNS INT
AS
BEGIN
    RETURN(
    SELECT COUNT(NAZWA_FIRMY)
    from dbo.OPERATORZY as t1
        JOIN dbo.WYCIECZKI as t2 on t1.ID = t2.id_operatora
    WHERE ID = @id
    GROUP BY NAZWA_FIRMY)
END;
GO

CREATE FUNCTION [dbo].[liczbaKupionychWycieczekKlienta](
@pesel int
)
RETURNS INT
AS
BEGIN
    RETURN(
    SELECT count(PESEL)
    from dbo.WYCIECZKI as t1
        JOIN dbo.UMOWY as t2 on t1.id_umowy = t2.ID
        JOIN dbo.KLIENCI as t3 on t2.id_klienta = t3.id_klienta
    WHERE PESEL = @pesel
    GROUP BY PESEL)
END;
GO

