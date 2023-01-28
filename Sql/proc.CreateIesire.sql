USE [depozit]
GO

/****** Object:  StoredProcedure [dbo].[CreateIesire]    Script Date: 1/28/2023 8:32:30 PM ******/
DROP PROCEDURE [dbo].[CreateIesire]
GO

/****** Object:  StoredProcedure [dbo].[CreateIesire]    Script Date: 1/28/2023 8:32:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[CreateIesire]
@productName varchar(50),
@partnerName varchar(50),
@qty int
AS

IF NOT EXISTS (SELECT id name FROM produse WHERE name = @productName)
INSERT INTO produse (name) VALUES (@productName)

IF NOT EXISTS (SELECT id FROM parteneri WHERE name = @partnerName)
INSERT INTO Parteneri (name) VALUES (@partnerName)

INSERT INTO iesiri (productId, providerId, dateOut, quantity) VALUES
((SELECT id FROM produse WHERE name = @productName), (select id FROM parteneri WHERE name = @partnerName),
GETDATE(),  @qty)		

GO

