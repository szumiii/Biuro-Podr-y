DROP TABLE IF EXISTS dbo.AuditTable;
-- AUDYTOWA TABELA
CREATE TABLE [dbo].[AuditTable]
(
    [AuditID] [int] IDENTITY(1,1) NOT NULL,
    [TableName] [nvarchar](50) NULL,
    [ChangedID] [int] NULL,
    [EventType] [nvarchar](50) NULL,
    [LoginName] [nvarchar](250) NULL,
    [AuditDateTime] [datetime] NULL
)
GO

-- WYCIECZKI
CREATE TRIGGER triggerInsertWycieczki on WYCIECZKI
after insert
as
begin
    declare
	@ID int;

    Select @ID = inserted.id
    from inserted
    insert into AuditTable
        (TableName, ChangedID, EventType,LoginName, AuditDateTime)
    values('WYCIECZKI', @ID, 'INSERT', SUSER_SNAME(), GETDATE())
end
go

CREATE TRIGGER triggerUpdateWycieczki on WYCIECZKI
after update
as
begin
    declare
	@ID int;

    Select @ID = inserted.id
    from inserted
    insert into AuditTable
        (TableName, ChangedID, EventType,LoginName, AuditDateTime)
    values('WYCIECZKI', @ID, 'UPDATE', SUSER_SNAME(), GETDATE())
end
go


CREATE TRIGGER triggerDeleteWycieczki on WYCIECZKI
for DELETE
as
begin
    declare
	@ID int;

    Select @ID = deleted.id
    from deleted
    insert into AuditTable
        (TableName, ChangedID, EventType,LoginName, AuditDateTime)
    values('WYCIECZKI', @ID, 'DELETED', SUSER_SNAME(), GETDATE())
end
go

-- HOTELE
CREATE TRIGGER triggerInsertHotele on HOTELE
after insert
as
begin
    declare
	@ID int;

    Select @ID = inserted.id
    from inserted
    insert into AuditTable
        (TableName, ChangedID, EventType,LoginName, AuditDateTime)
    values('HOTELE', @ID, 'INSERT', SUSER_SNAME(), GETDATE())
end
go

CREATE TRIGGER triggerUpdateHotele on HOTELE
after update
as
begin
    declare
	@ID int;

    Select @ID = inserted.id
    from inserted
    insert into AuditTable
        (TableName, ChangedID, EventType,LoginName, AuditDateTime)
    values('HOTELE', @ID, 'UPDATE', SUSER_SNAME(), GETDATE())
end
go


CREATE TRIGGER triggerDeleteHotele on HOTELE
for DELETE
as
begin
    declare
	@ID int;

    Select @ID = deleted.id
    from deleted
    insert into AuditTable
        (TableName, ChangedID, EventType,LoginName, AuditDateTime)
    values('HOTELE', @ID, 'DELETED', SUSER_SNAME(), GETDATE())
end
go

-- SIECI HOTELI
CREATE TRIGGER triggerInsertSIECI_HOTELI on SIECI_HOTELI
after insert
as
begin
    declare
	@ID int;

    Select @ID = inserted.id
    from inserted
    insert into AuditTable
        (TableName, ChangedID, EventType,LoginName, AuditDateTime)
    values('SIECI_HOTELI', @ID, 'INSERT', SUSER_SNAME(), GETDATE())
end
go

CREATE TRIGGER triggerUpdateSIECI_HOTELI on SIECI_HOTELI
after update
as
begin
    declare
	@ID int;

    Select @ID = inserted.id
    from inserted
    insert into AuditTable
        (TableName, ChangedID, EventType,LoginName, AuditDateTime)
    values('SIECI_HOTELI', @ID, 'UPDATE', SUSER_SNAME(), GETDATE())
end
go


CREATE TRIGGER triggerDeleteSIECI_HOTELI on SIECI_HOTELI
for DELETE
as
begin
    declare
	@ID int;

    Select @ID = deleted.id
    from deleted
    insert into AuditTable
        (TableName, ChangedID, EventType,LoginName, AuditDateTime)
    values('SIECI_HOTELI', @ID, 'DELETED', SUSER_SNAME(), GETDATE())
end
go


-- OPERATORZY
CREATE TRIGGER triggerInsertOPERATORZY on OPERATORZY
after insert
as
begin
    declare
	@ID int;

    Select @ID = inserted.id
    from inserted
    insert into AuditTable
        (TableName, ChangedID, EventType,LoginName, AuditDateTime)
    values('OPERATORZY', @ID, 'INSERT', SUSER_SNAME(), GETDATE())
end
go

CREATE TRIGGER triggerUpdateOPERATORZY on OPERATORZY
after update
as
begin
    declare
	@ID int;

    Select @ID = inserted.id
    from inserted
    insert into AuditTable
        (TableName, ChangedID, EventType,LoginName, AuditDateTime)
    values('OPERATORZY', @ID, 'UPDATE', SUSER_SNAME(), GETDATE())
end
go


CREATE TRIGGER triggerDeleteOPERATORZY on OPERATORZY
for DELETE
as
begin
    declare
	@ID int;

    Select @ID = deleted.id
    from deleted
    insert into AuditTable
        (TableName, ChangedID, EventType,LoginName, AuditDateTime)
    values('OPERATORZY', @ID, 'DELETED', SUSER_SNAME(), GETDATE())
end
go

-- KLIENCI
CREATE TRIGGER triggerInsertKLIENCI on KLIENCI
after insert
as
begin
    declare
	@ID int;

    Select @ID = inserted.id
    from inserted
    insert into AuditTable
        (TableName, ChangedID, EventType,LoginName, AuditDateTime)
    values('KLIENCI', @ID, 'INSERT', SUSER_SNAME(), GETDATE())
end
go

CREATE TRIGGER triggerUpdateKLIENCI on KLIENCI
after update
as
begin
    declare
	@ID int;

    Select @ID = inserted.id
    from inserted
    insert into AuditTable
        (TableName, ChangedID, EventType,LoginName, AuditDateTime)
    values('KLIENCI', @ID, 'UPDATE', SUSER_SNAME(), GETDATE())
end
go


CREATE TRIGGER triggerDeleteKLIENCI on KLIENCI
for DELETE
as
begin
    declare
	@ID int;

    Select @ID = deleted.id
    from deleted
    insert into AuditTable
        (TableName, ChangedID, EventType,LoginName, AuditDateTime)
    values('KLIENCI', @ID, 'DELETED', SUSER_SNAME(), GETDATE())
end
go

-- UMOWY
CREATE TRIGGER triggerInsertUMOWY on UMOWY
after insert
as
begin
    declare
	@ID int;

    Select @ID = inserted.id
    from inserted
    insert into AuditTable
        (TableName, ChangedID, EventType,LoginName, AuditDateTime)
    values('UMOWY', @ID, 'INSERT', SUSER_SNAME(), GETDATE())
end
go

CREATE TRIGGER triggerUpdateUMOWY on UMOWY
after update
as
begin
    declare
	@ID int;

    Select @ID = inserted.id
    from inserted
    insert into AuditTable
        (TableName, ChangedID, EventType,LoginName, AuditDateTime)
    values('UMOWY', @ID, 'UPDATE', SUSER_SNAME(), GETDATE())
end
go


CREATE TRIGGER triggerDeleteUMOWY on UMOWY
for DELETE
as
begin
    declare
	@ID int;

    Select @ID = deleted.id
    from deleted
    insert into AuditTable
        (TableName, ChangedID, EventType,LoginName, AuditDateTime)
    values('UMOWY', @ID, 'DELETED', SUSER_SNAME(), GETDATE())
end
go
