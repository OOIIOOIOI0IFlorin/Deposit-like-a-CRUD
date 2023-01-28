USE [depozit]
GO

ALTER TABLE [dbo].[intrari_input] DROP CONSTRAINT [FK_intrari_input_produse]
GO

ALTER TABLE [dbo].[intrari_input] DROP CONSTRAINT [FK_intrari_input_Parteneri]
GO

/****** Object:  Table [dbo].[intrari_input]    Script Date: 1/28/2023 8:28:46 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[intrari_input]') AND type in (N'U'))
DROP TABLE [dbo].[intrari_input]
GO

/****** Object:  Table [dbo].[intrari_input]    Script Date: 1/28/2023 8:28:46 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[intrari_input](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[productId] [int] NOT NULL,
	[providerId] [int] NOT NULL,
	[dateReceived] [date] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_intrari_input] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[intrari_input]  WITH CHECK ADD  CONSTRAINT [FK_intrari_input_Parteneri] FOREIGN KEY([providerId])
REFERENCES [dbo].[Parteneri] ([id])
GO

ALTER TABLE [dbo].[intrari_input] CHECK CONSTRAINT [FK_intrari_input_Parteneri]
GO

ALTER TABLE [dbo].[intrari_input]  WITH CHECK ADD  CONSTRAINT [FK_intrari_input_produse] FOREIGN KEY([productId])
REFERENCES [dbo].[produse] ([id])
GO

ALTER TABLE [dbo].[intrari_input] CHECK CONSTRAINT [FK_intrari_input_produse]
GO

