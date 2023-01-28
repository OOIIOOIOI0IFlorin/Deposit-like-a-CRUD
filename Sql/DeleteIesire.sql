USE [depozit]
GO

/****** Object:  StoredProcedure [dbo].[DeleteIesire]    Script Date: 1/28/2023 8:33:00 PM ******/
DROP PROCEDURE [dbo].[DeleteIesire]
GO

/****** Object:  StoredProcedure [dbo].[DeleteIesire]    Script Date: 1/28/2023 8:33:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[DeleteIesire]
@idIntrare int
AS

DELETE FROM iesiri WHERE id = @idIntrare

GO

