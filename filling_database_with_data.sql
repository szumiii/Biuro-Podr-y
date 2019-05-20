USE [Grupa_5]
GO

Declare @Id int
Set @Id = 1

While @Id <= 1000
Begin 
   Insert Into [dbo].[SIECI_HOTELI] values ('Siec hoteli - ' + CAST(@Id as nvarchar(10)))
   Set @Id = @Id + 1
End


/* ------------------------------------ */

USE [Grupa_5]
GO


INSERT INTO [dbo].[STANY_CYWILNE]
           ([STAN_CYWILNY])
     VALUES
           ('wolna/y')

INSERT INTO [dbo].[STANY_CYWILNE]
           ([STAN_CYWILNY])
     VALUES
           ('zamezna/zonaty')
GO

/* ------------------------------------ */

USE [Grupa_5]
GO

Declare @Id int
Set @Id = 6

While @Id <= 25
Begin 
   Insert Into [dbo].[KRAJE] values ('Kraj - ' + CAST(@Id as nvarchar(10)))
   Set @Id = @Id + 1
End

/* ------------------------------------ */

USE [Grupa_5]
GO

Declare @Id int
Set @Id = 1

While @Id <= 1000
Begin 
   Insert Into [dbo].[OPERATORZY] values ('Operator - ' + CAST(@Id as nvarchar(10)),
		'500000' + CAST(@Id as nvarchar(10)),
		'mail' + CAST(@Id as nvarchar(10)) + '@gmail.com'
   )
   Set @Id = @Id + 1
End

/* ------------------------------------ */

USE [Grupa_5]
GO

Declare @RandomIdKraju int
Declare @RandomIDSieci int

Declare @LowerLimitForIdKraju int
Declare @UpperLimitForIdKraju int

Set @LowerLimitForIdKraju = 1
Set @UpperLimitForIdKraju = 25

Declare @LowerLimitForIdSieci int
Declare @UpperLimitForIdSieci int

Set @LowerLimitForIdSieci = 1 
Set @UpperLimitForIdSieci = 1000 


Declare @Id int
Set @Id = 1

While @Id <= 1000
Begin

	Select @RandomIdKraju = Round(((@UpperLimitForIdKraju - @LowerLimitForIdKraju) * Rand()) + @LowerLimitForIdKraju, 0)
	Select @RandomIDSieci = Round(((@UpperLimitForIdSieci - @LowerLimitForIdSieci) * Rand()) + @LowerLimitForIdSieci, 0)

	print @RandomIdKraju 
	Insert Into [dbo].[HOTELE] values (@Id,'Adres - ' + CAST(@Id as nvarchar(10)),
		'mail' + CAST(@Id as nvarchar(10)) + '@gmail.com',
		'500000' + CAST(@Id as nvarchar(10)),
		@RandomIdKraju,
		@RandomIDSieci
   )
   Set @Id = @Id + 1
End

/* ------------------------------------ */

USE [Grupa_5]
GO


INSERT INTO [dbo].[KATEGORIE_ZAROBKOWE]
           ([KATEGORIA_ZAROBKOWA])
     VALUES
           ('niska')

INSERT INTO [dbo].[KATEGORIE_ZAROBKOWE]
           ([KATEGORIA_ZAROBKOWA])
     VALUES
           ('przecietna')
GO
INSERT INTO [dbo].[KATEGORIE_ZAROBKOWE]
           ([KATEGORIA_ZAROBKOWA])
     VALUES
           ('powyzej przecietna')
GO
INSERT INTO [dbo].[KATEGORIE_ZAROBKOWE]
           ([KATEGORIA_ZAROBKOWA])
     VALUES
           ('wysoka')
GO

/* ------------------------------------ */

USE [Grupa_5]
GO

Declare @RandomIdKategoriiZarobkowej int
Declare @RandomIDStanuCywilego int

Declare @Id int
Set @Id = 1

While @Id <= 10000
Begin

	Select @RandomIdKategoriiZarobkowej = Round(((4 - 1) * Rand()) + 1, 0)
	Select @RandomIDStanuCywilego = Round(((1) * Rand()) + 1, 0)

	Insert Into [dbo].[KLIENCI] values (@Id,'Imie - ' + CAST(@Id as nvarchar(10)),
		'Nazwisko - ' + CAST(@Id as nvarchar(10)),
		'Adres - ' + CAST(@Id as nvarchar(10)),
		'PESEL - ' + CAST(@Id as nvarchar(10)),
		'590123' + CAST(@Id as nvarchar(10)),
		'mail' + CAST(@Id as nvarchar(10)) + '@gmail.com',
		'AWC' + CAST(@Id as nvarchar(10)),
		@RandomIdKategoriiZarobkowej,
		@RandomIDStanuCywilego
   )
   Set @Id = @Id + 1
End

/* ------------------------------------ */

USE [Grupa_5]
GO

Declare @RandomDayAdd int

Declare @Id int
Set @Id = 1

While @Id <= 10000
Begin

	Select @RandomDayAdd = Round(((15000 - 1) * Rand()) + 1, 0)

	Insert Into [dbo].[UMOWY] values (
		DATEADD(DAY, @RandomDayAdd, convert(varchar, getdate(), 23)),
		10001-@Id
   )
   Set @Id = @Id + 1
End

/* ------------------------------------ */

USE [Grupa_5]
GO

Declare @RandomKwota decimal
Declare @RandomDayAdd int
Declare @RandomIdUmowy int

Declare @Id int
Set @Id = 1

While @Id <= 20000
Begin

	Select @RandomDayAdd = Round(((5000 - 1) * Rand()) + 1, 0)
	Select @RandomKwota = Round(((9000 - 1) * Rand()) + 1, 0)
	Select @RandomIdUmowy = Round(((10000 - 1) * Rand()) + 1, 0)
	print @RandomIdUmowy

	Insert Into [dbo].[PLATNOSCI] values (@Id,@RandomKwota,
		DATEADD(DAY, @RandomDayAdd, convert(varchar, getdate(), 23)),
		'typ',
		30000+@RandomIdUmowy
   )
   Set @Id = @Id + 1
End

/* ------------------------------------ */

USE [Grupa_5]
GO

Declare @RandomKwota decimal
Declare @RandomDayAdd int
Declare @RandomIdUmowy int
Declare @RandomIdOperatora int
Declare @RandomIdHotelu int


Declare @Id int
Set @Id = 1

While @Id <= 1000
Begin

	Select @RandomDayAdd = Round(((7 - 1) * Rand()) + 1, 0)
	Select @RandomKwota = Round(((7 - 1) * Rand()) + 1, 0)
	Select @RandomIdUmowy = Round(((10000 - 1) * Rand()) + 1, 0)
	Select @RandomIdOperatora = Round(((1000 - 1) * Rand()) + 1, 0)
	Select @RandomIdHotelu = Round(((1000 - 1) * Rand()) + 1, 0)


	print @RandomIdUmowy

	Insert Into [dbo].[WYCIECZKI] values (@Id,1000+@RandomKwota,
		DATEADD(DAY, -1*@RandomDayAdd, convert(varchar, getdate(), 23)),
		DATEADD(DAY, @RandomDayAdd, convert(varchar, getdate(), 23)),
		@RandomIdOperatora,
		@RandomIdUmowy+30000,
		@RandomIdHotelu		
   )
   Set @Id = @Id + 1
End

/* ------------------------------------ */




	

