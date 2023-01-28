USE [depozit]
GO

ALTER TABLE [dbo].[Parteneri] DROP CONSTRAINT [FK_Parteneri_Parteneri]
GO

/****** Object:  Table [dbo].[Parteneri]    Script Date: 1/28/2023 8:24:33 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Parteneri]') AND type in (N'U'))
DROP TABLE [dbo].[Parteneri]
GO

/****** Object:  Table [dbo].[Parteneri]    Script Date: 1/28/2023 8:24:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Parteneri](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[email] [varchar](50) NULL,
	[adress] [varchar](100) NULL,
 CONSTRAINT [PK_Furnizori1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Parteneri]  WITH CHECK ADD  CONSTRAINT [FK_Parteneri_Parteneri] FOREIGN KEY([id])
REFERENCES [dbo].[Parteneri] ([id])
GO

ALTER TABLE [dbo].[Parteneri] CHECK CONSTRAINT [FK_Parteneri_Parteneri]
GO

