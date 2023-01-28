USE [depozit]
GO

ALTER TABLE [dbo].[iesiri] DROP CONSTRAINT [FK_iesiri_produse]
GO

ALTER TABLE [dbo].[iesiri] DROP CONSTRAINT [FK_iesiri_iesiri]
GO

/****** Object:  Table [dbo].[iesiri]    Script Date: 1/28/2023 8:29:12 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[iesiri]') AND type in (N'U'))
DROP TABLE [dbo].[iesiri]
GO

/****** Object:  Table [dbo].[iesiri]    Script Date: 1/28/2023 8:29:12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[iesiri](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[productId] [int] NOT NULL,
	[providerId] [int] NOT NULL,
	[dateOut] [date] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_iesiri] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[iesiri]  WITH CHECK ADD  CONSTRAINT [FK_iesiri_iesiri] FOREIGN KEY([providerId])
REFERENCES [dbo].[Parteneri] ([id])
GO

ALTER TABLE [dbo].[iesiri] CHECK CONSTRAINT [FK_iesiri_iesiri]
GO

ALTER TABLE [dbo].[iesiri]  WITH CHECK ADD  CONSTRAINT [FK_iesiri_produse] FOREIGN KEY([productId])
REFERENCES [dbo].[produse] ([id])
GO

ALTER TABLE [dbo].[iesiri] CHECK CONSTRAINT [FK_iesiri_produse]
GO

