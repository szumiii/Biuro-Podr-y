CREATE NONCLUSTERED INDEX IX_Klienci_Imie_Nazwisko   
    ON dbo.Klienci (imie,nazwisko);   
  

CREATE NONCLUSTERED INDEX IX_Operatorzy_nazwa_firmy   
    ON dbo.Operatorzy (nazwa_firmy);   
  

CREATE NONCLUSTERED INDEX IX_Wycieczki_data_rozpoczecia
    ON dbo.WYCIECZKI (data_rozpoczecia);   
  

CREATE NONCLUSTERED INDEX IX_Umowy_data
    ON dbo.UMOWY (data);   
 

CREATE NONCLUSTERED INDEX IX_Platnosci_data
    ON dbo.PLATNOSCI (data);   
GO   

