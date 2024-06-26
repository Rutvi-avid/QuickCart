USE [master]
GO
/****** Object:  Database [QuickCart]    Script Date: 20-06-2024 14:19:39 ******/
CREATE DATABASE [QuickCart]
GO
USE [QuickCart]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 20-06-2024 14:19:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItemProduct]    Script Date: 20-06-2024 14:19:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItemProduct](
	[OrderItemsId] [int] NOT NULL,
	[ProductsId] [int] NOT NULL,
 CONSTRAINT [PK_OrderItemProduct] PRIMARY KEY CLUSTERED 
(
	[OrderItemsId] ASC,
	[ProductsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 20-06-2024 14:19:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderOrderItem]    Script Date: 20-06-2024 14:19:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderOrderItem](
	[OrderItemsId] [int] NOT NULL,
	[OrdersId] [int] NOT NULL,
 CONSTRAINT [PK_OrderOrderItem] PRIMARY KEY CLUSTERED 
(
	[OrderItemsId] ASC,
	[OrdersId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 20-06-2024 14:19:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[TotalPrice] [decimal](18, 2) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 20-06-2024 14:19:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Stock] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 20-06-2024 14:19:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[IsAdmin] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240620065105_myfirstmigration', N'8.0.6')
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Username], [Email], [Password], [CreatedAt], [IsAdmin]) VALUES (1, N'admin', N'admin@yopmail.com', N'3hilsuSi64XcYlyh93VEfQ==', CAST(N'2024-06-20T12:26:05.1833333' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [IX_OrderItemProduct_ProductsId]    Script Date: 20-06-2024 14:19:39 ******/
CREATE NONCLUSTERED INDEX [IX_OrderItemProduct_ProductsId] ON [dbo].[OrderItemProduct]
(
	[ProductsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderOrderItem_OrdersId]    Script Date: 20-06-2024 14:19:39 ******/
CREATE NONCLUSTERED INDEX [IX_OrderOrderItem_OrdersId] ON [dbo].[OrderOrderItem]
(
	[OrdersId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_UserId]    Script Date: 20-06-2024 14:19:39 ******/
CREATE NONCLUSTERED INDEX [IX_Orders_UserId] ON [dbo].[Orders]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderItemProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderItemProduct_OrderItems_OrderItemsId] FOREIGN KEY([OrderItemsId])
REFERENCES [dbo].[OrderItems] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderItemProduct] CHECK CONSTRAINT [FK_OrderItemProduct_OrderItems_OrderItemsId]
GO
ALTER TABLE [dbo].[OrderItemProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderItemProduct_Products_ProductsId] FOREIGN KEY([ProductsId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderItemProduct] CHECK CONSTRAINT [FK_OrderItemProduct_Products_ProductsId]
GO
ALTER TABLE [dbo].[OrderOrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderOrderItem_OrderItems_OrderItemsId] FOREIGN KEY([OrderItemsId])
REFERENCES [dbo].[OrderItems] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderOrderItem] CHECK CONSTRAINT [FK_OrderOrderItem_OrderItems_OrderItemsId]
GO
ALTER TABLE [dbo].[OrderOrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderOrderItem_Orders_OrdersId] FOREIGN KEY([OrdersId])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderOrderItem] CHECK CONSTRAINT [FK_OrderOrderItem_Orders_OrdersId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [QuickCart] SET  READ_WRITE 
GO
