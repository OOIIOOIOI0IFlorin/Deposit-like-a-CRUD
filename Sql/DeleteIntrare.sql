USE [depozit]
GO

/****** Object:  StoredProcedure [dbo].[DeleteIntrare]    Script Date: 1/28/2023 8:33:09 PM ******/
DROP PROCEDURE [dbo].[DeleteIntrare]
GO

/****** Object:  StoredProcedure [dbo].[DeleteIntrare]    Script Date: 1/28/2023 8:33:09 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[DeleteIntrare]
@idIntrare int
AS

DELETE FROM iesiri WHERE id = @idIntrare

GO

