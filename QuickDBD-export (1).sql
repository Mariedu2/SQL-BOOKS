
-- ***** Object:  Table [dbo].[books_info]    Script Date: 19/10/2022 21:47:16 *****
CREATE TABLE [dbo].[books_info] (
    [book_id] int  NOT NULL ,
    [title] varchar(255)  NOT NULL ,
    [num_pages] int  NOT NULL ,
    [description] varchar(max)  NOT NULL ,
    [genre] varchar(255)  NOT NULL ,
    [author_name] varchar(255)  NOT NULL ,
    CONSTRAINT [PK_books_info] PRIMARY KEY CLUSTERED (
        [book_id] ASC
    )
)

-- ***** Object:  Table [dbo].[books_reservation]    Script Date: 19/10/2022 21:47:16 *****
CREATE TABLE [dbo].[books_reservation] (
    [book_id] int  NOT NULL ,
    [title] varchar(255)  NOT NULL ,
    [user_id_mapping] int  NOT NULL ,
    [book_id_mapping] int  NOT NULL 
)

-- ***** Object:  Table [dbo].[books_titles]    Script Date: 19/10/2022 21:47:16 *****
CREATE TABLE [dbo].[books_titles] (
    [book_id] int  NOT NULL ,
    [title] varchar(255)  NOT NULL 
)

ALTER TABLE [dbo].[books_info] WITH CHECK ADD CONSTRAINT [FK_books_info_book_id] FOREIGN KEY([book_id])
REFERENCES [dbo].[books_titles] ([book_id])

ALTER TABLE [dbo].[books_info] CHECK CONSTRAINT [FK_books_info_book_id]

ALTER TABLE [dbo].[books_info] WITH CHECK ADD CONSTRAINT [FK_books_info_title] FOREIGN KEY([title])
REFERENCES [dbo].[books_reservation] ([title])

ALTER TABLE [dbo].[books_info] CHECK CONSTRAINT [FK_books_info_title]

ALTER TABLE [dbo].[books_reservation] WITH CHECK ADD CONSTRAINT [FK_books_reservation_book_id_title] FOREIGN KEY([book_id], [title])
REFERENCES [dbo].[books_titles] ([book_id], [title])

ALTER TABLE [dbo].[books_reservation] CHECK CONSTRAINT [FK_books_reservation_book_id_title]

ALTER TABLE [dbo].[books_titles] WITH CHECK ADD CONSTRAINT [FK_books_titles_title] FOREIGN KEY([title])
REFERENCES [dbo].[books_info] ([title])

ALTER TABLE [dbo].[books_titles] CHECK CONSTRAINT [FK_books_titles_title]

