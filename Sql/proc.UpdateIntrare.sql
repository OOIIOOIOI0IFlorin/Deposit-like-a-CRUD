USE [depozit]
GO

/****** Object:  StoredProcedure [dbo].[UpdateIntrare]    Script Date: 1/28/2023 8:33:33 PM ******/
DROP PROCEDURE [dbo].[UpdateIntrare]
GO

/****** Object:  StoredProcedure [dbo].[UpdateIntrare]    Script Date: 1/28/2023 8:33:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[UpdateIntrare]
@idIntrare int,
@productName varchar(50),
@partnerName varchar(50),
@qty int
AS

IF NOT EXISTS (SELECT id FROM produse WHERE name = @productName)
INSERT INTO produse (name) VALUES (@productName)

IF NOT EXISTS (SELECT id FROM Parteneri WHERE name = @partnerName)
INSERT INTO Parteneri (name) VALUES (@partnerName)

UPDATE intrari_input SET
productId = (SELECT id FROM produse WHERE name = @productName),
providerId = (SELECT id FROM Parteneri WHERE name = @partnerName),
quantity = @qty
WHERE id = @idIntrare

GO

