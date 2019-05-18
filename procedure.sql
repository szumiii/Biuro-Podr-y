CREATE PROCEDURE updateKLIENT
    @id int,
    @imie CHAR(40) = null;
    @nazwisko VARCHAR(50) = null;
    @adres VARCHAR(60) =null;
    @PESEL CHAR(15) = null,
	@telefon CHAR(20) = null,
	@email CHAR(35) = null,
	@nr_dowodu CHAR(12) = null,
	@id_kategorii_zarobkowej INT = null,
	@id_stanu_cywilnego INT = null
AS
BEGIN
    UPDATE Klienci
    SET
    imie = ISNULL(@imie, imie),
	nazwisko = ISNULL(@nazwisko, nazwisko),
	adres = ISNULL(@adres, adres),
	PESEL = ISNULL(@PESEL, PESEL),
	telefon = ISNULL(@telefon, telefon),
	email = ISNULL(@email, email),
	nr_dowodu = ISNULL(@nr_dowodu, nr_dowodu),
	id_kategorii_zarobkowej = ISNULL(@id_kategorii_zarobkowej, id_kategorii_zarobkowej),
	id_stanu_cywilnego = ISNULL(@id_stanu_cywilnego, id_stanu_cywilnego)
    WHERE id_klienta = @id
END

CREATE PROCEDURE updateHOTEL
    @id INT,
    @adres VARCHAR(60) = null,
	@email CHAR(35) = null,
	@telefon CHAR(20) = null,
	@id_kraju INT = null,
	@id_sieci_hotelu INT = null
AS
BEGIN
    UPDATE Hotele
    SET
	adres = ISNULL(@adres,adres),
	email = ISNULL(@email,email),
	telefon = ISNULL(@telefon,telefon),
	id_kraju = ISNULL(@id_kraju,id_kraju),
	id_sieci_hotelu= ISNULL(@id_sieci_hotelu,id_sieci_hotelu)
    WHERE id_hotelu = @id
END

CREATE PROCEDURE updateWYCIECZKI
    @id INT,
    @cena DECIMAL(10,2) = null,
	@data_rozpoczecia DATE  = null,
	@data_zakonczenia DATE  = null,
	@id_operatora INT = null,
	@id_umowy INT  = null,
	@id_hotelu INT  = null
AS
BEGIN
    UPDATE Wycieczki
    SET
    cena = ISNULL(@cena, cena),
    data_rozpoczecia = ISNULL(@data_rozpoczecia, data_rozpoczecia),
    data_zakonczenia = ISNULL(@data_zakonczenia, data_zakonczenia),
    id_operatora = ISNULL(@id_operatora, id_operatora),
    id_umowy = ISNULL(@id_umowy, id_umowy),
    id_hotelu = ISNULL(@id_hotelu, id_hotelu)
    WHERE id_wycieczki = @id
END

CREATE PROCEDURE updateOPERATORZY
    @id INT,
	@nazwa_firmy VARCHAR(50) = null,
	@telefon CHAR(50) = null,
	@email CHAR(50) = null,
AS
BEGIN
    UPDATE Operatorzy
    SET
        nazwa_firmy = ISNULL(@nazwa_firmy, nazwa_firmy),
        telefon = ISNULL(@telefon, telefon),
        email = ISNULL(@email, email)
    WHERE ID = @id
END

CREATE PROCEDURE updateSIECI_HOTELI
    @id INT,
	@nazwa_sieci VARCHAR(50) = null
AS
BEGIN
    UPDATE Sieci_hoteli
    SET
        nazwa_sieci = ISNULL(@nazwa_sieci, nazwa_sieci)
    WHERE ID = @id
END

CREATE PROCEDURE updateKRAJ
    @id INT,
    @nazwa_kraju VARCHAR(50) = null
AS
BEGIN
    UPDATE Kraje
    SET
        nazwa_kraju = ISNULL(@nazwa_kraju, nazwa_kraju)
    WHERE ID = @id
END

