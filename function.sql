DROP FUNCTION IF EXISTS wycieczkiOperatorowCenaWiekszaOd;
DROP FUNCTION IF EXISTS wycieczkiOperatorowCzasTrwania;
DROP FUNCTION IF EXISTS przychodOperatora;
DROP FUNCTION IF EXISTS liczbaSprzedanychWycieczekOperatora;
DROP FUNCTION IF EXISTS liczbaKupionychWycieczekKlienta;
GO

CREATE FUNCTION [dbo].[wycieczkiOperatorowCenaWiekszaOd](@cena int)
RETURNS TABLE
AS
RETURN(
    SELECT NAZWA_FIRMY, TELEFON, EMAIL, cena, DATEDIFF(day,data_rozpoczecia,data_zakonczenia) as liczbaDni
from dbo.OPERATORZY as t1
    JOIN dbo.WYCIECZKI as t2 on t1.ID = t2.id_operatora
WHERE cena > @cena
)
GO

CREATE FUNCTION [dbo].[wycieczkiOperatorowCzasTrwania](@lidzbaDni int)
RETURNS TABLE
AS
RETURN(
    SELECT NAZWA_FIRMY, TELEFON, EMAIL, cena, DATEDIFF(day,data_rozpoczecia,data_zakonczenia) as liczbaDni
from dbo.OPERATORZY as t1
    JOIN dbo.WYCIECZKI as t2 on t1.ID = t2.id_operatora
WHERE DATEDIFF(day,data_rozpoczecia,data_zakonczenia) > @lidzbaDni
)
GO


CREATE FUNCTION [dbo].[przychodOperatora](@id int)
RETURNS INT
AS
BEGIN
    RETURN(ISNULL((
    SELECT SUM(cena)
    FROM dbo.OPERATORZY as t1
        JOIN dbo.WYCIECZKI as t2 on t1.id = t2.id_operatora
    WHERE t1.id=@id),0))
END;
GO

CREATE FUNCTION [dbo].[liczbaSprzedanychWycieczekOperatora](@id int)
RETURNS INT
AS
BEGIN
    RETURN(ISNULL(
	(SELECT COUNT(NAZWA_FIRMY)
    from dbo.WYCIECZKI as t2
        JOIN dbo.OPERATORZY as t1 on t1.id = t2.id_operatora
    WHERE t1.id = @id), 0))
END;
GO

CREATE FUNCTION [dbo].[liczbaKupionychWycieczekKlienta](@id int)
RETURNS INT
AS
BEGIN
    RETURN(
    SELECT count(*)
    from dbo.WYCIECZKI as t1
        JOIN dbo.UMOWY as t2 on t1.id_umowy = t2.id
        JOIN dbo.KLIENCI as t3 on t2.id_klienta = t3.id
    WHERE t3.id = @id)
END;
GO
