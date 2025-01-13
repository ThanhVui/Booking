USE [master]
GO
/****** Object:  Database [Project_PRJ301_Group5_Booking_Room_Hotel]    Script Date: 10/29/2024 7:47:39 PM ******/
CREATE DATABASE [Project_PRJ301_Group5_Booking_Room_Hotel]
ALTER DATABASE [Project_PRJ301_Group5_Booking_Room_Hotel] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Project_PRJ301_Group5_Booking_Room_Hotel] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Project_PRJ301_Group5_Booking_Room_Hotel] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Project_PRJ301_Group5_Booking_Room_Hotel] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Project_PRJ301_Group5_Booking_Room_Hotel] SET ARITHABORT OFF 
GO
ALTER DATABASE [Project_PRJ301_Group5_Booking_Room_Hotel] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Project_PRJ301_Group5_Booking_Room_Hotel] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Project_PRJ301_Group5_Booking_Room_Hotel] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Project_PRJ301_Group5_Booking_Room_Hotel] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Project_PRJ301_Group5_Booking_Room_Hotel] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Project_PRJ301_Group5_Booking_Room_Hotel] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Project_PRJ301_Group5_Booking_Room_Hotel] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Project_PRJ301_Group5_Booking_Room_Hotel] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Project_PRJ301_Group5_Booking_Room_Hotel] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Project_PRJ301_Group5_Booking_Room_Hotel] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Project_PRJ301_Group5_Booking_Room_Hotel] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Project_PRJ301_Group5_Booking_Room_Hotel] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Project_PRJ301_Group5_Booking_Room_Hotel] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Project_PRJ301_Group5_Booking_Room_Hotel] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Project_PRJ301_Group5_Booking_Room_Hotel] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Project_PRJ301_Group5_Booking_Room_Hotel] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Project_PRJ301_Group5_Booking_Room_Hotel] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Project_PRJ301_Group5_Booking_Room_Hotel] SET RECOVERY FULL 
GO
ALTER DATABASE [Project_PRJ301_Group5_Booking_Room_Hotel] SET  MULTI_USER 
GO
ALTER DATABASE [Project_PRJ301_Group5_Booking_Room_Hotel] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Project_PRJ301_Group5_Booking_Room_Hotel] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Project_PRJ301_Group5_Booking_Room_Hotel] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Project_PRJ301_Group5_Booking_Room_Hotel] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Project_PRJ301_Group5_Booking_Room_Hotel] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Project_PRJ301_Group5_Booking_Room_Hotel] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Project_PRJ301_Group5_Booking_Room_Hotel', N'ON'
GO
ALTER DATABASE [Project_PRJ301_Group5_Booking_Room_Hotel] SET QUERY_STORE = ON
GO
ALTER DATABASE [Project_PRJ301_Group5_Booking_Room_Hotel] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Project_PRJ301_Group5_Booking_Room_Hotel]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 10/29/2024 7:47:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[DiscountID] [nvarchar](50) NOT NULL,
	[DiscountName] [nvarchar](255) NULL,
	[DiscountValue] [float] NULL,
	[DiscountStartDate] [date] NULL,
	[DiscountEndDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[DiscountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Guest]    Script Date: 10/29/2024 7:47:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guest](
	[GuestID] [nvarchar](50) NOT NULL,
	[FullName] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Password] [nvarchar](255) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[Gender] [bit] NULL,
	[DOB] [date] NULL,
	[Address] [nvarchar](255) NULL,
	[ImageLink] [nvarchar](255) NULL,
	[Provider] [nvarchar](255) NULL,
	[ProviderUserID] [nvarchar](max) NULL,
	[CreatedAt] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[GuestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 10/29/2024 7:47:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[HotelCode] [nvarchar](50) NOT NULL,
	[ReviewHotelID] [nvarchar](50) NULL,
	[HotelName] [nvarchar](100) NULL,
	[Address] [nvarchar](255) NULL,
	[NumberRooms] [int] NULL,
	[PhoneNumber] [nvarchar](15) NULL,
	[ImageBackgroundHotel] [nvarchar](255) NULL,
	[AddressURL] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[HotelCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReviewHotel]    Script Date: 10/29/2024 7:47:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReviewHotel](
	[ReviewHotelID] [nvarchar](50) NOT NULL,
	[GuestID] [nvarchar](50) NULL,
	[StarRating] [int] NULL,
	[Comment] [text] NULL,
	[ReviewDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReviewHotelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 10/29/2024 7:47:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[RoomNo] [nvarchar](50) NOT NULL,
	[RoomTypeID] [nvarchar](50) NULL,
	[HotelCode] [nvarchar](50) NULL,
	[ImageBackground] [nvarchar](255) NULL,
	[Amenities] [nvarchar](255) NULL,
	[Available] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[RoomNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomImage]    Script Date: 10/29/2024 7:47:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomImage](
	[RoomImageID] [nvarchar](50) NOT NULL,
	[RoomNo] [nvarchar](50) NULL,
	[ImageURL] [nvarchar](255) NULL,
	[ImageTitle] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoomImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomType]    Script Date: 10/29/2024 7:47:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomType](
	[RoomTypeID] [nvarchar](50) NOT NULL,
	[RoomType] [nvarchar](50) NULL,
	[RoomPrice] [float] NULL,
	[DefaultRoomPrice] [float] NULL,
	[Occupancy] [int] NULL,
	[RoomDescription] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoomTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Discount] ([DiscountID], [DiscountName], [DiscountValue], [DiscountStartDate], [DiscountEndDate]) VALUES (N'1', N'New Year', 15, CAST(N'2024-01-01' AS Date), CAST(N'2024-01-10' AS Date))
