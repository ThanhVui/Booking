-- Insert Into Admin --
INSERT INTO [Admin] ([FullName], [PhoneNo], [Email], [Password], [CreateAt]) 
VALUES
(N'Trần Quốc Khánh', '0987654321', 'quockhanh@example.com', 'Kh@nh2024!', '2024-08-03'),
(N'Nguyễn Thị Lan Hương', '0912345678', 'lanhuong@example.com', 'Hu*ong987$', '2024-08-12'),
(N'Phạm Hữu Nghĩa', '0909876543', 'huunghia@example.com', 'Ng^hia123#', '2024-08-27'),
(N'Bùi Minh Hoàng', '0934567890', 'minhhoang@example.com', 'Ho!ang567&', '2024-09-01'),
(N'Lê Thị Ngọc Mai', '0923456789', 'ngocmai@example.com', 'Ma!i4321$', '2024-09-08'),
(N'Trịnh Văn Hải', '0945678901', 'trinhhai@example.com', 'Ha&i2024!', '2024-09-12'),
(N'Doãn Phương Linh', '0956789012', 'phuonglinh@example.com', 'Li*nh654%', '2024-09-16'),
(N'Huỳnh Gia Bảo', '0967890123', 'giabao@example.com', 'Ba!o789&', '2024-08-25'),
(N'Nguyễn Thùy Dung', '0978901234', 'thuydung@example.com', 'Du*ng123$', '2024-09-20'),
(N'Võ Hoàng Yến', '0989012345', 'hoangyen@example.com', 'Ye@n4567#', '2024-09-27');

-- Insert Into Guest --
INSERT INTO [Guest] (FullName, Email, Password, PhoneNumber, Gender, DOB, Address, ImageLink, Provider, ProviderUserID, CreatedAt)
VALUES 
(N'Nguyễn Văn Bình', 'binh.nguyen@example.com', '$2a$12$pJnL36mjHZkEXxoqtOhN1OmG7iEM/zl.Ht0kFNOhj7x72gNOQw2em', '0909123456', 'Male', '1990-06-15', N'15 Trần Phú, Quận 1, TP. Hồ Chí Minh', NULL, 'Google', 'google_1', '2024-10-25'),
(N'Lê Thị Thanh Hằng', 'hang.le@example.com', '$2a$12$KgOE1kuZ9EVsUt2H3HLhyOGjDtGfT7Up/pEs.C04H/CxISOQYilmm', '0912345678', 'Female', '1995-02-20', N'22 Lý Thái Tổ, Quận 10, TP. Hồ Chí Minh', NULL, 'Facebook', 'fb_2', '2024-10-26'),
(N'Trần Quốc Anh', 'anh.tran@example.com', '$2a$12$VGbc6ZyiMzbmGZTnXPTcGuisHiFa6HQ3T6Jy8IaHNHEOo58Lunyu.', '0903345566', 'Male', '1987-08-01', N'50 Nguyễn Thị Minh Khai, Đà Nẵng', NULL, 'Google', 'google_3', '2024-10-27'),
(N'Phạm Thanh Trúc', 'truc.pham@example.com', '$2a$12$qS1guD9f9gYsZEoCMIUOR.JeHCW.xQi/RjlyIJJfLVAnenoaqcFU6', '0905671234', 'Female', '1998-12-31', N'32 Đinh Bộ Lĩnh, Thủ Đức, TP. Hồ Chí Minh', NULL, NULL, NULL, '2024-10-28'),
(N'Lê Minh Nhật', 'nhat.le@example.com', '$2a$12$DWYMHdHqx8Trw2iQuGKtkuwOvNZ4Q/HrKOzajnx2NAeoMTUmUN8x6', '0912556677', 'Male', '1993-03-14', N'123 Đường Xô Viết Nghệ Tĩnh, Cần Thơ', NULL, 'Google, Facebook', 'fb_google_5', '2024-10-29'),
(N'Ngô Thanh Hà', 'ha.ngo@example.com', '$2a$12$Vv/DmUfdukZL0F75UIYmJuuKZiCQkD6EdnqJ6gzD6kuhJqMm5cL9y', '0907888999', 'Female', '2001-04-21', N'99 Nguyễn Văn Trỗi, Phú Nhuận, TP. Hồ Chí Minh', NULL, 'Facebook', 'fb_6', '2024-10-30'),
(N'Võ Trung Hiếu', 'hieu.vo@example.com', '$2a$12$ra3N5ENEBpHom/kND3p3BuABs1.kKqBA.mxnWl9GAABobtsxeBvvu', '0911122233', 'Male', '1985-05-10', N'200 Đinh Tiên Hoàng, Quận Bình Thạnh, TP. Hồ Chí Minh', NULL, 'Google', 'google_7', '2024-10-31'),
(N'Nguyễn Hoàng Lan', 'lan.nguyen@example.com', '$2a$12$94cfCezSefyTmcCinmE3H.s5yJ12jnPpFVJK/H.oI8vrJn6SW6QXy', '0905566778', 'Female', '1999-07-05', N'75 Nguyễn Văn Linh, Đà Nẵng', NULL, NULL, NULL, '2024-11-01'),
(N'Đỗ Minh Phương', 'phuong.do@example.com', '$2a$12$ZPdrO4d2CIflRkpalL0I7uLTyLcOy11NA3.mvR8E9rS9XrFi0YqSm', '0906655444', 'Female', '2000-02-02', N'22 Phạm Ngũ Lão, Quận 1, TP. Hồ Chí Minh', NULL, 'Google', 'google_9', '2024-11-02'),
(N'Trần Đức Lộc', 'loc.tran@example.com', '$2a$12$GcTDHmBt31yLAKfVr6hj0ebs2ltAS/XcpOA2/aKlEZchdmLIVUD2K', '0911333444', 'Male', '1992-09-19', N'48 Bà Triệu, Quận Hoàn Kiếm, Hà Nội', NULL, 'Facebook', 'fb_10', '2024-11-03')

-- Insert Into [Discount] --
INSERT INTO [Discount] (DiscountName, DiscountValue, DiscountStartDate, DiscountEndDate)
VALUES 
('New Year Offer', 10, '2024-01-01', '2024-01-10'),
('Spring Sale', 15, '2024-03-01', '2024-03-15'),
('Summer Discount', 20, '2024-05-01', '2024-05-10'),
('Fall Special', 10, '2024-07-01', '2024-07-10'),
('Happy Sale', 12, '2024-09-25', '2024-09-30'),
('Black Friday', 25, '2024-11-20', '2024-11-25'),
('Holiday Season', 30, '2024-12-20', '2024-12-25'),
('Weekend Special', 10, '2024-02-01', '2024-02-05'),
('Flash Sale', 20, '2024-04-15', '2024-04-20'),
('Customer Appreciation', 18, '2024-06-01', '2024-06-05');

-- Insert Into RoomType --
INSERT INTO RoomType (RoomType, RoomPrice, DefaultRoomPrice, Occupancy, RoomDescription)
VALUES 
('Single', 503500.00, 5350.00, 1, 'A cozy single room equipped with essential amenities, providing a peaceful and comfortable stay for individual travelers or couples. Ideal for short stays, the room offers privacy and functionality, ensuring guests enjoy their time in a pleasant, well-organized space.'),
('Double', 35380.00, 35380.00, 2, 'This deluxe double room offers additional amenities for comfort, including a spacious seating area and modern decor. Perfect for couples or friends, it provides ample room to relax and unwind, enhancing the guest experience with thoughtful touches and convenient services.'),
('Family', 123540.00, 135420.00, 5, 'Ideal for families or groups, this expansive suite includes a separate living area and ample sleeping arrangements. With plenty of space to socialize and relax, it ensures everyone feels comfortable, enjoying both privacy and a welcoming atmosphere for shared moments.'),
('Penthouse', 103540.00, 135400.00, 4, 'Designed for larger families, this penthouse offers multiple beds and a spacious layout. With added luxury features and high-end finishes, it creates a comfortable and upscale environment for families traveling with children, combining elegance with functionality.'),
('Presidential', 43530.00, 43540.00, 2, 'This exclusive presidential room is designed with solo travelers in mind, offering a compact yet luxurious stay. Featuring premium amenities, it provides a sophisticated ambiance for a unique and tailored experience, ideal for business travelers or luxury seekers.'),
('Economy', 7035.00, 73530.00, 5, 'An affordable, cozy room with a double bed, the economy option is perfect for couples or budget-conscious travelers. Despite its simplicity, it offers all necessary amenities, ensuring a comfortable and enjoyable stay without compromising on quality.'),
('Suite', 15350.00, 13550.00, 3, 'A high-end executive suite featuring luxurious furnishings and a dedicated workspace, ideal for professionals and leisure travelers alike. With an elegant design, this suite provides both relaxation and functionality for those seeking a premium experience.'),
('Standard', 33500.00, 33500.00, 2, 'A refined standard room offering comfort and quality amenities, catering to solo travelers or couples. Its thoughtful design and cozy atmosphere make it ideal for guests who value a relaxing, stylish setting with everything needed for a pleasant stay.'),
('Deluxe', 353300.00, 33500.00, 2, 'This deluxe room combines luxury with functionality, offering premium services and exclusive access to hotel amenities. Spacious and elegantly designed, it provides a superior experience for guests looking for added comfort and sophistication during their stay.'),
('Standard', 334500.00, 33500.00, 2, 'A luxurious and well-appointed room that caters to guests seeking an elevated standard stay. With tasteful decor and a focus on comfort, it offers a serene and pleasant experience for couples or solo travelers seeking both relaxation and convenience.');

