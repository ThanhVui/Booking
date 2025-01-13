-- Create Database and Table --
USE master;

-- Create the database
CREATE DATABASE Project_PRJ301_Group5_Booking_Room_Hotel;
GO

-- Use the database
USE Project_PRJ301_Group5_Booking_Room_Hotel;
GO

-- Create the Admin table TRUE
CREATE TABLE [Admin] (
  [AdminID] INT IDENTITY(1, 1) PRIMARY KEY,
  [FullName] NVARCHAR(100),
  [PhoneNo] NVARCHAR(15),
  [Email] NVARCHAR(100) NOT NULL,
  [Password] NVARCHAR(255),
  [CreateAt] DATE
);

-- Create the Guest table TRUE
CREATE TABLE [Guest] (
  [GuestID] INT IDENTITY(1, 1) PRIMARY KEY,
  [FullName] NVARCHAR(100),
  [Email] NVARCHAR(100) NOT NULL,
  [Password] NVARCHAR(255),
  [PhoneNumber] NVARCHAR(50),
  [Gender] NVARCHAR(50),
  [DOB] DATE,
  [Address] NVARCHAR(255),
  [ImageLink] NVARCHAR(255),
  [Provider] NVARCHAR(255),
  [ProviderUserID] NVARCHAR(MAX),
  [CreatedAt] DATE
);

-- Create the Discount table TRUE
CREATE TABLE [Discount] (
  [DiscountID] INT IDENTITY(1, 1) PRIMARY KEY,
  [DiscountName] NVARCHAR(255),
  [DiscountValue] FLOAT,
  [DiscountStartDate] DATE,
  [DiscountEndDate] DATE
);

-- Create the RoomType table TRUE
CREATE TABLE [RoomType] (
  [RoomTypeID] INT IDENTITY(1, 1) PRIMARY KEY,
  [RoomType] NVARCHAR(50),
  [RoomPrice] FLOAT,
  [DefaultRoomPrice] FLOAT,
  [Occupancy] INT,
  [RoomDescription] NVARCHAR(MAX)
);

-- Create the Hotel table TRUE
CREATE TABLE [Hotel] (
  [HotelCode] INT IDENTITY(1, 1) PRIMARY KEY,
  [HotelName] NVARCHAR(100),
  [Address] NVARCHAR(255),
  [AddressURL] NVARCHAR(MAX),
  [NumberRooms] INT,
  [PhoneNumber] NVARCHAR(15),
  [ImageBackgroundHotel] NVARCHAR(255)
);

-- Create the ReviewHotel table TRUE
CREATE TABLE [ReviewHotel] (
  [ReviewHotelID] INT IDENTITY(1, 1) PRIMARY KEY,
  [HotelCode] INT,
  [GuestID] INT,
  [StarRating] INT,
  [Comment] TEXT,
  [ReviewDate] DATE,
  CONSTRAINT FK_ReviewHotel_GuestID FOREIGN KEY ([GuestID]) REFERENCES [Guest]([GuestID]),
  CONSTRAINT FK_ReviewHotel_HotelCode FOREIGN KEY ([HotelCode]) REFERENCES [Hotel]([HotelCode])
);

-- Create the Room table TRUE
CREATE TABLE [Room] (
  [RoomNo] NVARCHAR(50) PRIMARY KEY,
  [RoomTypeID] INT,
  [HotelCode] INT,	
  [ImageBackground] NVARCHAR(255),
  [Amenities] NVARCHAR(255),
  [Available] BIT,
  CONSTRAINT FK_Room_HotelCode FOREIGN KEY ([HotelCode]) REFERENCES [Hotel]([HotelCode]),
  CONSTRAINT FK_Room_RoomTypeID FOREIGN KEY ([RoomTypeID]) REFERENCES [RoomType]([RoomTypeID])
);

-- Create the RoomImage table TRUE
CREATE TABLE [RoomImage] (
  [RoomImageID] INT IDENTITY(1, 1) PRIMARY KEY,
  [RoomNo] NVARCHAR(50),
  [ImageURL] NVARCHAR(255),
  [ImageTitle] NVARCHAR(255),
  CONSTRAINT FK_RoomImage_RoomNo FOREIGN KEY ([RoomNo]) REFERENCES [Room]([RoomNo])
);

-- Create the Booking table TRUE
CREATE TABLE [Booking] (
  [BookingID] INT IDENTITY(1, 1) PRIMARY KEY,
  [GuestID] INT,
  [RoomNo] NVARCHAR(50),
  [DiscountID] INT,
  [CheckInDate] DATE,
  [CheckOutDate] DATE,
  [NumberAdults] INT,
  [NumberChildrens] INT,
  [BookingStatus] BIT,
  CONSTRAINT FK_Booking_GuestID FOREIGN KEY ([GuestID]) REFERENCES [Guest]([GuestID]),
  CONSTRAINT FK_Booking_DiscountID FOREIGN KEY ([DiscountID]) REFERENCES [Discount]([DiscountID]),
  CONSTRAINT FK_Booking_RoomNo FOREIGN KEY ([RoomNo]) REFERENCES [Room]([RoomNo])
);

-- Create the Bill table TRUE
CREATE TABLE [Bill] (
  [InvoiceNo] INT IDENTITY(1, 1) PRIMARY KEY,
  [GuestID] INT,
  [BookingID] INT,
  [TotalAmount] FLOAT,
  [PaymentDate] DATE,
  [PaymentStatus] BIT,
  CONSTRAINT FK_Bill_GuestID FOREIGN KEY ([GuestID]) REFERENCES [Guest]([GuestID]),
  CONSTRAINT FK_Bill_BookingID FOREIGN KEY ([BookingID]) REFERENCES [Booking]([BookingID])
);