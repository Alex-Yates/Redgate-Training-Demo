-- Adding my first table

/****** Object:  Table [dbo].[Authors]    Script Date: 19/09/2019 12:03:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Authors](
	[AuthorID] [INT] NOT NULL,
	[AuthorName] [NVARCHAR](50) NOT NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[AuthorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


-- Adding a second table with a foreign key

/****** Object:  Table [dbo].[Books]    Script Date: 19/09/2019 12:04:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Books](
	[BookID] [INT] NOT NULL,
	[BookName] [NVARCHAR](250) NOT NULL,
	[Year] [SMALLINT] NOT NULL,
	[AuthorID] [INT] NOT NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Authors] FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Authors] ([AuthorID])
GO

ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Authors]
GO

-- Adding a view that joins both the tables

/****** Object:  View [dbo].[vBooks]    Script Date: 19/09/2019 12:06:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vBooks] AS
SELECT Authors.AuthorName, Books.BookName, Books.Year
FROM dbo.Authors INNER JOIN dbo.Books
ON Authors.AuthorID=Books.AuthorID
GO