GO
INSERT [dbo].[Discount] ([DiscountID], [DiscountName], [DiscountValue], [DiscountStartDate], [DiscountEndDate]) VALUES (N'10', N'Spring Sale', 15, CAST(N'2024-03-01' AS Date), CAST(N'2024-03-10' AS Date))
GO
INSERT [dbo].[Discount] ([DiscountID], [DiscountName], [DiscountValue], [DiscountStartDate], [DiscountEndDate]) VALUES (N'2', N'Black Friday', 20, CAST(N'2024-11-25' AS Date), CAST(N'2024-11-30' AS Date))
GO
INSERT [dbo].[Discount] ([DiscountID], [DiscountName], [DiscountValue], [DiscountStartDate], [DiscountEndDate]) VALUES (N'3', N'Christmas', 25, CAST(N'2024-12-24' AS Date), CAST(N'2024-12-26' AS Date))
GO
INSERT [dbo].[Discount] ([DiscountID], [DiscountName], [DiscountValue], [DiscountStartDate], [DiscountEndDate]) VALUES (N'4', N'Easter', 10, CAST(N'2024-04-15' AS Date), CAST(N'2024-04-20' AS Date))
GO
INSERT [dbo].[Discount] ([DiscountID], [DiscountName], [DiscountValue], [DiscountStartDate], [DiscountEndDate]) VALUES (N'5', N'Summer Sale', 30, CAST(N'2024-06-01' AS Date), CAST(N'2024-06-15' AS Date))
GO
INSERT [dbo].[Discount] ([DiscountID], [DiscountName], [DiscountValue], [DiscountStartDate], [DiscountEndDate]) VALUES (N'6', N'Winter Sale', 10, CAST(N'2024-12-01' AS Date), CAST(N'2024-12-15' AS Date))
GO
INSERT [dbo].[Discount] ([DiscountID], [DiscountName], [DiscountValue], [DiscountStartDate], [DiscountEndDate]) VALUES (N'7', N'Valentine', 5, CAST(N'2024-02-14' AS Date), CAST(N'2024-02-15' AS Date))
GO
INSERT [dbo].[Discount] ([DiscountID], [DiscountName], [DiscountValue], [DiscountStartDate], [DiscountEndDate]) VALUES (N'8', N'Back to School', 20, CAST(N'2024-09-01' AS Date), CAST(N'2024-09-05' AS Date))
GO
INSERT [dbo].[Discount] ([DiscountID], [DiscountName], [DiscountValue], [DiscountStartDate], [DiscountEndDate]) VALUES (N'9', N'Thanksgiving', 10, CAST(N'2024-11-24' AS Date), CAST(N'2024-11-27' AS Date))
GO
INSERT [dbo].[Guest] ([GuestID], [FullName], [Email], [Password], [PhoneNumber], [Gender], [DOB], [Address], [ImageLink], [Provider], [ProviderUserID], [CreatedAt]) VALUES (N'1', N'Alice Johnson', N'alice.j@example.com', N'password1', N'123456789', 1, CAST(N'1990-01-01' AS Date), N'123 Main St', N'room1.jpg', N'Google', N'1001', CAST(N'2024-10-26' AS Date))
GO
INSERT [dbo].[Guest] ([GuestID], [FullName], [Email], [Password], [PhoneNumber], [Gender], [DOB], [Address], [ImageLink], [Provider], [ProviderUserID], [CreatedAt]) VALUES (N'10', N'Jack Brown', N'jack.b@example.com', N'password10', N'888999000', 1, CAST(N'1986-10-20' AS Date), N'321 Walnut St', N'room10.jpg', N'Facebook', N'1010', CAST(N'2024-10-26' AS Date))
GO
INSERT [dbo].[Guest] ([GuestID], [FullName], [Email], [Password], [PhoneNumber], [Gender], [DOB], [Address], [ImageLink], [Provider], [ProviderUserID], [CreatedAt]) VALUES (N'11', N'Nguyen Huy Hoang', N'huyhoang23112004ct@gmail.com', N'$2a$10$bb7aO6eG26/mwfaIXgBAouSF0qOymaezmBCB46zx0OFMaDiK3WBGm', NULL, 0, NULL, NULL, NULL, N'Email, Google', N'102878138303711076324', CAST(N'2024-10-27' AS Date))
GO
INSERT [dbo].[Guest] ([GuestID], [FullName], [Email], [Password], [PhoneNumber], [Gender], [DOB], [Address], [ImageLink], [Provider], [ProviderUserID], [CreatedAt]) VALUES (N'12', N'Nguyen Huy Hoang (K18 CT)', N'hoangnhce182102@fpt.edu.vn', NULL, NULL, 0, NULL, NULL, N'https://lh3.googleusercontent.com/a/ACg8ocLsjxpSUZ4b5lIFpEvlUtjZw07fFlWXEWEIDJflMUd4V7vJ85A=s96-c', N'Google', N'100840427574626550071', NULL)
GO
INSERT [dbo].[Guest] ([GuestID], [FullName], [Email], [Password], [PhoneNumber], [Gender], [DOB], [Address], [ImageLink], [Provider], [ProviderUserID], [CreatedAt]) VALUES (N'13', N'Huy Hoàng', N'Facebook_1714416579315113', NULL, NULL, 0, NULL, NULL, NULL, N'Facebook', N'1714416579315113', CAST(N'2024-10-27' AS Date))
GO
INSERT [dbo].[Guest] ([GuestID], [FullName], [Email], [Password], [PhoneNumber], [Gender], [DOB], [Address], [ImageLink], [Provider], [ProviderUserID], [CreatedAt]) VALUES (N'2', N'Bob Smith', N'bob.s@example.com', N'password2', N'987654321', 1, CAST(N'1985-02-15' AS Date), N'456 Oak St', N'room2.jpg', N'Facebook', N'1002', CAST(N'2024-10-26' AS Date))
GO
INSERT [dbo].[Guest] ([GuestID], [FullName], [Email], [Password], [PhoneNumber], [Gender], [DOB], [Address], [ImageLink], [Provider], [ProviderUserID], [CreatedAt]) VALUES (N'3', N'Charlie Brown', N'charlie.b@example.com', N'password3', N'555444333', 1, CAST(N'1992-03-10' AS Date), N'789 Pine St', N'room3.jpg', N'Google', N'1003', CAST(N'2024-10-26' AS Date))
GO
INSERT [dbo].[Guest] ([GuestID], [FullName], [Email], [Password], [PhoneNumber], [Gender], [DOB], [Address], [ImageLink], [Provider], [ProviderUserID], [CreatedAt]) VALUES (N'4', N'David White', N'david.w@example.com', N'password4', N'444555666', 1, CAST(N'1988-04-20' AS Date), N'321 Maple St', N'room4.jpg', N'Facebook', N'1004', CAST(N'2024-10-26' AS Date))
GO
INSERT [dbo].[Guest] ([GuestID], [FullName], [Email], [Password], [PhoneNumber], [Gender], [DOB], [Address], [ImageLink], [Provider], [ProviderUserID], [CreatedAt]) VALUES (N'5', N'Eve Black', N'eve.b@example.com', N'password5', N'222333444', 0, CAST(N'1995-05-25' AS Date), N'654 Cedar St', N'room5.jpg', N'Google', N'1005', CAST(N'2024-10-26' AS Date))
GO
INSERT [dbo].[Guest] ([GuestID], [FullName], [Email], [Password], [PhoneNumber], [Gender], [DOB], [Address], [ImageLink], [Provider], [ProviderUserID], [CreatedAt]) VALUES (N'6', N'Frank Green', N'frank.g@example.com', N'password6', N'333222111', 1, CAST(N'1991-06-30' AS Date), N'987 Elm St', N'room6.jpg', N'Facebook', N'1006', CAST(N'2024-10-26' AS Date))
GO
INSERT [dbo].[Guest] ([GuestID], [FullName], [Email], [Password], [PhoneNumber], [Gender], [DOB], [Address], [ImageLink], [Provider], [ProviderUserID], [CreatedAt]) VALUES (N'7', N'Grace Miller', N'grace.m@example.com', N'password7', N'666555444', 0, CAST(N'1989-07-15' AS Date), N'123 Birch St', N'room7.jpg', N'Google', N'1007', CAST(N'2024-10-26' AS Date))
GO
INSERT [dbo].[Guest] ([GuestID], [FullName], [Email], [Password], [PhoneNumber], [Gender], [DOB], [Address], [ImageLink], [Provider], [ProviderUserID], [CreatedAt]) VALUES (N'8', N'Hank Davis', N'hank.d@example.com', N'password8', N'777888999', 1, CAST(N'1987-08-05' AS Date), N'456 Fir St', N'room8.jpg', N'Facebook', N'1008', CAST(N'2024-10-26' AS Date))
GO
INSERT [dbo].[Guest] ([GuestID], [FullName], [Email], [Password], [PhoneNumber], [Gender], [DOB], [Address], [ImageLink], [Provider], [ProviderUserID], [CreatedAt]) VALUES (N'9', N'Ivy Lee', N'ivy.l@example.com', N'password9', N'111222333', 0, CAST(N'1993-09-10' AS Date), N'789 Spruce St', N'room9.jpg', N'Google', N'1009', CAST(N'2024-10-26' AS Date))
GO
INSERT [dbo].[Hotel] ([HotelCode], [ReviewHotelID], [HotelName], [Address], [NumberRooms], [PhoneNumber], [ImageBackgroundHotel], [AddressURL]) VALUES (N'1', N'1', N'Hotel A', N'123 Main St', 50, N'123456789', N'room1.jpg', NULL)
GO
INSERT [dbo].[Hotel] ([HotelCode], [ReviewHotelID], [HotelName], [Address], [NumberRooms], [PhoneNumber], [ImageBackgroundHotel], [AddressURL]) VALUES (N'10', N'10', N'Hotel J', N'321 Walnut St', 95, N'888999000', N'room10.jpg', NULL)
GO
INSERT [dbo].[Hotel] ([HotelCode], [ReviewHotelID], [HotelName], [Address], [NumberRooms], [PhoneNumber], [ImageBackgroundHotel], [AddressURL]) VALUES (N'2', N'2', N'Hotel B', N'456 Oak St', 75, N'987654321', N'room2.jpg', NULL)
GO
INSERT [dbo].[Hotel] ([HotelCode], [ReviewHotelID], [HotelName], [Address], [NumberRooms], [PhoneNumber], [ImageBackgroundHotel], [AddressURL]) VALUES (N'3', N'3', N'Hotel C', N'789 Pine St', 100, N'555444333', N'room3.jpg', NULL)
GO
INSERT [dbo].[Hotel] ([HotelCode], [ReviewHotelID], [HotelName], [Address], [NumberRooms], [PhoneNumber], [ImageBackgroundHotel], [AddressURL]) VALUES (N'4', N'4', N'Hotel D', N'321 Maple St', 60, N'444555666', N'room4.jpg', NULL)
GO
INSERT [dbo].[Hotel] ([HotelCode], [ReviewHotelID], [HotelName], [Address], [NumberRooms], [PhoneNumber], [ImageBackgroundHotel], [AddressURL]) VALUES (N'5', N'5', N'Hotel E', N'654 Cedar St', 80, N'222333444', N'room5.jpg', NULL)
GO
INSERT [dbo].[Hotel] ([HotelCode], [ReviewHotelID], [HotelName], [Address], [NumberRooms], [PhoneNumber], [ImageBackgroundHotel], [AddressURL]) VALUES (N'6', N'6', N'Hotel F', N'987 Elm St', 90, N'333222111', N'room6.jpg', NULL)
GO
INSERT [dbo].[Hotel] ([HotelCode], [ReviewHotelID], [HotelName], [Address], [NumberRooms], [PhoneNumber], [ImageBackgroundHotel], [AddressURL]) VALUES (N'7', N'7', N'Hotel G', N'123 Birch St', 70, N'666555444', N'room7.jpg', NULL)
GO
INSERT [dbo].[Hotel] ([HotelCode], [ReviewHotelID], [HotelName], [Address], [NumberRooms], [PhoneNumber], [ImageBackgroundHotel], [AddressURL]) VALUES (N'8', N'8', N'Hotel H', N'456 Fir St', 120, N'777888999', N'room8.jpg', NULL)
GO
INSERT [dbo].[Hotel] ([HotelCode], [ReviewHotelID], [HotelName], [Address], [NumberRooms], [PhoneNumber], [ImageBackgroundHotel], [AddressURL]) VALUES (N'9', N'9', N'Hotel I', N'789 Spruce St', 110, N'111222333', N'room9.jpg', NULL)
GO
INSERT [dbo].[ReviewHotel] ([ReviewHotelID], [GuestID], [StarRating], [Comment], [ReviewDate]) VALUES (N'1', N'1', 1, N'Excellent service and clean rooms!', CAST(N'2024-01-01' AS Date))
GO
INSERT [dbo].[ReviewHotel] ([ReviewHotelID], [GuestID], [StarRating], [Comment], [ReviewDate]) VALUES (N'10', N'10', 4, N'Clean and comfortable stay.', CAST(N'2024-10-20' AS Date))
GO
INSERT [dbo].[ReviewHotel] ([ReviewHotelID], [GuestID], [StarRating], [Comment], [ReviewDate]) VALUES (N'2', N'2', 2, N'Great hotel, will visit again.', CAST(N'2024-02-15' AS Date))
GO
INSERT [dbo].[ReviewHotel] ([ReviewHotelID], [GuestID], [StarRating], [Comment], [ReviewDate]) VALUES (N'3', N'3', 3, N'Good, but could improve room service.', CAST(N'2024-03-10' AS Date))
GO
INSERT [dbo].[ReviewHotel] ([ReviewHotelID], [GuestID], [StarRating], [Comment], [ReviewDate]) VALUES (N'4', N'4', 4, N'Amazing stay, highly recommended!', CAST(N'2024-04-20' AS Date))
GO
INSERT [dbo].[ReviewHotel] ([ReviewHotelID], [GuestID], [StarRating], [Comment], [ReviewDate]) VALUES (N'5', N'5', 5, N'Nice hotel with friendly staff.', CAST(N'2024-05-25' AS Date))
GO
INSERT [dbo].[ReviewHotel] ([ReviewHotelID], [GuestID], [StarRating], [Comment], [ReviewDate]) VALUES (N'6', N'6', 3, N'Average experience, room was okay.', CAST(N'2024-06-30' AS Date))
GO
INSERT [dbo].[ReviewHotel] ([ReviewHotelID], [GuestID], [StarRating], [Comment], [ReviewDate]) VALUES (N'7', N'7', 5, N'Loved the ambiance and food.', CAST(N'2024-07-15' AS Date))
GO
INSERT [dbo].[ReviewHotel] ([ReviewHotelID], [GuestID], [StarRating], [Comment], [ReviewDate]) VALUES (N'8', N'8', 4, N'Good value for money.', CAST(N'2024-08-05' AS Date))
GO
INSERT [dbo].[ReviewHotel] ([ReviewHotelID], [GuestID], [StarRating], [Comment], [ReviewDate]) VALUES (N'9', N'9', 5, N'Fantastic location and service.', CAST(N'2024-09-10' AS Date))
GO
INSERT [dbo].[Room] ([RoomNo], [RoomTypeID], [HotelCode], [ImageBackground], [Amenities], [Available]) VALUES (N'R001', N'1', N'1', N'room1.jpg', N'Wi-Fi, TV, AC', 1)
GO
INSERT [dbo].[Room] ([RoomNo], [RoomTypeID], [HotelCode], [ImageBackground], [Amenities], [Available]) VALUES (N'R002', N'2', N'2', N'room2.jpg', N'Wi-Fi, TV, AC', 1)
GO
INSERT [dbo].[Room] ([RoomNo], [RoomTypeID], [HotelCode], [ImageBackground], [Amenities], [Available]) VALUES (N'R003', N'3', N'3', N'room3.jpg', N'Wi-Fi, TV, AC', 1)
GO
INSERT [dbo].[Room] ([RoomNo], [RoomTypeID], [HotelCode], [ImageBackground], [Amenities], [Available]) VALUES (N'R004', N'4', N'4', N'room4.jpg', N'Wi-Fi, TV, AC', 0)
GO
INSERT [dbo].[Room] ([RoomNo], [RoomTypeID], [HotelCode], [ImageBackground], [Amenities], [Available]) VALUES (N'R005', N'5', N'5', N'room5.jpg', N'Wi-Fi, TV, AC', 1)
GO
INSERT [dbo].[Room] ([RoomNo], [RoomTypeID], [HotelCode], [ImageBackground], [Amenities], [Available]) VALUES (N'R006', N'6', N'6', N'room6.jpg', N'Wi-Fi, TV, AC', 0)
GO
INSERT [dbo].[Room] ([RoomNo], [RoomTypeID], [HotelCode], [ImageBackground], [Amenities], [Available]) VALUES (N'R007', N'7', N'7', N'room7.jpg', N'Wi-Fi, TV, AC', 1)
GO
INSERT [dbo].[Room] ([RoomNo], [RoomTypeID], [HotelCode], [ImageBackground], [Amenities], [Available]) VALUES (N'R008', N'8', N'8', N'room8.jpg', N'Wi-Fi, TV, AC', 0)
GO
INSERT [dbo].[Room] ([RoomNo], [RoomTypeID], [HotelCode], [ImageBackground], [Amenities], [Available]) VALUES (N'R009', N'9', N'9', N'room9.jpg', N'Wi-Fi, TV, AC', 1)
GO
INSERT [dbo].[Room] ([RoomNo], [RoomTypeID], [HotelCode], [ImageBackground], [Amenities], [Available]) VALUES (N'R010', N'10', N'10', N'room10.jpg', N'Wi-Fi, TV, AC', 1)
GO
INSERT [dbo].[RoomImage] ([RoomImageID], [RoomNo], [ImageURL], [ImageTitle]) VALUES (N'1', N'R001', N'room1.jpg', N'Room Image 1')
GO
INSERT [dbo].[RoomImage] ([RoomImageID], [RoomNo], [ImageURL], [ImageTitle]) VALUES (N'10', N'R010', N'room10.jpg', N'Room Image 10')
GO
INSERT [dbo].[RoomImage] ([RoomImageID], [RoomNo], [ImageURL], [ImageTitle]) VALUES (N'2', N'R002', N'room2.jpg', N'Room Image 2')
GO
INSERT [dbo].[RoomImage] ([RoomImageID], [RoomNo], [ImageURL], [ImageTitle]) VALUES (N'3', N'R003', N'room3.jpg', N'Room Image 3')
GO
INSERT [dbo].[RoomImage] ([RoomImageID], [RoomNo], [ImageURL], [ImageTitle]) VALUES (N'4', N'R004', N'room4.jpg', N'Room Image 4')
GO
INSERT [dbo].[RoomImage] ([RoomImageID], [RoomNo], [ImageURL], [ImageTitle]) VALUES (N'5', N'R005', N'room5.jpg', N'Room Image 5')
GO
INSERT [dbo].[RoomImage] ([RoomImageID], [RoomNo], [ImageURL], [ImageTitle]) VALUES (N'6', N'R006', N'room6.jpg', N'Room Image 6')
GO
INSERT [dbo].[RoomImage] ([RoomImageID], [RoomNo], [ImageURL], [ImageTitle]) VALUES (N'7', N'R007', N'room7.jpg', N'Room Image 7')
GO
INSERT [dbo].[RoomImage] ([RoomImageID], [RoomNo], [ImageURL], [ImageTitle]) VALUES (N'8', N'R008', N'room8.jpg', N'Room Image 8')
GO
INSERT [dbo].[RoomImage] ([RoomImageID], [RoomNo], [ImageURL], [ImageTitle]) VALUES (N'9', N'R009', N'room9.jpg', N'Room Image 9')
GO
INSERT [dbo].[RoomType] ([RoomTypeID], [RoomType], [RoomPrice], [DefaultRoomPrice], [Occupancy], [RoomDescription]) VALUES (N'1', N'Single', 5535430, 6035353, 1, N'Single room with one bed')
GO
INSERT [dbo].[RoomType] ([RoomTypeID], [RoomType], [RoomPrice], [DefaultRoomPrice], [Occupancy], [RoomDescription]) VALUES (N'10', N'Studio', 905354, 11035435, 2, N'Studio room with kitchen facilities')
GO
INSERT [dbo].[RoomType] ([RoomTypeID], [RoomType], [RoomPrice], [DefaultRoomPrice], [Occupancy], [RoomDescription]) VALUES (N'2', N'Double', 7535453, 8553545, 2, N'Double room with two beds')
GO
INSERT [dbo].[RoomType] ([RoomTypeID], [RoomType], [RoomPrice], [DefaultRoomPrice], [Occupancy], [RoomDescription]) VALUES (N'3', N'Suite', 12053543, 1405354, 2, N'Suite room with luxury facilities')
GO
INSERT [dbo].[RoomType] ([RoomTypeID], [RoomType], [RoomPrice], [DefaultRoomPrice], [Occupancy], [RoomDescription]) VALUES (N'4', N'Deluxe', 10053543, 1203543, 3, N'Deluxe room with modern amenities')
GO
INSERT [dbo].[RoomType] ([RoomTypeID], [RoomType], [RoomPrice], [DefaultRoomPrice], [Occupancy], [RoomDescription]) VALUES (N'5', N'Family', 15035435, 18053543, 4, N'Family room with multiple beds')
GO
INSERT [dbo].[RoomType] ([RoomTypeID], [RoomType], [RoomPrice], [DefaultRoomPrice], [Occupancy], [RoomDescription]) VALUES (N'6', N'Executive', 2003545, 2503543, 2, N'Executive room with workspace')
GO
INSERT [dbo].[RoomType] ([RoomTypeID], [RoomType], [RoomPrice], [DefaultRoomPrice], [Occupancy], [RoomDescription]) VALUES (N'7', N'Presidential', 3003543, 3503543, 4, N'Presidential suite with premium services')
GO
INSERT [dbo].[RoomType] ([RoomTypeID], [RoomType], [RoomPrice], [DefaultRoomPrice], [Occupancy], [RoomDescription]) VALUES (N'8', N'Standard', 8035435, 1005354, 2, N'Standard room with basic amenities')
GO
INSERT [dbo].[RoomType] ([RoomTypeID], [RoomType], [RoomPrice], [DefaultRoomPrice], [Occupancy], [RoomDescription]) VALUES (N'9', N'Luxury', 25035435, 3003543, 2, N'Luxury room with premium features')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Guest__A9D10534DBA094CF]    Script Date: 10/29/2024 7:47:40 PM ******/
ALTER TABLE [dbo].[Guest] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_ReviewHotelID] FOREIGN KEY([ReviewHotelID])
REFERENCES [dbo].[ReviewHotel] ([ReviewHotelID])
GO
ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK_Hotel_ReviewHotelID]
GO
ALTER TABLE [dbo].[ReviewHotel]  WITH CHECK ADD  CONSTRAINT [FK_ReviewHotel_GuestID] FOREIGN KEY([GuestID])
REFERENCES [dbo].[Guest] ([GuestID])
GO
ALTER TABLE [dbo].[ReviewHotel] CHECK CONSTRAINT [FK_ReviewHotel_GuestID]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_HotelCode] FOREIGN KEY([HotelCode])
REFERENCES [dbo].[Hotel] ([HotelCode])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_HotelCode]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_RoomTypeID] FOREIGN KEY([RoomTypeID])
REFERENCES [dbo].[RoomType] ([RoomTypeID])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_RoomTypeID]
GO
ALTER TABLE [dbo].[RoomImage]  WITH CHECK ADD  CONSTRAINT [FK_RoomImage_RoomNo] FOREIGN KEY([RoomNo])
REFERENCES [dbo].[Room] ([RoomNo])
GO
ALTER TABLE [dbo].[RoomImage] CHECK CONSTRAINT [FK_RoomImage_RoomNo]
GO
USE [master]
GO
ALTER DATABASE [Project_PRJ301_Group5_Booking_Room_Hotel] SET  READ_WRITE 
GO