-- Insert Into [Hotel] --
INSERT INTO [Hotel] (HotelName, Address, AddressURL, NumberRooms, PhoneNumber, ImageBackgroundHotel)
VALUES
('CharmantSuites-ABoutiqueHotel', N'45 Ngo Quyen, Tan An, Ninh Kieu, TP Can Tho, Viet Nam', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3928.788465634771!2d105.78412637479404!3d10.034307190072843!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31a0637e1e27009b%3A0x5447432e8244062e!2zNDUgxJAuIE5nw7QgUXV54buBbiwgVMOibiBBbiwgTmluaCBLaeG7gXUsIEPhuqduIFRoxqEsIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1730460897017!5m2!1svi!2s', 120, '0911340330', 'Images/CharmantSuites-ABoutiqueHotel/Background/bghotel.jpg'),
('KPHotel', N'09 Nam Ky Khoi Nghia, phuong Tan An, quan Ninh Kieu, Can Tho, Viet Nam', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3928.820482015854!2d105.78370967479404!3d10.031668090075375!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31a0629f66227d0d%3A0x8e7a611617c70052!2zOSDEkC4gTmFtIEvhu7MgS2jhu59pIE5naMSpYSwgVMOibiBBbiwgTmluaCBLaeG7gXUsIEPhuqduIFRoxqEsIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1730462298749!5m2!1svi!2s', 150, '02923731313', 'Images/CharmantSuites-ABoutiqueHotel/Background/bghotel.jpg'),
('Lion11Hotel', N'31 Duong Chau Van Liem, Can Tho, Viet Nam', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3928.8316798974874!2d105.78379157479395!3d10.030744890076232!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31a0629f15dc96f5%3A0xc6802b007863d37b!2zMzEgxJDGsOG7nW5nIENow6J1IFbEg24gTGnDqm0sIEFuIEzhuqFjLCBOaW5oIEtp4buBdSwgQ-G6p24gVGjGoSwgVmnhu4d0IE5hbQ!5e0!3m2!1svi!2s!4v1730462340259!5m2!1svi!2s', 80, '0788857108', 'Images/Lion11Hotel/Background/bghotel.jpg'),
('MadellaHotel', N'48 Ngo Quyen, Can Tho, Viet Nam', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3928.8316798974874!2d105.78379157479395!3d10.030744890076232!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31a062a198fe5e29%3A0x5ac2bda1aeb51544!2zNDggxJAuIE5nw7QgUXV54buBbiwgVMOibiBBbiwgTmluaCBLaeG7gXUsIEPhuqduIFRoxqEgOTQxMTIsIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1730462371011!5m2!1svi!2s', 200, '0788857108', 'Images/MadellaHotel/Background/bghotel.jpg'),
('MuongThanhLuxuryHotel', N'Khu 1, Con Cai Khe, Phuong Cai Khe, Cai Khe, Ninh Kieu, Thanh pho Can Tho, Viet Nam', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3928.6891583609668!2d105.7877604747941!3d10.042488690065067!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31a063a1771a0823%3A0xa7fe937e43c2970c!2zS2jDoWNoIHPhuqFuIE3GsOG7nW5nIFRoYW5oIEx1eHVyeSBD4bqnbiBUaMah!5e0!3m2!1svi!2s!4v1730462438995!5m2!1svi!2s', 170, '02923688888', 'Images/MuongThanhLuxuryHotel/Background/bghotel.jpg'),
('RichHotel', N'86D Hung Vuong, Ninh Kieu District, Can Tho, Viet Nam', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3928.6860205896173!2d105.77548937479422!3d10.04274709006487!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31a0881cc4514fc7%3A0xb6ed1e0bd1c7349b!2zODZkIEjDuW5nIFbGsMahbmcsIEFuIEPGsCwgTmluaCBLaeG7gXUsIEPhuqduIFRoxqEsIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1730462494262!5m2!1svi!2s', 300, '0956789012', 'Images/RichHotel/Background/bghotel.jpg'),
('Sheraton', N'Number 209, 30/4 Road, Xuan Khanh Ward, Ninh Kieu District, Xuan Khanh, Ninh Kieu, TP Can Tho, Viet Nam', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d5996.563444128323!2d105.76999509797102!3d10.022741398333647!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31a08833f000f11f%3A0x7eabead940802b56!2zS2jDoWNoIHPhuqFuIFNoZXJhdG9uIEPhuqduIFRoxqE!5e0!3m2!1svi!2s!4v1730462541368!5m2!1svi!2s', 50, '0967890123', 'Images/Sheraton/Background/bghotel.jpg'),
('TulipHotel', N'D5/10 + D5/11, duong so 2, Khu dan cu Long Thinh phuong Phu Thu, quan Cai Rang, Can Tho, Viet Nam', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3929.172167691739!2d105.79627277479358!3d10.002633390102885!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31a062643afdab37%3A0xb538553e184dbbb!2zVHVsaXAgSG90ZWwgQ2FuIFRobyAoS2jDoWNoIHPhuqFuIFR1bGlwIEPhuqduIFRoxqEp!5e0!3m2!1svi!2s!4v1730462580739!5m2!1svi!2s', 250, '0978901234', 'Images/TulipHotel/Background/bghotel.jpg'),
('V_LunaHotel', N'19-D3, Tran Quang Khai, Cai Khe, Ninh Kieu, Can Tho, Cai Khe, Ninh Kieu, Thanh pho Can Tho', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3928.666785422349!2d105.78013087479427!3d10.044330990063376!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31a062a81a42108b%3A0x56ede3841043b365!2zMTkgVHLhuqduIFF1YW5nIEto4bqjaSwgQW4gSOG7mWksIE5pbmggS2nhu4F1LCBD4bqnbiBUaMahLCBWaeG7h3QgTmFt!5e0!3m2!1svi!2s!4v1730462610317!5m2!1svi!2s', 180, '0989012345', 'Images/V_LunaHotel/Background/bghotel.jpg'),
('WinkHotel', N'14 Phan Dinh Phung, Tan An, Ninh Kieu, TP Can Tho, Viet Nam.', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3928.803635967499!2d105.78417387479399!3d10.033056790074003!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31a062a197f37301%3A0xcecb645e0616ce3e!2zMTQgUGhhbiDEkMOsbmggUGjDuW5nLCBUw6JuIEFuLCBOaW5oIEtp4buBdSwgQ-G6p24gVGjGoSwgVmnhu4d0IE5hbQ!5e0!3m2!1svi!2s!4v1730462716773!5m2!1svi!2s', 90, '0990123456', 'Images/WinkHotel/Background/bghotel.jpg');

-- Insert Into [ReviewHotel] --
INSERT INTO [ReviewHotel] ([HotelCode], [GuestID], [StarRating], [Comment], [ReviewDate]) 
VALUES
(1, 1, 5, N'I had a very good experience at this hotel. The breakfast was delightful.', '2024-09-15'),
(1, 2, 4, N'I had a very good experience at this hotel. The breakfast was delightful.', '2024-09-20'),
(1, 3, 3, N'I had a very good experience at this hotel. The breakfast was delightful.', '2024-09-25'),
(1, 4, 5, N'This is one of the best places I have stayed! The service was exceptional.', '2024-10-01'),
(1, 2, 2, N'This is one of the best places I have stayed! The service was exceptional', '2024-10-10'),
(1, 1, 4, N'I loved the atmosphere here. A perfect place for relaxation.', '2024-10-15'),
(1, 7, 5, N'I loved the atmosphere here. A perfect place for relaxation.', '2024-10-20'),
(1, 8, 3, N'Khách sạn có vị trí tốt, nhưng cần cải thiện chất lượng giường ngủ.', '2024-10-25'),
(1, 9, 4, N'Rất hài lòng với chuyến đi này.', '2024-11-05'),
(1, 4, 5, N'A wonderful experience, I would highly recommend this hotel!', '2024-11-10'),

(2, 1, 4, N'Khách sạn đẹp, dịch vụ tốt.', '2024-09-12'),
(2, 1, 5, N'I had a great time here. The staff were very accommodating.', '2024-09-18'),
(2, 7, 3, N'Chỗ ở khá ổn, nhưng cần bảo trì phòng nhiều hơn.', '2024-09-22'),
(2, 3, 5, N'This hotel is a great choice for my vacation!', '2024-09-30'),
(2, 4, 2, N'Phòng không sạch sẽ như mong đợi.', '2024-10-05'),
(2, 8, 4, N'I had a pleasant stay overall.', '2024-10-10'),
(2, 5, 5, N'Tôi sẽ trở lại nơi này trong tương lai!', '2024-10-15'),
(2, 2, 3, N'The location was perfect, but the room could use some upgrades.', '2024-10-20'),
(2, 4, 4, N'Khách sạn rất yên tĩnh, thích hợp để nghỉ ngơi.', '2024-11-01'),
(2, 3, 5, N'An unforgettable experience, I really enjoyed my stay.', '2024-11-05'),

(3, 9, 5, N'Một trải nghiệm tuyệt vời! Nhân viên rất nhiệt tình.', '2024-09-16'),
(3, 5, 4, N'I had a lovely time at this hotel. The pool area is amazing!', '2024-09-22'),
(3, 1, 3, N'Dịch vụ bình thường, cần cải thiện.', '2024-09-28'),
(3, 8, 5, N'Khách sạn rất sạch sẽ và thoải mái.', '2024-10-03'),
(3, 6, 2, N'I was disappointed with the cleanliness of the room.', '2024-10-08'),
(3, 4, 4, N'Một nơi lý tưởng để thư giãn!', '2024-10-14'),
(3, 4, 5, N'Tôi sẽ quay lại ngay khi có cơ hội!', '2024-10-20'),
(3, 4, 3, N'Cần nhiều sự cải thiện về dịch vụ.', '2024-10-25'),
(3, 2, 4, N'Khách sạn rất tốt, tôi sẽ giới thiệu cho bạn bè!', '2024-11-01'),
(3, 9, 5, N'Perfect getaway, loved every minute of my stay!', '2024-11-10'),

(4, 4, 5, N'Một nơi tuyệt vời cho kỳ nghỉ gia đình.', '2024-09-20'),
(4, 3, 4, N'The hotel had a wonderful ambiance and great service.', '2024-09-25'),
(4, 6, 3, N'Chỗ ở tương đối tốt, nhưng phòng cần cải thiện.', '2024-09-30'),
(4, 4, 5, N'Tôi đã có một trải nghiệm không thể quên.', '2024-10-05'),
(4, 1, 2, N'The food options were very limited, I expected better.', '2024-10-10'),
(4, 9, 4, N'Khách sạn rất đẹp và sạch sẽ.', '2024-10-15'),
(4, 1, 5, N'I would recommend this hotel to anyone!', '2024-10-20'),
(4, 8, 3, N'Phòng có thể được bảo trì tốt hơn.', '2024-10-25'),
(4, 7, 4, N'Tôi rất hài lòng với dịch vụ tại đây.', '2024-11-05'),
(4, 9, 5, N'Absolutely loved it! Will be back soon!', '2024-11-10'),

(5, 2, 4, N'Khách sạn có vị trí tuyệt vời, dễ dàng di chuyển.', '2024-09-18'),
(5, 7, 5, N'Wonderful experience! Staff were incredibly friendly.', '2024-09-23'),
(5, 5, 3, N'Chỗ ở bình thường, không có gì đặc biệt.', '2024-09-28'),
(5, 3, 5, N'Tôi đã có một kỳ nghỉ tuyệt vời!', '2024-10-02'),
(5, 8, 2, N'The room was not clean, very disappointing.', '2024-10-07'),
(5, 4, 4, N'Dịch vụ tuyệt vời và nhân viên rất chuyên nghiệp.', '2024-10-12'),
(5, 5, 5, N'I loved every minute of my stay, highly recommend!', '2024-10-17'),
(5, 2, 3, N'Phòng quá nhỏ cho giá tiền.', '2024-10-22'),
(5, 6, 4, N'Khách sạn đẹp, dịch vụ tốt!', '2024-10-30'),
(5, 1, 5, N'Tôi rất hài lòng với dịch vụ và phòng ốc!', '2024-11-05'),

(6, 1, 5, N'Khách sạn rất đẹp và sạch sẽ!', '2024-09-16'),
(6, 9, 4, N'The staff were very accommodating and friendly.', '2024-09-22'),
(6, 3, 3, N'Dịch vụ không như mong đợi.', '2024-09-27'),
(6, 4, 5, N'Tôi đã có một trải nghiệm tuyệt vời!', '2024-10-02'),
(6, 3, 2, N'Phòng không sạch sẽ, cần được bảo trì.', '2024-10-09'),
(6, 4, 4, N'Tôi đã có một kỳ nghỉ thư giãn.', '2024-10-15'),
(6, 2, 5, N'Definitely a great place for a vacation!', '2024-10-22'),
(6, 1, 3, N'Phòng có vẻ nhỏ và chật chội.', '2024-10-29'),
(6, 5, 4, N'Khách sạn tốt, tôi rất hài lòng!', '2024-11-05'),
(6, 2, 5, N'Wonderful experience, will visit again!', '2024-11-10'),

(7, 6, 5, N'Phòng đẹp và dịch vụ rất tốt!', '2024-09-17'),
(7, 4, 4, N'I enjoyed my stay at this hotel.', '2024-09-22'),
(7, 5, 3, N'The room was not as clean as expected.', '2024-09-28'),
(7, 2, 5, N'Tôi sẽ quay lại đây khi có dịp.', '2024-10-04'),
(7, 8, 2, N'Dịch vụ không tốt lắm.', '2024-10-09'),
(7, 4, 4, N'Perfect location and friendly staff.', '2024-10-15'),
(7, 9, 5, N'Khách sạn này thật sự rất đáng để ở!', '2024-10-22'),
(7, 7, 3, N'Phòng cần được bảo trì tốt hơn.', '2024-10-27'),
(7, 8, 4, N'Dịch vụ tốt và giá cả hợp lý.', '2024-11-05'),
(7, 2, 5, N'An amazing stay, totally recommend!', '2024-11-10'),

(8, 1, 5, N'Rất tuyệt vời, phòng đẹp và sạch sẽ!', '2024-09-18'),
(8, 3, 4, N'The food was amazing, and the location is perfect.', '2024-09-25'),
(8, 9, 3, N'The room was small but comfortable.', '2024-09-30'),
(8, 3, 5, N'Khách sạn rất đáng để quay lại!', '2024-10-06'),
(8, 7, 2, N'I was not happy with the service.', '2024-10-11'),
(8, 1, 4, N'This hotel was good overall.', '2024-10-17'),
(8, 10, 5, N'I will definitely come back!', '2024-10-23'),
(8, 9, 3, N'The location is good, but service needs improvement.', '2024-10-29'),
(8, 8, 4, N'I had a pleasant stay.', '2024-11-05'),
(8, 4, 5, N'Wonderful hotel with great amenities!', '2024-11-10'),

(9, 5, 5, N'Một nơi lý tưởng cho kỳ nghỉ.', '2024-09-20'),
(9, 2, 4, N'The room was cozy, and I felt at home.', '2024-09-26'),
(9, 4, 3, N'Dịch vụ ổn nhưng cần cải thiện thêm.', '2024-10-02'),
(9, 10, 5, N'Tôi yêu thích khách sạn này, rất phù hợp với tôi.', '2024-10-07'),
(9, 5, 2, N'The cleanliness of the room was lacking.', '2024-10-13'),
(9, 5, 4, N'Tôi đã có kỳ nghỉ rất tuyệt vời.', '2024-10-20'),
(9, 1, 5, N'Exceptional service, would love to come again!', '2024-10-25'),
(9, 8, 3, N'Phòng chật, không thoải mái.', '2024-10-30'),
(9, 3, 4, N'Khách sạn ổn, đáng để ở lại.', '2024-11-05'),
(9, 3, 5, N'Highly recommend this hotel for a perfect vacation!', '2024-11-10'),

(10, 1, 5, N'Tuyệt vời! Nhân viên rất thân thiện và phòng sạch sẽ.', '2024-09-15'),
(10, 2, 4, N'I had a very pleasant experience here.', '2024-09-22'),
(10, 1, 3, N'The room was okay but needs some upgrades.', '2024-09-27'),
(10, 3, 5, N'Một kỳ nghỉ tuyệt vời, tôi sẽ quay lại!', '2024-10-01'),
(10, 7, 2, N'I was not satisfied with the cleanliness.', '2024-10-08'),
(10, 3, 4, N'The hotel had a great atmosphere.', '2024-10-12'),
(10, 4, 5, N'Perfect place for a peaceful getaway!', '2024-10-19'),
(10, 7, 3, N'Phòng có vẻ hơi cũ.', '2024-10-25'),
(10, 2, 4, N'I enjoyed the amenities here.', '2024-10-30'),
(10, 6, 5, N'A great experience, highly recommend!', '2024-11-05');

-- Insert Into Room --
INSERT INTO Room (RoomNo, RoomTypeID, HotelCode, ImageBackground, Amenities, Available)
VALUES 
('CS101', 1, 1, 'Images\CharmantSuites-ABoutiqueHotel\CS101Luxury\room1.jpg', 'Wi-Fi, TV, AC, Mini Bar, Kitchenette, Butler Service, Front Desk, Breakfast Available, Luggage Storage, Parking', 1),
('CS102', 2, 1, 'Images\CharmantSuites-ABoutiqueHotel\CS102Deluxe\room1.jpg', 'Wi-Fi, TV, AC, Kitchenette, Butler Service, Front Desk, Breakfast Available, Accessibility, Elevator, Airport Transfer', 1),
('CS103', 3, 1, 'Images\CharmantSuites-ABoutiqueHotel\CS103Standard\room1.jpg', 'Wi-Fi, TV, AC, Mini Bar, Front Desk, Breakfast Available, Smoking Area, Early Check-In, Pools, Room Service', 1),
('CS104', 4, 1, 'Images\CharmantSuites-ABoutiqueHotel\CS104Suite\room1.jpg', 'Wi-Fi, TV, AC, Kitchenette, Butler Service, Breakfast Available, Luggage Storage, Parking, Accessibility, Late Check-Out', 1),
('CS105', 5, 1, 'Images\CharmantSuites-ABoutiqueHotel\CS105Economy\room1.jpg', 'Wi-Fi, TV, AC, Mini Bar, Butler Service, Front Desk, Breakfast Available, Elevator, Pools, Room Service', 1),
('CS106', 6, 1, 'Images\CharmantSuites-ABoutiqueHotel\CS106Presidential\room1.jpg', 'Wi-Fi, TV, AC, Kitchenette, Front Desk, Breakfast Available, Luggage Storage, Airport Transfer, Early Check-In, Smoking Area', 1),
('CS107', 7, 1, 'Images\CharmantSuites-ABoutiqueHotel\CS107Family\room1.jpg', 'Wi-Fi, TV, AC, Mini Bar, Butler Service, Front Desk, Breakfast Available, Accessibility, Elevator, Late Check-Out', 1),
('CS108', 8, 1, 'Images\CharmantSuites-ABoutiqueHotel\CS108Single\room1.jpg', 'Wi-Fi, TV, AC, Kitchenette, Butler Service, Front Desk, Luggage Storage, Parking, Airport Transfer, Pools', 1),
('CS109', 9, 1, 'Images\CharmantSuites-ABoutiqueHotel\CS109Double\room1.jpg', 'Wi-Fi, TV, AC, Mini Bar, Butler Service, Front Desk, Breakfast Available, Accessibility, Smoking Area, Room Service', 1),
('CS110', 10, 1, 'Images\CharmantSuites-ABoutiqueHotel\CS110Penthouse\room1.jpg', 'Wi-Fi, TV, AC, Kitchenette, Butler Service, Breakfast Available, Luggage Storage, Elevator, Pools, Early Check-In', 1),

('KP101', 1, 2, 'Images\KPHotel\KP101Luxury\room1.jpg', 'Wi-Fi, TV, AC, Mini Bar, Kitchenette, Butler Service, Front Desk, Breakfast Available, Luggage Storage, Parking', 1),
('KP102', 2, 2, 'Images\KPHotel\KP102Deluxe\room1.jpg', 'Wi-Fi, TV, AC, Kitchenette, Butler Service, Front Desk, Breakfast Available, Accessibility, Elevator, Airport Transfer', 1),
('KP103', 3, 2, 'Images\KPHotel\KP103Standard\room1.jpg', 'Wi-Fi, TV, AC, Mini Bar, Front Desk, Breakfast Available, Smoking Area, Early Check-In, Pools, Room Service', 1),
('KP104', 4, 2, 'Images\KPHotel\KP104Suite\room1.jpg', 'Wi-Fi, TV, AC, Kitchenette, Butler Service, Breakfast Available, Luggage Storage, Parking, Accessibility, Late Check-Out', 1),
('KP105', 5, 2, 'Images\KPHotel\KP105Economy\room1.jpg', 'Wi-Fi, TV, AC, Mini Bar, Butler Service, Front Desk, Breakfast Available, Elevator, Pools, Room Service', 1),
('KP106', 6, 2, 'Images\KPHotel\KP106Presidential\room1.jpg', 'Wi-Fi, TV, AC, Kitchenette, Front Desk, Breakfast Available, Luggage Storage, Airport Transfer, Early Check-In, Smoking Area', 1),
('KP107', 7, 2, 'Images\KPHotel\KP107Family\room1.jpg', 'Wi-Fi, TV, AC, Mini Bar, Butler Service, Front Desk, Breakfast Available, Accessibility, Elevator, Late Check-Out', 1),
('KP108', 8, 2, 'Images\KPHotel\KP108Single\room1.jpg', 'Wi-Fi, TV, AC, Kitchenette, Butler Service, Front Desk, Luggage Storage, Parking, Airport Transfer, Pools', 1),
('KP109', 9, 2, 'Images\KPHotel\KP109Double\room1.jpg', 'Wi-Fi, TV, AC, Mini Bar, Butler Service, Front Desk, Breakfast Available, Accessibility, Smoking Area, Room Service', 1),
('KP110', 10, 2, 'Images\KPHotel\KP110Penthouse\room1.jpg', 'Wi-Fi, TV, AC, Kitchenette, Butler Service, Breakfast Available, Luggage Storage, Elevator, Pools, Early Check-In', 1),

('LH101', 1, 3, 'Images\Lion11Hotel\LH101Luxury\room1.jpg', 'Wi-Fi, TV, AC, Mini Bar, Kitchenette, Butler Service, Front Desk, Breakfast Available, Luggage Storage, Parking', 1),
('LH102', 2, 3, 'Images\Lion11Hotel\LH102Deluxe\room1.jpg', 'Wi-Fi, TV, AC, Kitchenette, Butler Service, Front Desk, Breakfast Available, Accessibility, Elevator, Airport Transfer', 1),
('LH103', 3, 3, 'Images\Lion11Hotel\LH103Standard\room1.jpg', 'Wi-Fi, TV, AC, Mini Bar, Front Desk, Breakfast Available, Smoking Area, Early Check-In, Pools, Room Service', 1),
('LH104', 4, 3, 'Images\Lion11Hotel\LH104Suite\room1.jpg', 'Wi-Fi, TV, AC, Kitchenette, Butler Service, Breakfast Available, Luggage Storage, Parking, Accessibility, Late Check-Out', 1),
('LH105', 5, 3, 'Images\Lion11Hotel\LH105Economy\room1.jpg', 'Wi-Fi, TV, AC, Mini Bar, Butler Service, Front Desk, Breakfast Available, Elevator, Pools, Room Service', 1),
('LH106', 6, 3, 'Images\Lion11Hotel\LH106Presidential\room1.jpg', 'Wi-Fi, TV, AC, Kitchenette, Front Desk, Breakfast Available, Luggage Storage, Airport Transfer, Early Check-In, Smoking Area', 1),
('LH107', 7, 3, 'Images\Lion11Hotel\LH107Family\room1.jpg', 'Wi-Fi, TV, AC, Mini Bar, Butler Service, Front Desk, Breakfast Available, Accessibility, Elevator, Late Check-Out', 1),
('LH108', 8, 3, 'Images\Lion11Hotel\LH108Single\room1.jpg', 'Wi-Fi, TV, AC, Kitchenette, Butler Service, Front Desk, Luggage Storage, Parking, Airport Transfer, Pools', 1),
('LH109', 9, 3, 'Images\Lion11Hotel\LH109Double\room1.jpg', 'Wi-Fi, TV, AC, Mini Bar, Butler Service, Front Desk, Breakfast Available, Accessibility, Smoking Area, Room Service', 1),
('LH110', 10, 3, 'Images\Lion11Hotel\LH110Penthouse\room1.jpg', 'Wi-Fi, TV, AC, Kitchenette, Butler Service, Breakfast Available, Luggage Storage, Elevator, Pools, Early Check-In', 1),

('MH101', 1, 4, 'Images\MadellaHotel\MH101Luxury\room1.jpg', 'Wi-Fi, TV, AC, Mini Bar, Kitchenette, Butler Service, Front Desk, Breakfast Available, Luggage Storage, Parking', 1),
('MH102', 2, 4, 'Images\MadellaHotel\MH102Deluxe\room1.jpg', 'Wi-Fi, TV, AC, Kitchenette, Butler Service, Front Desk, Breakfast Available, Accessibility, Elevator, Airport Transfer', 1),
('MH103', 3, 4, 'Images\MadellaHotel\MH103Standard\room1.jpg', 'Wi-Fi, TV, AC, Mini Bar, Front Desk, Breakfast Available, Smoking Area, Early Check-In, Pools, Room Service', 1),
('MH104', 4, 4, 'Images\MadellaHotel\MH104Suite\room1.jpg', 'Wi-Fi, TV, AC, Kitchenette, Butler Service, Breakfast Available, Luggage Storage, Parking, Accessibility, Late Check-Out', 1),
('MH105', 5, 4, 'Images\MadellaHotel\MH105Economy\room1.jpg', 'Wi-Fi, TV, AC, Mini Bar, Butler Service, Front Desk, Breakfast Available, Elevator, Pools, Room Service', 1),
('MH106', 6, 4, 'Images\MadellaHotel\MH106Presidential\room1.jpg', 'Wi-Fi, TV, AC, Kitchenette, Front Desk, Breakfast Available, Luggage Storage, Airport Transfer, Early Check-In, Smoking Area', 1),
('MH107', 7, 4, 'Images\MadellaHotel\MH107Family\room1.jpg', 'Wi-Fi, TV, AC, Mini Bar, Butler Service, Front Desk, Breakfast Available, Accessibility, Elevator, Late Check-Out', 1),
('MH108', 8, 4, 'Images\MadellaHotel\MH108Single\room1.jpg', 'Wi-Fi, TV, AC, Kitchenette, Butler Service, Front Desk, Luggage Storage, Parking, Airport Transfer, Pools', 1),
('MH109', 9, 4, 'Images\MadellaHotel\MH109Double\room1.jpg', 'Wi-Fi, TV, AC, Mini Bar, Butler Service, Front Desk, Breakfast Available, Accessibility, Smoking Area, Room Service', 1),
('MH110', 10, 4, 'Images\MadellaHotel\MH110Penthouse\room1.jpg', 'Wi-Fi, TV, AC, Kitchenette, Butler Service, Breakfast Available, Luggage Storage, Elevator, Pools, Early Check-In', 1),

('MT101', 1, 5, 'Images\MuongThanhLuxuryHotel\MT101Luxury\room1.jpg', 'Wi-Fi, TV, AC, Mini Bar, Kitchenette, Butler Service, Front Desk, Breakfast Available, Luggage Storage, Parking', 1),
('MT102', 2, 5, 'Images\MuongThanhLuxuryHotel\MT102Deluxe\room1.jpg', 'Wi-Fi, TV, AC, Kitchenette, Butler Service, Front Desk, Breakfast Available, Accessibility, Elevator, Airport Transfer', 1),
('MT103', 3, 5, 'Images\MuongThanhLuxuryHotel\MT103Standard\room1.jpg', 'Wi-Fi, TV, AC, Mini Bar, Front Desk, Breakfast Available, Smoking Area, Early Check-In, Pools, Room Service', 1),
('MT104', 4, 5, 'Images\MuongThanhLuxuryHotel\MT104Suite\room1.jpg', 'Wi-Fi, TV, AC, Kitchenette, Butler Service, Breakfast Available, Luggage Storage, Parking, Accessibility, Late Check-Out', 1),
('MT105', 5, 5, 'Images\MuongThanhLuxuryHotel\MT105Economy\room1.jpg', 'Wi-Fi, TV, AC, Mini Bar, Butler Service, Front Desk, Breakfast Available, Elevator, Pools, Room Service', 1),
('MT106', 6, 5, 'Images\MuongThanhLuxuryHotel\MT106Presidential\room1.jpg', 'Wi-Fi, TV, AC, Kitchenette, Front Desk, Breakfast Available, Luggage Storage, Airport Transfer, Early Check-In, Smoking Area', 1),
('MT107', 7, 5, 'Images\MuongThanhLuxuryHotel\MT107Family\room1.jpg', 'Wi-Fi, TV, AC, Mini Bar, Butler Service, Front Desk, Breakfast Available, Accessibility, Elevator, Late Check-Out', 1),
('MT108', 8, 5, 'Images\MuongThanhLuxuryHotel\MT108Single\room1.jpg', 'Wi-Fi, TV, AC, Kitchenette, Butler Service, Front Desk, Luggage Storage, Parking, Airport Transfer, Pools', 1),
('MT109', 9, 5, 'Images\MuongThanhLuxuryHotel\MT109Double\room1.jpg', 'Wi-Fi, TV, AC, Mini Bar, Butler Service, Front Desk, Breakfast Available, Accessibility, Smoking Area, Room Service', 1),
('MT110', 10, 5, 'Images\MuongThanhLuxuryHotel\MT110Penthouse\room1.jpg', 'Wi-Fi, TV, AC, Kitchenette, Butler Service, Breakfast Available, Luggage Storage, Elevator, Pools, Early Check-In', 1),

('RH101', 1, 6, 'Images\RichHotel\RH101Luxury\room1.jpg', 'Wi-Fi, TV, AC, Mini Bar, Kitchenette, Butler Service, Front Desk, Breakfast Available, Luggage Storage, Parking', 1),
('RH102', 2, 6, 'Images\RichHotel\RH102Deluxe\room1.jpg', 'Wi-Fi, TV, AC, Kitchenette, Butler Service, Front Desk, Breakfast Available, Accessibility, Elevator, Airport Transfer', 1),
('RH103', 3, 6, 'Images\RichHotel\RH103Standard\room1.jpg', 'Wi-Fi, TV, AC, Mini Bar, Front Desk, Breakfast Available, Smoking Area, Early Check-In, Pools, Room Service', 1),
('RH104', 4, 6, 'Images\RichHotel\RH104Suite\room1.jpg', 'Wi-Fi, TV, AC, Kitchenette, Butler Service, Breakfast Available, Luggage Storage, Parking, Accessibility, Late Check-Out', 1),
('RH105', 5, 6, 'Images\RichHotel\RH105Economy\room1.jpg', 'Wi-Fi, TV, AC, Mini Bar, Butler Service, Front Desk, Breakfast Available, Elevator, Pools, Room Service', 1),
('RH106', 6, 6, 'Images\RichHotel\RH106Presidential\room1.jpg', 'Wi-Fi, TV, AC, Kitchenette, Front Desk, Breakfast Available, Luggage Storage, Airport Transfer, Early Check-In, Smoking Area', 1),
('RH107', 7, 6, 'Images\RichHotel\RH107Family\room1.jpg', 'Wi-Fi, TV, AC, Mini Bar, Butler Service, Front Desk, Breakfast Available, Accessibility, Elevator, Late Check-Out', 1),
('RH108', 8, 6, 'Images\RichHotel\RH108Single\room1.jpg', 'Wi-Fi, TV, AC, Kitchenette, Butler Service, Front Desk, Luggage Storage, Parking, Airport Transfer, Pools', 1),
('RH109', 9, 6, 'Images\RichHotel\RH109Double\room1.jpg', 'Wi-Fi, TV, AC, Mini Bar, Butler Service, Front Desk, Breakfast Available, Accessibility, Smoking Area, Room Service', 1),
('RH110', 10, 6, 'Images\RichHotel\RH110Penthouse\room1.jpg', 'Wi-Fi, TV, AC, Kitchenette, Butler Service, Breakfast Available, Luggage Storage, Elevator, Pools, Early Check-In', 1),

('SH101', 1, 7, 'Images\Sheraton\SH101Luxury\room1.jpg', 'Wi-Fi, TV, AC, Mini Bar, Kitchenette, Butler Service, Front Desk, Breakfast Available, Luggage Storage, Parking', 1),
('SH102', 2, 7, 'Images\Sheraton\SH102Deluxe\room1.jpg', 'Wi-Fi, TV, AC, Kitchenette, Butler Service, Front Desk, Breakfast Available, Accessibility, Elevator, Airport Transfer', 1),
('SH103', 3, 7, 'Images\Sheraton\SH103Standard\room1.jpg', 'Wi-Fi, TV, AC, Mini Bar, Front Desk, Breakfast Available, Smoking Area, Early Check-In, Pools, Room Service', 1),
('SH104', 4, 7, 'Images\Sheraton\SH104Suite\room1.jpg', 'Wi-Fi, TV, AC, Kitchenette, Butler Service, Breakfast Available, Luggage Storage, Parking, Accessibility, Late Check-Out', 1),
('SH105', 5, 7, 'Images\Sheraton\SH105Economy\room1.jpg', 'Wi-Fi, TV, AC, Mini Bar, Butler Service, Front Desk, Breakfast Available, Elevator, Pools, Room Service', 1),
('SH106', 6, 7, 'Images\Sheraton\SH106Presidential\room1.jpg', 'Wi-Fi, TV, AC, Kitchenette, Front Desk, Breakfast Available, Luggage Storage, Airport Transfer, Early Check-In, Smoking Area', 1),
('SH107', 7, 7, 'Images\Sheraton\SH107Family\room1.jpg', 'Wi-Fi, TV, AC, Mini Bar, Butler Service, Front Desk, Breakfast Available, Accessibility, Elevator, Late Check-Out', 1),
('SH108', 8, 7, 'Images\Sheraton\SH108Single\room1.jpg', 'Wi-Fi, TV, AC, Kitchenette, Butler Service, Front Desk, Luggage Storage, Parking, Airport Transfer, Pools', 1),
('SH109', 9, 7, 'Images\Sheraton\SH109Double\room1.jpg', 'Wi-Fi, TV, AC, Mini Bar, Butler Service, Front Desk, Breakfast Available, Accessibility, Smoking Area, Room Service', 1),
('SH110', 10, 7, 'Images\Sheraton\SH110Penthouse\room1.jpg', 'Wi-Fi, TV, AC, Kitchenette, Butler Service, Breakfast Available, Luggage Storage, Elevator, Pools, Early Check-In', 1),

('TH101', 1, 8, 'Images\TulipHotel\TH101Luxury\room1.jpg', 'Wi-Fi, TV, AC, Mini Bar, Kitchenette, Butler Service, Front Desk, Breakfast Available, Luggage Storage, Parking', 1),
('TH102', 2, 8, 'Images\TulipHotel\TH102Deluxe\room1.jpg', 'Wi-Fi, TV, AC, Kitchenette, Butler Service, Front Desk, Breakfast Available, Accessibility, Elevator, Airport Transfer', 1),
('TH103', 3, 8, 'Images\TulipHotel\TH103Standard\room1.jpg', 'Wi-Fi, TV, AC, Mini Bar, Front Desk, Breakfast Available, Smoking Area, Early Check-In, Pools, Room Service', 1),
('TH104', 4, 8, 'Images\TulipHotel\TH104Suite\room1.jpg', 'Wi-Fi, TV, AC, Kitchenette, Butler Service, Breakfast Available, Luggage Storage, Parking, Accessibility, Late Check-Out', 1),
('TH105', 5, 8, 'Images\TulipHotel\TH105Economy\room1.jpg', 'Wi-Fi, TV, AC, Mini Bar, Butler Service, Front Desk, Breakfast Available, Elevator, Pools, Room Service', 1),
('TH106', 6, 8, 'Images\TulipHotel\TH106Presidential\room1.jpg', 'Wi-Fi, TV, AC, Kitchenette, Front Desk, Breakfast Available, Luggage Storage, Airport Transfer, Early Check-In, Smoking Area', 1),
('TH107', 7, 8, 'Images\TulipHotel\TH107Family\room1.jpg', 'Wi-Fi, TV, AC, Mini Bar, Butler Service, Front Desk, Breakfast Available, Accessibility, Elevator, Late Check-Out', 1),
('TH108', 8, 8, 'Images\TulipHotel\TH108Single\room1.jpg', 'Wi-Fi, TV, AC, Kitchenette, Butler Service, Front Desk, Luggage Storage, Parking, Airport Transfer, Pools', 1),
('TH109', 9, 8, 'Images\TulipHotel\TH109Double\room1.jpg', 'Wi-Fi, TV, AC, Mini Bar, Butler Service, Front Desk, Breakfast Available, Accessibility, Smoking Area, Room Service', 1),
('TH110', 10, 8, 'Images\TulipHotel\TH110Penthouse\room1.jpg', 'Wi-Fi, TV, AC, Kitchenette, Butler Service, Breakfast Available, Luggage Storage, Elevator, Pools, Early Check-In', 1),

('VH101', 1, 9, 'Images\V_LunaHotel\VH101Luxury\room1.jpg', 'Wi-Fi, TV, AC, Mini Bar, Kitchenette, Butler Service, Front Desk, Breakfast Available, Luggage Storage, Parking', 1),
('VH102', 2, 9, 'Images\V_LunaHotel\VH102Deluxe\room1.jpg', 'Wi-Fi, TV, AC, Kitchenette, Butler Service, Front Desk, Breakfast Available, Accessibility, Elevator, Airport Transfer', 1),
('VH103', 3, 9, 'Images\V_LunaHotel\VH103Standard\room1.jpg', 'Wi-Fi, TV, AC, Mini Bar, Front Desk, Breakfast Available, Smoking Area, Early Check-In, Pools, Room Service', 1),
('VH104', 4, 9, 'Images\V_LunaHotel\VH104Suite\room1.jpg', 'Wi-Fi, TV, AC, Kitchenette, Butler Service, Breakfast Available, Luggage Storage, Parking, Accessibility, Late Check-Out', 1),
('VH105', 5, 9, 'Images\V_LunaHotel\VH105Economy\room1.jpg', 'Wi-Fi, TV, AC, Mini Bar, Butler Service, Front Desk, Breakfast Available, Elevator, Pools, Room Service', 1),
('VH106', 6, 9, 'Images\V_LunaHotel\VH106Presidential\room1.jpg', 'Wi-Fi, TV, AC, Kitchenette, Front Desk, Breakfast Available, Luggage Storage, Airport Transfer, Early Check-In, Smoking Area', 1),
('VH107', 7, 9, 'Images\V_LunaHotel\VH107Family\room1.jpg', 'Wi-Fi, TV, AC, Mini Bar, Butler Service, Front Desk, Breakfast Available, Accessibility, Elevator, Late Check-Out', 1),
('VH108', 8, 9, 'Images\V_LunaHotel\VH108Single\room1.jpg', 'Wi-Fi, TV, AC, Kitchenette, Butler Service, Front Desk, Luggage Storage, Parking, Airport Transfer, Pools', 1),
('VH109', 9, 9, 'Images\V_LunaHotel\VH109Double\room1.jpg', 'Wi-Fi, TV, AC, Mini Bar, Butler Service, Front Desk, Breakfast Available, Accessibility, Smoking Area, Room Service', 1),
('VH110', 10, 9, 'Images\V_LunaHotel\VH110Penthouse\room1.jpg', 'Wi-Fi, TV, AC, Kitchenette, Butler Service, Breakfast Available, Luggage Storage, Elevator, Pools, Early Check-In', 1),

('WH101', 1, 10, 'Images\WinkHotel\WT101Luxury\room1.jpg', 'Wi-Fi, TV, AC, Mini Bar, Kitchenette, Butler Service, Front Desk, Breakfast Available, Luggage Storage, Parking', 1),
('WH102', 2, 10, 'Images\WinkHotel\WT102Deluxe\room1.jpg', 'Wi-Fi, TV, AC, Kitchenette, Butler Service, Front Desk, Breakfast Available, Accessibility, Elevator, Airport Transfer', 1),
('WH103', 3, 10, 'Images\WinkHotel\WT103Standard\room1.jpg', 'Wi-Fi, TV, AC, Mini Bar, Front Desk, Breakfast Available, Smoking Area, Early Check-In, Pools, Room Service', 1),
('WH104', 4, 10, 'Images\WinkHotel\WT104Suite\room1.jpg', 'Wi-Fi, TV, AC, Kitchenette, Butler Service, Breakfast Available, Luggage Storage, Parking, Accessibility, Late Check-Out', 1),
('WH105', 5, 10, 'Images\WinkHotel\WT105Economy\room1.jpg', 'Wi-Fi, TV, AC, Mini Bar, Butler Service, Front Desk, Breakfast Available, Elevator, Pools, Room Service', 1),
('WH106', 6, 10, 'Images\WinkHotel\WT106Presidential\room1.jpg', 'Wi-Fi, TV, AC, Kitchenette, Front Desk, Breakfast Available, Luggage Storage, Airport Transfer, Early Check-In, Smoking Area', 1),
('WH107', 7, 10, 'Images\WinkHotel\WT107Family\room1.jpg', 'Wi-Fi, TV, AC, Mini Bar, Butler Service, Front Desk, Breakfast Available, Accessibility, Elevator, Late Check-Out', 1),
('WH108', 8, 10, 'Images\WinkHotel\WT108Single\room1.jpg', 'Wi-Fi, TV, AC, Kitchenette, Butler Service, Front Desk, Luggage Storage, Parking, Airport Transfer, Pools', 1),
('WH109', 9, 10, 'Images\WinkHotel\WT109Double\room1.jpg', 'Wi-Fi, TV, AC, Mini Bar, Butler Service, Front Desk, Breakfast Available, Accessibility, Smoking Area, Room Service', 1),
('WH110', 10, 10, 'Images\WinkHotel\WT110Penthouse\room1.jpg', 'Wi-Fi, TV, AC, Kitchenette, Butler Service, Breakfast Available, Luggage Storage, Elevator, Pools, Early Check-In', 1);



-- Insert RoomImage --
INSERT INTO RoomImage (RoomNo, ImageURL, ImageTitle)
VALUES
-- Rooms CS101 to CS110
('CS101', 'Images\CharmantSuites-ABoutiqueHotel\CS101Luxury\room2.jpg', 'Main view of Room CS101'),
('CS101', 'Images\CharmantSuites-ABoutiqueHotel\CS101Luxury\room3.jpg', 'Bathroom in Room CS101'),
('CS101', 'Images\CharmantSuites-ABoutiqueHotel\CS101Luxury\room4.jpg', 'Amenities in Room CS101'),

('CS102', 'Images\CharmantSuites-ABoutiqueHotel\CS102Deluxe\room2.jpg', 'Main view of Room CS102'),
('CS102', 'Images\CharmantSuites-ABoutiqueHotel\CS102Deluxe\room3.jpg', 'Bathroom in Room CS102'),
('CS102', 'Images\CharmantSuites-ABoutiqueHotel\CS102Deluxe\room4.jpg', 'Amenities in Room CS102'),

('CS103', 'Images\CharmantSuites-ABoutiqueHotel\CS103Standard\room2.jpg', 'Main view of Room CS103'),
('CS103', 'Images\CharmantSuites-ABoutiqueHotel\CS103Standard\room3.jpg', 'Bathroom in Room CS103'),
('CS103', 'Images\CharmantSuites-ABoutiqueHotel\CS103Standard\room4.jpg', 'Amenities in Room CS103'),

('CS104', 'Images\CharmantSuites-ABoutiqueHotel\CS104Suite\room2.jpg', 'Main view of Room CS104'),
('CS104', 'Images\CharmantSuites-ABoutiqueHotel\CS104Suite\room3.jpg', 'Bathroom in Room CS104'),
('CS104', 'Images\CharmantSuites-ABoutiqueHotel\CS104Suite\room4.jpg', 'Amenities in Room CS104'),

('CS105', 'Images\CharmantSuites-ABoutiqueHotel\CS105Economy\room2.jpg', 'Main view of Room CS105'),
('CS105', 'Images\CharmantSuites-ABoutiqueHotel\CS105Economy\room3.jpg', 'Bathroom in Room CS105'),
('CS105', 'Images\CharmantSuites-ABoutiqueHotel\CS105Economy\room4.jpg', 'Amenities in Room CS105'),

('CS106', 'Images\CharmantSuites-ABoutiqueHotel\CS106Presidential\room2.jpg', 'Main view of Room CS106'),
('CS106', 'Images\CharmantSuites-ABoutiqueHotel\CS106Presidential\room3.jpg', 'Bathroom in Room CS106'),
('CS106', 'Images\CharmantSuites-ABoutiqueHotel\CS106Presidential\room4.jpg', 'Amenities in Room CS106'),

('CS107', 'Images\CharmantSuites-ABoutiqueHotel\CS107Family\room2.jpg', 'Main view of Room CS107'),
('CS107', 'Images\CharmantSuites-ABoutiqueHotel\CS107Family\room3.jpg', 'Bathroom in Room CS107'),
('CS107', 'Images\CharmantSuites-ABoutiqueHotel\CS107Family\room4.jpg', 'Amenities in Room CS107'),

('CS108', 'Images\CharmantSuites-ABoutiqueHotel\CS108Single\room2.jpg', 'Main view of Room CS108'),
('CS108', 'Images\CharmantSuites-ABoutiqueHotel\CS108Single\room3.jpg', 'Bathroom in Room CS108'),
('CS108', 'Images\CharmantSuites-ABoutiqueHotel\CS108Single\room4.jpg', 'Amenities in Room CS108'),

('CS109', 'Images\CharmantSuites-ABoutiqueHotel\CS109Double\room2.jpg', 'Main view of Room CS109'),
('CS109', 'Images\CharmantSuites-ABoutiqueHotel\CS109Double\room3.jpg', 'Bathroom in Room CS109'),
('CS109', 'Images\CharmantSuites-ABoutiqueHotel\CS109Double\room4.jpg', 'Amenities in Room CS109'),

('CS110', 'Images\CharmantSuites-ABoutiqueHotel\CS110Penthouse\room2.jpg', 'Main view of Room CS110'),
('CS110', 'Images\CharmantSuites-ABoutiqueHotel\CS110Penthouse\room3.jpg', 'Bathroom in Room CS110'),
('CS110', 'Images\CharmantSuites-ABoutiqueHotel\CS110Penthouse\room4.jpg', 'Amenities in Room CS110'),

-- Rooms KP101 to KP110
('KP101', 'Images\KPHotel\KP101Luxury\room2.jpg', 'Main view of Room KP101'),
('KP101', 'Images\KPHotel\KP101Luxury\room3.jpg', 'Bathroom in Room KP101'),
('KP101', 'Images\KPHotel\KP101Luxury\room4.jpg', 'Amenities in Room KP101'),

('KP102', 'Images\KPHotel\KP102Deluxe\room2.jpg', 'Main view of Room KP102'),
('KP102', 'Images\KPHotel\KP102Deluxe\room3.jpg', 'Bathroom in Room KP102'),
('KP102', 'Images\KPHotel\KP102Deluxe\room4.jpg', 'Amenities in Room KP102'),

('KP103', 'Images\KPHotel\KP103Standard\room2.jpg', 'Main view of Room KP103'),
('KP103', 'Images\KPHotel\KP103Standard\room3.jpg', 'Bathroom in Room KP103'),
('KP103', 'Images\KPHotel\KP103Standard\room4.jpg', 'Amenities in Room KP103'),

('KP104', 'Images\KPHotel\KP104Suite\room2.jpg', 'Main view of Room KP104'),
('KP104', 'Images\KPHotel\KP104Suite\room3.jpg', 'Bathroom in Room KP104'),
('KP104', 'Images\KPHotel\KP104Suite\room4.jpg', 'Amenities in Room KP104'),

('KP105', 'Images\KPHotel\KP105Economy\room2.jpg', 'Main view of Room KP105'),
('KP105', 'Images\KPHotel\KP105Economy\room3.jpg', 'Bathroom in Room KP105'),
('KP105', 'Images\KPHotel\KP105Economy\room4.jpg', 'Amenities in Room KP105'),

('KP106', 'Images\KPHotel\KP106Presidential\room2.jpg', 'Main view of Room KP106'),
('KP106', 'Images\KPHotel\KP106Presidential\room3.jpg', 'Bathroom in Room KP106'),
('KP106', 'Images\KPHotel\KP106Presidential\room4.jpg', 'Amenities in Room KP106'),

('KP107', 'Images\KPHotel\KP107Family\room2.jpg', 'Main view of Room KP107'),
('KP107', 'Images\KPHotel\KP107Family\room3.jpg', 'Bathroom in Room KP107'),
('KP107', 'Images\KPHotel\KP107Family\room4.jpg', 'Amenities in Room KP107'),

('KP108', 'Images\KPHotel\KP108Single\room2.jpg', 'Main view of Room KP108'),
('KP108', 'Images\KPHotel\KP108Single\room3.jpg', 'Bathroom in Room KP108'),
('KP108', 'Images\KPHotel\KP108Single\room4.jpg', 'Amenities in Room KP108'),

('KP109', 'Images\KPHotel\KP109Double\room2.jpg', 'Main view of Room KP109'),
('KP109', 'Images\KPHotel\KP109Double\room3.jpg', 'Bathroom in Room KP109'),
('KP109', 'Images\KPHotel\KP109Double\room4.jpg', 'Amenities in Room KP109'),

('KP110', 'Images\KPHotel\KP110Penthouse\room2.jpg', 'Main view of Room KP110'),
('KP110', 'Images\KPHotel\KP110Penthouse\room3.jpg', 'Bathroom in Room KP110'),
('KP110', 'Images\KPHotel\KP110Penthouse\room4.jpg', 'Amenities in Room KP110'),

-- Rooms LH101 to LH110
('LH101', 'Images\Lion11Hotel\LH101Luxury\room2.jpg', 'Main view of Room LH101'),
('LH101', 'Images\Lion11Hotel\LH101Luxury\room3.jpg', 'Bathroom in Room LH101'),
('LH101', 'Images\Lion11Hotel\LH101Luxury\room4.jpg', 'Amenities in Room LH101'),

('LH102', 'Images\Lion11Hotel\LH102Deluxe\room2.jpg', 'Main view of Room LH102'),
('LH102', 'Images\Lion11Hotel\LH102Deluxe\room3.jpg', 'Bathroom in Room LH102'),
('LH102', 'Images\Lion11Hotel\LH102Deluxe\room4.jpg', 'Amenities in Room LH102'),

('LH103', 'Images\Lion11Hotel\LH103Standard\room2.jpg', 'Main view of Room LH103'),
('LH103', 'Images\Lion11Hotel\LH103Standard\room3.jpg', 'Bathroom in Room LH103'),
('LH103', 'Images\Lion11Hotel\LH103Standard\room4.jpg', 'Amenities in Room LH103'),

('LH104', 'Images\Lion11Hotel\LH104Suite\room2.jpg', 'Main view of Room LH104'),
('LH104', 'Images\Lion11Hotel\LH104Suite\room3.jpg', 'Bathroom in Room LH104'),
('LH104', 'Images\Lion11Hotel\LH104Suite\room4.jpg', 'Amenities in Room LH104'),

('LH105', 'Images\Lion11Hotel\LH105Economy\room2.jpg', 'Main view of Room LH105'),
('LH105', 'Images\Lion11Hotel\LH105Economy\room3.jpg', 'Bathroom in Room LH105'),
('LH105', 'Images\Lion11Hotel\LH105Economy\room4.jpg', 'Amenities in Room LH105'),

('LH106', 'Images\Lion11Hotel\LH106Presidential\room2.jpg', 'Main view of Room LH106'),
('LH106', 'Images\Lion11Hotel\LH106Presidential\room3.jpg', 'Bathroom in Room LH106'),
('LH106', 'Images\Lion11Hotel\LH106Presidential\room4.jpg', 'Amenities in Room LH106'),

('LH107', 'Images\Lion11Hotel\LH107Family\room2.jpg', 'Main view of Room LH107'),
('LH107', 'Images\Lion11Hotel\LH107Family\room3.jpg', 'Bathroom in Room LH107'),
('LH107', 'Images\Lion11Hotel\LH107Family\room4.jpg', 'Amenities in Room LH107'),

('LH108', 'Images\Lion11Hotel\LH108Single\room2.jpg', 'Main view of Room LH108'),
('LH108', 'Images\Lion11Hotel\LH108Single\room3.jpg', 'Bathroom in Room LH108'),
('LH108', 'Images\Lion11Hotel\LH108Single\room4.jpg', 'Amenities in Room LH108'),

('LH109', 'Images\Lion11Hotel\LH109Double\room2.jpg', 'Main view of Room LH109'),
('LH109', 'Images\Lion11Hotel\LH109Double\room3.jpg', 'Bathroom in Room LH109'),
('LH109', 'Images\Lion11Hotel\LH109Double\room4.jpg', 'Amenities in Room LH109'),

('LH110', 'Images\Lion11Hotel\LH110Penthouse\room2.jpg', 'Main view of Room LH110'),
('LH110', 'Images\Lion11Hotel\LH110Penthouse\room3.jpg', 'Bathroom in Room LH110'),
('LH110', 'Images\Lion11Hotel\LH110Penthouse\room4.jpg', 'Amenities in Room LH110'),

-- Rooms MH101 to MH110
('MH101', 'Images\MadellaHotel\MH101Luxury\room2.jpg', 'Main view of Room MH101'),
('MH101', 'Images\MadellaHotel\MH101Luxury\room3.jpg', 'Bathroom in Room MH101'),
('MH101', 'Images\MadellaHotel\MH101Luxury\room4.jpg', 'Amenities in Room MH101'),

('MH102', 'Images\MadellaHotel\MH102Deluxe\room2.jpg', 'Main view of Room MH102'),
('MH102', 'Images\MadellaHotel\MH102Deluxe\room3.jpg', 'Bathroom in Room MH102'),
('MH102', 'Images\MadellaHotel\MH102Deluxe\room4.jpg', 'Amenities in Room MH102'),

('MH103', 'Images\MadellaHotel\MH103Standard\room2.jpg', 'Main view of Room MH103'),
('MH103', 'Images\MadellaHotel\MH103Standard\room3.jpg', 'Bathroom in Room MH103'),
('MH103', 'Images\MadellaHotel\MH103Standard\room4.jpg', 'Amenities in Room MH103'),

('MH104', 'Images\MadellaHotel\MH104Suite\room2.jpg', 'Main view of Room MH104'),
('MH104', 'Images\MadellaHotel\MH104Suite\room3.jpg', 'Bathroom in Room MH104'),
('MH104', 'Images\MadellaHotel\MH104Suite\room4.jpg', 'Amenities in Room MH104'),

('MH105', 'Images\MadellaHotel\MH105Economy\room2.jpg', 'Main view of Room MH105'),
('MH105', 'Images\MadellaHotel\MH105Economy\room3.jpg', 'Bathroom in Room MH105'),
('MH105', 'Images\MadellaHotel\MH105Economy\room4.jpg', 'Amenities in Room MH105'),

('MH106', 'Images\MadellaHotel\MH106Presidential\room2.jpg', 'Main view of Room MH106'),
('MH106', 'Images\MadellaHotel\MH106Presidential\room3.jpg', 'Bathroom in Room MH106'),
('MH106', 'Images\MadellaHotel\MH106Presidential\room4.jpg', 'Amenities in Room MH106'),

('MH107', 'Images\MadellaHotel\MH107Family\room2.jpg', 'Main view of Room MH107'),
('MH107', 'Images\MadellaHotel\MH107Family\room3.jpg', 'Bathroom in Room MH107'),
('MH107', 'Images\MadellaHotel\MH107Family\room4.jpg', 'Amenities in Room MH107'),

('MH108', 'Images\MadellaHotel\MH108Single\room2.jpg', 'Main view of Room MH108'),
('MH108', 'Images\MadellaHotel\MH108Single\room3.jpg', 'Bathroom in Room MH108'),
('MH108', 'Images\MadellaHotel\MH108Single\room4.jpg', 'Amenities in Room MH108'),

('MH109', 'Images\MadellaHotel\MH109Double\room2.jpg', 'Main view of Room MH109'),
('MH109', 'Images\MadellaHotel\MH109Double\room3.jpg', 'Bathroom in Room MH109'),
('MH109', 'Images\MadellaHotel\MH109Double\room4.jpg', 'Amenities in Room MH109'),

('MH110', 'Images\MadellaHotel\MH110Penthouse\room2.jpg', 'Main view of Room MH110'),
('MH110', 'Images\MadellaHotel\MH110Penthouse\room3.jpg', 'Bathroom in Room MH110'),
('MH110', 'Images\MadellaHotel\MH110Penthouse\room4.jpg', 'Amenities in Room MH110'),

-- Rooms MT101 to MT110
('MT101', 'Images\MuongThanhLuxuryHotel\MT101Luxury\room2.jpg', 'Main view of Room MT101'),
('MT101', 'Images\MuongThanhLuxuryHotel\MT101Luxury\room3.jpg', 'Bathroom in Room MT101'),
('MT101', 'Images\MuongThanhLuxuryHotel\MT101Luxury\room4.jpg', 'Amenities in Room MT101'),

('MT102', 'Images\MuongThanhLuxuryHotel\MT102Deluxe\room2.jpg', 'Main view of Room MT102'),
('MT102', 'Images\MuongThanhLuxuryHotel\MT102Deluxe\room3.jpg', 'Bathroom in Room MT102'),
('MT102', 'Images\MuongThanhLuxuryHotel\MT102Deluxe\room4.jpg', 'Amenities in Room MT102'),

('MT103', 'Images\MuongThanhLuxuryHotel\MT103Standard\room2.jpg', 'Main view of Room MT103'),
('MT103', 'Images\MuongThanhLuxuryHotel\MT103Standard\room3.jpg', 'Bathroom in Room MT103'),
('MT103', 'Images\MuongThanhLuxuryHotel\MT103Standard\room4.jpg', 'Amenities in Room MT103'),

('MT104', 'Images\MuongThanhLuxuryHotel\MT104Suite\room2.jpg', 'Main view of Room MT104'),
('MT104', 'Images\MuongThanhLuxuryHotel\MT104Suite\room3.jpg', 'Bathroom in Room MT104'),
('MT104', 'Images\MuongThanhLuxuryHotel\MT104Suite\room4.jpg', 'Amenities in Room MT104'),

('MT105', 'Images\MuongThanhLuxuryHotel\MT105Economy\room2.jpg', 'Main view of Room MT105'),
('MT105', 'Images\MuongThanhLuxuryHotel\MT105Economy\room3.jpg', 'Bathroom in Room MT105'),
('MT105', 'Images\MuongThanhLuxuryHotel\MT105Economy\room4.jpg', 'Amenities in Room MT105'),

('MT106', 'Images\MuongThanhLuxuryHotel\MT106Presidential\room2.jpg', 'Main view of Room MT106'),
('MT106', 'Images\MuongThanhLuxuryHotel\MT106Presidential\room3.jpg', 'Bathroom in Room MT106'),
('MT106', 'Images\MuongThanhLuxuryHotel\MT106Presidential\room4.jpg', 'Amenities in Room MT106'),

('MT107', 'Images\MuongThanhLuxuryHotel\MT107Family\room2.jpg', 'Main view of Room MT107'),
('MT107', 'Images\MuongThanhLuxuryHotel\MT107Family\room3.jpg', 'Bathroom in Room MT107'),
('MT107', 'Images\MuongThanhLuxuryHotel\MT107Family\room4.jpg', 'Amenities in Room MT107'),

('MT108', 'Images\MuongThanhLuxuryHotel\MT108Single\room2.jpg', 'Main view of Room MT108'),
('MT108', 'Images\MuongThanhLuxuryHotel\MT108Single\room3.jpg', 'Bathroom in Room MT108'),
('MT108', 'Images\MuongThanhLuxuryHotel\MT108Single\room4.jpg', 'Amenities in Room MT108'),

('MT109', 'Images\MuongThanhLuxuryHotel\MT109Double\room2.jpg', 'Main view of Room MT109'),
('MT109', 'Images\MuongThanhLuxuryHotel\MT109Double\room3.jpg', 'Bathroom in Room MT109'),
('MT109', 'Images\MuongThanhLuxuryHotel\MT109Double\room4.jpg', 'Amenities in Room MT109'),

('MT110', 'Images\MuongThanhLuxuryHotel\MT110Penthouse\room2.jpg', 'Main view of Room MT110'),
('MT110', 'Images\MuongThanhLuxuryHotel\MT110Penthouse\room3.jpg', 'Bathroom in Room MT110'),
('MT110', 'Images\MuongThanhLuxuryHotel\MT110Penthouse\room4.jpg', 'Amenities in Room MT110'),


-- Rooms RH101 to RH110
('RH101', 'Images\RichHotel\RH101Luxury\room2.jpg', 'Main view of Room SH101'),
('RH101', 'Images\RichHotel\RH101Luxury\room3.jpg', 'Bathroom in Room SH101'),
('RH101', 'Images\RichHotel\RH101Luxury\room4.jpg', 'Amenities in Room SH101'),

('RH102', 'Images\RichHotel\RH102Deluxe\room2.jpg', 'Main view of Room SH102'),
('RH102', 'Images\RichHotel\RH102Deluxe\room3.jpg', 'Bathroom in Room SH102'),
('RH102', 'Images\RichHotel\RH102Deluxe\room4.jpg', 'Amenities in Room SH102'),

('RH103', 'Images\RichHotel\RH103Standard\room2.jpg', 'Main view of Room SH103'),
('RH103', 'Images\RichHotel\RH103Standard\room3.jpg', 'Bathroom in Room SH103'),
('RH103', 'Images\RichHotel\RH103Standard\room4.jpg', 'Amenities in Room SH103'),

('RH104', 'Images\RichHotel\RH104Suite\room2.jpg', 'Main view of Room SH104'),
('RH104', 'Images\RichHotel\RH104Suite\room3.jpg', 'Bathroom in Room SH104'),
('RH104', 'Images\RichHotel\RH104Suite\room4.jpg', 'Amenities in Room SH104'),

('RH105', 'Images\RichHotel\RH105Economy\room2.jpg', 'Main view of Room SH105'),
('RH105', 'Images\RichHotel\RH105Economy\room3.jpg', 'Bathroom in Room SH105'),
('RH105', 'Images\RichHotel\RH105Economy\room4.jpg', 'Amenities in Room SH105'),

('RH106', 'Images\RichHotel\RH106Presidential\room2.jpg', 'Main view of Room SH106'),
('RH106', 'Images\RichHotel\RH106Presidential\room3.jpg', 'Bathroom in Room SH106'),
('RH106', 'Images\RichHotel\RH106Presidential\room4.jpg', 'Amenities in Room SH106'),

('RH107', 'Images\RichHotel\RH107Family\room2.jpg', 'Main view of Room SH107'),
('RH107', 'Images\RichHotel\RH107Family\room3.jpg', 'Bathroom in Room SH107'),
('RH107', 'Images\RichHotel\RH107Family\room4.jpg', 'Amenities in Room SH107'),

('RH108', 'Images\RichHotel\RH108Single\room2.jpg', 'Main view of Room SH108'),
('RH108', 'Images\RichHotel\RH108Single\room3.jpg', 'Bathroom in Room SH108'),
('RH108', 'Images\RichHotel\RH108Single\room4.jpg', 'Amenities in Room SH108'),

('RH109', 'Images\RichHotel\RH109Double\room2.jpg', 'Main view of Room SH109'),
('RH109', 'Images\RichHotel\RH109Double\room3.jpg', 'Bathroom in Room SH109'),
('RH109', 'Images\RichHotel\RH109Double\room4.jpg', 'Amenities in Room SH109'),

('RH110', 'Images\RichHotel\RH110Penthouse\room2.jpg', 'Main view of Room SH110'),
('RH110', 'Images\RichHotel\RH110Penthouse\room3.jpg', 'Bathroom in Room SH110'),
('RH110', 'Images\RichHotel\RH110Penthouse\room4.jpg', 'Amenities in Room SH110'),

-- Rooms SH101 to SH110
('SH101', 'Images\Sheraton\SH101Luxury\room2.jpg', 'Main view of Room SH101'),
('SH101', 'Images\Sheraton\SH101Luxury\room3.jpg', 'Bathroom in Room SH101'),
('SH101', 'Images\Sheraton\SH101Luxury\room4.jpg', 'Amenities in Room SH101'),

('SH102', 'Images\Sheraton\SH102Deluxe\room2.jpg', 'Main view of Room SH102'),
('SH102', 'Images\Sheraton\SH102Deluxe\room3.jpg', 'Bathroom in Room SH102'),
('SH102', 'Images\Sheraton\SH102Deluxe\room4.jpg', 'Amenities in Room SH102'),

('SH103', 'Images\Sheraton\SH103Standard\room2.jpg', 'Main view of Room SH103'),
('SH103', 'Images\Sheraton\SH103Standard\room3.jpg', 'Bathroom in Room SH103'),
('SH103', 'Images\Sheraton\SH103Standard\room4.jpg', 'Amenities in Room SH103'),

('SH104', 'Images\Sheraton\SH104Suite\room2.jpg', 'Main view of Room SH104'),
('SH104', 'Images\Sheraton\SH104Suite\room3.jpg', 'Bathroom in Room SH104'),
('SH104', 'Images\Sheraton\SH104Suite\room4.jpg', 'Amenities in Room SH104'),

('SH105', 'Images\Sheraton\SH105Economy\room2.jpg', 'Main view of Room SH105'),
('SH105', 'Images\Sheraton\SH105Economy\room3.jpg', 'Bathroom in Room SH105'),
('SH105', 'Images\Sheraton\SH105Economy\room4.jpg', 'Amenities in Room SH105'),

('SH106', 'Images\Sheraton\SH106Presidential\room2.jpg', 'Main view of Room SH106'),
('SH106', 'Images\Sheraton\SH106Presidential\room3.jpg', 'Bathroom in Room SH106'),
('SH106', 'Images\Sheraton\SH106Presidential\room4.jpg', 'Amenities in Room SH106'),

('SH107', 'Images\Sheraton\SH107Family\room2.jpg', 'Main view of Room SH107'),
('SH107', 'Images\Sheraton\SH107Family\room3.jpg', 'Bathroom in Room SH107'),
('SH107', 'Images\Sheraton\SH107Family\room4.jpg', 'Amenities in Room SH107'),

('SH108', 'Images\Sheraton\SH108Single\room2.jpg', 'Main view of Room SH108'),
('SH108', 'Images\Sheraton\SH108Single\room3.jpg', 'Bathroom in Room SH108'),
('SH108', 'Images\Sheraton\SH108Single\room4.jpg', 'Amenities in Room SH108'),

('SH109', 'Images\Sheraton\SH109Double\room2.jpg', 'Main view of Room SH109'),
('SH109', 'Images\Sheraton\SH109Double\room3.jpg', 'Bathroom in Room SH109'),
('SH109', 'Images\Sheraton\SH109Double\room4.jpg', 'Amenities in Room SH109'),

('SH110', 'Images\Sheraton\SH110Penthouse\room2.jpg', 'Main view of Room SH110'),
('SH110', 'Images\Sheraton\SH110Penthouse\room3.jpg', 'Bathroom in Room SH110'),
('SH110', 'Images\Sheraton\SH110Penthouse\room4.jpg', 'Amenities in Room SH110'),


-- Rooms TH101 to TH110
('TH101', 'Images\TulipHotel\TH101Luxury\room2.jpg', 'Main view of Room TH101'),
('TH101', 'Images\TulipHotel\TH101Luxury\room3.jpg', 'Bathroom in Room TH101'),
('TH101', 'Images\TulipHotel\TH101Luxury\room4.jpg', 'Amenities in Room TH101'),

('TH102', 'Images\TulipHotel\TH102Deluxe\room2.jpg', 'Main view of Room TH102'),
('TH102', 'Images\TulipHotel\TH102Deluxe\room3.jpg', 'Bathroom in Room TH102'),
('TH102', 'Images\TulipHotel\TH102Deluxe\room4.jpg', 'Amenities in Room TH102'),

('TH103', 'Images\TulipHotel\TH103Standard\room2.jpg', 'Main view of Room TH103'),
('TH103', 'Images\TulipHotel\TH103Standard\room3.jpg', 'Bathroom in Room TH103'),
('TH103', 'Images\TulipHotel\TH103Standard\room4.jpg', 'Amenities in Room TH103'),

('TH104', 'Images\TulipHotel\TH104Suite\room2.jpg', 'Main view of Room TH104'),
('TH104', 'Images\TulipHotel\TH104Suite\room3.jpg', 'Bathroom in Room TH104'),
('TH104', 'Images\TulipHotel\TH104Suite\room4.jpg', 'Amenities in Room TH104'),

('TH105', 'Images\TulipHotel\TH105Economy\room2.jpg', 'Main view of Room TH105'),
('TH105', 'Images\TulipHotel\TH105Economy\room3.jpg', 'Bathroom in Room TH105'),
('TH105', 'Images\TulipHotel\TH105Economy\room4.jpg', 'Amenities in Room TH105'),

('TH106', 'Images\TulipHotel\TH106Presidential\room2.jpg', 'Main view of Room TH106'),
('TH106', 'Images\TulipHotel\TH106Presidential\room3.jpg', 'Bathroom in Room TH106'),
('TH106', 'Images\TulipHotel\TH106Presidential\room4.jpg', 'Amenities in Room TH106'),

('TH107', 'Images\TulipHotel\TH107Family\room2.jpg', 'Main view of Room TH107'),
('TH107', 'Images\TulipHotel\TH107Family\room3.jpg', 'Bathroom in Room TH107'),
('TH107', 'Images\TulipHotel\TH107Family\room4.jpg', 'Amenities in Room TH107'),

('TH108', 'Images\TulipHotel\TH108Single\room2.jpg', 'Main view of Room TH108'),
('TH108', 'Images\TulipHotel\TH108Single\room3.jpg', 'Bathroom in Room TH108'),
('TH108', 'Images\TulipHotel\TH108Single\room4.jpg', 'Amenities in Room TH108'),

('TH109', 'Images\TulipHotel\TH109Double\room2.jpg', 'Main view of Room TH109'),
('TH109', 'Images\TulipHotel\TH109Double\room3.jpg', 'Bathroom in Room TH109'),
('TH109', 'Images\TulipHotel\TH109Double\room4.jpg', 'Amenities in Room TH109'),

('TH110', 'Images\TulipHotel\TH110Penthouse\room2.jpg', 'Main view of Room TH110'),
('TH110', 'Images\TulipHotel\TH110Penthouse\room3.jpg', 'Bathroom in Room TH110'),
('TH110', 'Images\TulipHotel\TH110Penthouse\room4.jpg', 'Amenities in Room TH110'),


-- Rooms VH101 to VH110
('VH101', 'Images\V_LunaHotel\VH101Luxury\room2.jpg', 'Main view of Room VH101'),
('VH101', 'Images\V_LunaHotel\VH101Luxury\room3.jpg', 'Bathroom in Room VH101'),
('VH101', 'Images\V_LunaHotel\VH101Luxury\room4.jpg', 'Amenities in Room VH101'),

('VH102', 'Images\V_LunaHotel\VH102Deluxe\room2.jpg', 'Main view of Room VH102'),
('VH102', 'Images\V_LunaHotel\VH102Deluxe\room3.jpg', 'Bathroom in Room VH102'),
('VH102', 'Images\V_LunaHotel\VH102Deluxe\room4.jpg', 'Amenities in Room VH102'),

('VH103', 'Images\V_LunaHotel\VH103Standard\room2.jpg', 'Main view of Room VH103'),
('VH103', 'Images\V_LunaHotel\VH103Standard\room3.jpg', 'Bathroom in Room VH103'),
('VH103', 'Images\V_LunaHotel\VH103Standard\room4.jpg', 'Amenities in Room VH103'),

('VH104', 'Images\V_LunaHotel\VH104Suite\room2.jpg', 'Main view of Room VH104'),
('VH104', 'Images\V_LunaHotel\VH104Suite\room3.jpg', 'Bathroom in Room VH104'),
('VH104', 'Images\V_LunaHotel\VH104Suite\room4.jpg', 'Amenities in Room VH104'),

('VH105', 'Images\V_LunaHotel\VH105Economy\room2.jpg', 'Main view of Room VH105'),
('VH105', 'Images\V_LunaHotel\VH105Economy\room3.jpg', 'Bathroom in Room VH105'),
('VH105', 'Images\V_LunaHotel\VH105Economy\room4.jpg', 'Amenities in Room VH105'),

('VH106', 'Images\V_LunaHotel\VH106Presidential\room2.jpg', 'Main view of Room VH106'),
('VH106', 'Images\V_LunaHotel\VH106Presidential\room3.jpg', 'Bathroom in Room VH106'),
('VH106', 'Images\V_LunaHotel\VH106Presidential\room4.jpg', 'Amenities in Room VH106'),

('VH107', 'Images\V_LunaHotel\VH107Family\room2.jpg', 'Main view of Room VH107'),
('VH107', 'Images\V_LunaHotel\VH107Family\room3.jpg', 'Bathroom in Room VH107'),
('VH107', 'Images\V_LunaHotel\VH107Family\room4.jpg', 'Amenities in Room VH107'),

('VH108', 'Images\V_LunaHotel\VH108Single\room2.jpg', 'Main view of Room VH108'),
('VH108', 'Images\V_LunaHotel\VH108Single\room3.jpg', 'Bathroom in Room VH108'),
('VH108', 'Images\V_LunaHotel\VH108Single\room4.jpg', 'Amenities in Room VH108'),

('VH109', 'Images\V_LunaHotel\VH109Double\room2.jpg', 'Main view of Room VH109'),
('VH109', 'Images\V_LunaHotel\VH109Double\room3.jpg', 'Bathroom in Room VH109'),
('VH109', 'Images\V_LunaHotel\VH109Double\room4.jpg', 'Amenities in Room VH109'),

('VH110', 'Images\V_LunaHotel\VH110Penthouse\room2.jpg', 'Main view of Room VH110'),
('VH110', 'Images\V_LunaHotel\VH110Penthouse\room3.jpg', 'Bathroom in Room VH110'),
('VH110', 'Images\V_LunaHotel\VH110Penthouse\room4.jpg', 'Amenities in Room VH110'),

-- Rooms WH101 to WH110
('WH101', 'Images\WinkHotel\WT101Luxury\room2.jpg', 'Main view of Room WH101'),
('WH101', 'Images\WinkHotel\WT101Luxury\room3.jpg', 'Bathroom in Room WH101'),
('WH101', 'Images\WinkHotel\WT101Luxury\room4.jpg', 'Amenities in Room WH101'),

('WH102', 'Images\WinkHotel\WT102Deluxe\room2.jpg', 'Main view of Room WH102'),
('WH102', 'Images\WinkHotel\WT102Deluxe\room3.jpg', 'Bathroom in Room WH102'),
('WH102', 'Images\WinkHotel\WT102Deluxe\room4.jpg', 'Amenities in Room WH102'),

('WH103', 'Images\WinkHotel\WT103Standard\room2.jpg', 'Main view of Room WH103'),
('WH103', 'Images\WinkHotel\WT103Standard\room3.jpg', 'Bathroom in Room WH103'),
('WH103', 'Images\WinkHotel\WT103Standard\room4.jpg', 'Amenities in Room WH103'),

('WH104', 'Images\WinkHotel\WT104Suite\room2.jpg', 'Main view of Room WH104'),
('WH104', 'Images\WinkHotel\WT104Suite\room3.jpg', 'Bathroom in Room WH104'),
('WH104', 'Images\WinkHotel\WT104Suite\room4.jpg', 'Amenities in Room WH104'),

('WH105', 'Images\WinkHotel\WT105Economy\room2.jpg', 'Main view of Room WH105'),
('WH105', 'Images\WinkHotel\WT105Economy\room3.jpg', 'Bathroom in Room WH105'),
('WH105', 'Images\WinkHotel\WT105Economy\room4.jpg', 'Amenities in Room WH105'),

('WH106', 'Images\WinkHotel\WT106Presidential\room2.jpg', 'Main view of Room WH106'),
('WH106', 'Images\WinkHotel\WT106Presidential\room3.jpg', 'Bathroom in Room WH106'),
('WH106', 'Images\WinkHotel\WT106Presidential\room4.jpg', 'Amenities in Room WH106'),

('WH107', 'Images\WinkHotel\WT107Family\room2.jpg', 'Main view of Room WH107'),
('WH107', 'Images\WinkHotel\WT107Family\room3.jpg', 'Bathroom in Room WH107'),
('WH107', 'Images\WinkHotel\WT107Family\room4.jpg', 'Amenities in Room WH107'),

('WH108', 'Images\WinkHotel\WT108Single\room2.jpg', 'Main view of Room WH108'),
('WH108', 'Images\WinkHotel\WT108Single\room3.jpg', 'Bathroom in Room WH108'),
('WH108', 'Images\WinkHotel\WT108Single\room4.jpg', 'Amenities in Room WH108'),

('WH109', 'Images\WinkHotel\WT109Double\room2.jpg', 'Main view of Room WH109'),
('WH109', 'Images\WinkHotel\WT109Double\room3.jpg', 'Bathroom in Room WH109'),
('WH109', 'Images\WinkHotel\WT109Double\room4.jpg', 'Amenities in Room WH109'),

('WH110', 'Images\WinkHotel\WT110Penthouse\room2.jpg', 'Main view of Room WH110'),
('WH110', 'Images\WinkHotel\WT110Penthouse\room3.jpg', 'Bathroom in Room WH110'),
('WH110', 'Images\WinkHotel\WT110Penthouse\room4.jpg', 'Amenities in Room WH110');


-- Insert Into [Booking] --
INSERT INTO [Booking] (GuestID, RoomNo, DiscountID, CheckInDate, CheckOutDate, NumberAdults, NumberChildrens, BookingStatus)
VALUES
(1, 'CS101', 1, '2024-01-05', '2024-01-10', 2, 1, 0),
(2, 'KP102', 2, '2024-03-10', '2024-03-15', 1, 0, 0),
(3, 'LH103', 3, '2024-05-03', '2024-05-07', 2, 2, 0),
(4, 'MH104', 4, '2024-07-05', '2024-07-10', 1, 1, 0),
(5, 'MT105', 5, '2024-09-27', '2024-09-30', 2, 0, 0),
(6, 'RH106', 6, '2024-11-22', '2024-11-29', 2, 1, 0),
(7, 'SH107', 7, '2024-12-23', '2024-12-30', 3, 1, 0),
(8, 'TH108', 8, '2024-02-02', '2024-02-04', 1, 2, 0),
(9, 'VH109', 9, '2024-04-16', '2024-04-18', 2, 1, 0),
(10, 'WH110', 10, '2024-06-02', '2024-06-04', 2, 0, 0);

-- Insert Into [Bill] --
INSERT INTO [Bill] (GuestID, BookingID, TotalAmount, PaymentDate, PaymentStatus)
VALUES
(1, 1, 450.00, '2024-01-10', 0),
(2, 2, 340.00, '2024-03-15', 0),
(3, 3, 800.00, '2024-05-15', 0),
(4, 4, 380.00, '2024-07-10', 0),
(5, 5, 600.00, '2024-9-28', 0),
(6, 6, 750.00, '2024-11-20', 0),
(7, 7, 1000.00, '2024-12-20', 0),
(8, 8, 260.00, '2024-02-04', 0),
(9, 9, 530.00, '2024-04-18', 0),
(10, 10, 450.00, '2024-06-04', 0);



