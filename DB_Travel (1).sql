--------------------------------------------------------------------------
-- Use Master
USE master
GO

--------------------------------------------------------------------------
-- XÓA DATABASE NẾU TỒN TẠI DATABASE Travel TRONG HỆ THỐNG
IF  EXISTS (SELECT * FROM sysdatabases 	WHERE name = N'Travel' )
--  
DROP DATABASE Travel
GO			
--------------------------------------------------------------------------
-- Tạo DATABASE với Tên là Travel
CREATE DATABASE Travel

GO


--------------------------------------------------------------------------
-- Dùng DATABASE Travel
USE Travel
GO
create table CTKho
(
	maKho varchar(6) not null primary key,
	maHH varchar(6)  not null,
	ngayNhap date not null,
	hanSuDung date not null,
	maLo varchar(6)  not null,
	soLuong varchar(6) not null,
	Is_Delete bit,
)
go
--------------------------------------------------------------------------
-- Tạo Bảng Khách Hàng
IF  EXISTS (SELECT * FROM sysobjects WHERE name = N'Khach_Hang' )
DROP TABLE dbo.Khach_Hang
--------------------------------------------------------------------------
CREATE TABLE dbo.Khach_Hang(
	Ma_Khach_Hang VARCHAR(50) NOT NULL,
	Ten_Khach_Hang NVARCHAR(50) NOT NULL,
	So_Dien_Thoai VARCHAR(11) NOT NULL,
	Cmnd int NOT NULL,
	Email VARCHAR(50) NOT NULL,
	Password VARCHAR(50) NOT NULL,
	Dia_Chi NVARCHAR(255) NOT NULL,
	Ngay_Sinh Date NOT NULL,
	Hinh NVARCHAR(MAX),
	Active bit,
	Is_Delete bit,

	PRIMARY KEY(Ma_Khach_Hang)	
)
GO

--------------------------------------------------------------------------
-- Tạo Bảng Nhân Viên
IF  EXISTS (SELECT * FROM sysobjects WHERE name = N'Nhan_Vien' )
DROP TABLE dbo.Nhan_Vien
--------------------------------------------------------------------------
CREATE TABLE dbo.Nhan_Vien(
	Ma_Nhan_Vien VARCHAR(50) NOT NULL,
	Ten_Nhan_Vien NVARCHAR(50) NOT NULL,
	So_Dien_Thoai VARCHAR(11) NOT NULL,
	Email VARCHAR(50) NOT NULL,
	Password VARCHAR(50) NOT NULL,
	Hinh NVARCHAR(MAX),
	Ngay_Sinh date NOT NULL,
	Gioi_Tinh NVARCHAR(10) NOT NULL,
	Dia_Chi NVARCHAR(255) NOT NULL,
	Vai_Tro bit,
	Is_Delete bit

	PRIMARY KEY (Ma_Nhan_Vien)
)
GO

--------------------------------------------------------------------------
-- Tạo Bảng Loại Tour
IF  EXISTS (SELECT * FROM sysobjects WHERE name = N'Loai_Tour' )
DROP TABLE dbo.Loai_Tour
--------------------------------------------------------------------------
CREATE TABLE dbo.Loai_Tour
(
	Id_Loai_Tour VARCHAR(12) NOT NULL,
	Ten_Loai_Tour NVARCHAR(50) NOT NULL,
	
	PRIMARY KEY(Id_Loai_Tour)
)
GO

--------------------------------------------------------------------------
-- Tạo Bảng Tour
IF  EXISTS (SELECT * FROM sysobjects WHERE name = N'Tour' )
DROP TABLE dbo.Tour
--------------------------------------------------------------------------
CREATE TABLE dbo.Tour(
	Ma_Tour int IDENTITY(1,1),
	Ten_Tour NVARCHAR(50) NOT NULL,
	Gia_Tour FLOAT NOT NULL,
	Lo_Trinh NVARCHAR(255) NOT NULL,
	So_Luong_Khach int NOT NULL,
	Ngay_Di date NOT NULL,
	Ngay_Ve date NOT NULL,
	Thoi_Gian NVARCHAR(50) NOT NULL,
	Phuong_Tien NVARCHAR(50) NOT NULL,
	Hinh NVARCHAR(MAX) ,
	Video NVARCHAR(MAX) ,
	Mo_Ta NVARCHAR(MAX) NOT NULL,
	Id_Loai_Tour VARCHAR(12) NOT NULL,
	Is_Delete bit

	PRIMARY KEY(Ma_Tour),

	FOREIGN KEY(Id_Loai_Tour) REFERENCES Loai_Tour(Id_Loai_Tour) ON DELETE NO ACTION ON UPDATE CASCADE,
)
GO
--------------------------------------------------------------------------
-- Tạo Bảng Đơn Tour
IF  EXISTS (SELECT * FROM sysobjects WHERE name = N'Don_Tour' )
DROP TABLE dbo.Don_Tour
--------------------------------------------------------------------------
CREATE TABLE dbo.Don_Tour(
	Ma_Don_Tour int IDENTITY(1,1),
	Ngay_Dat DateTime NOT NULL,
	Ma_Khach_Hang VARCHAR(50) NOT NULL,
	Ma_Nhan_Vien VARCHAR(50) NUll,
	Gia_Tour FLOAT NOT NULL,
	So_Luong_Khach int NOT NULL,
	Trang_Thai_Thanh_Toan bit,
	Trang_Thai_Duyet_Don int NOT NULL,
	Ghi_Chu NVARCHAR(255),
	Ma_Tour int,
	
	PRIMARY KEY (Ma_Don_Tour),

	FOREIGN KEY(Ma_Khach_Hang) REFERENCES Khach_Hang(Ma_Khach_Hang) ON DELETE NO ACTION ON UPDATE CASCADE,
	FOREIGN KEY(Ma_Nhan_Vien) REFERENCES Nhan_Vien(Ma_Nhan_Vien) ON DELETE NO ACTION ON UPDATE CASCADE,
	FOREIGN KEY(Ma_Tour) REFERENCES Tour(Ma_Tour) ON DELETE NO ACTION ON UPDATE CASCADE,

)
GO



--------------------------------------------------------------------------
-- Tạo Bảng Thông Tin Du Khách
IF  EXISTS (SELECT * FROM sysobjects WHERE name = N'Thong_Tin_Du_Khach' )
DROP TABLE dbo.Thong_Tin_Du_Khach
--------------------------------------------------------------------------
CREATE TABLE dbo.Thong_Tin_Du_Khach(
	Ma_Thong_Tin int IDENTITY(1,1),
	Ma_Don_Tour int,
	Cmnd int NOT NULL,
	Hinh NVARCHAR(MAX) ,
	SDT_Zalo VARCHAR(11) NOT NULL,
	Ten_Du_Khach NVARCHAR(50) NOT NULL,
	So_Thu_Tu VARCHAR(10) NOT NULL,

	PRIMARY KEY(Ma_Thong_Tin),

	FOREIGN KEY(Ma_Don_Tour) REFERENCES Don_Tour(Ma_Don_Tour) ON DELETE NO ACTION ON UPDATE CASCADE,
)
GO
--------------------------------------------------------------------------
-- Tạo Bảng Phương Tiện
IF  EXISTS (SELECT * FROM sysobjects WHERE name = N'Phuong_Tien' )
DROP TABLE dbo.Phuong_Tien
--------------------------------------------------------------------------
CREATE TABLE dbo.Phuong_Tien(
	Ma_Khach_Hang VARCHAR(50) NOT NULL,
	Ten_Khach_Hang NVARCHAR(50) NOT NULL,
	So_Dien_Thoai VARCHAR(11) NOT NULL,
	Cmnd int NOT NULL,
	Email VARCHAR(50) NOT NULL,
	Password VARCHAR(50) NOT NULL,
	Dia_Chi NVARCHAR(255) NOT NULL,
	Ngay_Sinh Date NOT NULL,
	Hinh NVARCHAR(MAX),
	Active bit,
	Is_Delete bit,

	PRIMARY KEY(Ma_Khach_Hang)	
)
GO





--------------------------------------------------------------------------
insert into CTKho values ('kho01','vtb01','02/02/2020','02/05/2020','lo','na')
-- Chèn dữ liệu KhachHang - Khách Hàng
INSERT [dbo].[Khach_Hang] ([Ma_Khach_Hang],[Ten_Khach_Hang], [So_Dien_Thoai], [Cmnd], [Email], [Password], [Dia_Chi], [Ngay_Sinh], [Hinh], [Active], [Is_Delete]) VALUES ('kh1', N'Nguyễn Hữu Phúc', '0123456789', '1234567', 'Phuc@gmail.com','phuc123', 'HCM', '1999/02/26','','1','0')
INSERT [dbo].[Khach_Hang] ([Ma_Khach_Hang],[Ten_Khach_Hang], [So_Dien_Thoai], [Cmnd], [Email], [Password], [Dia_Chi], [Ngay_Sinh], [Hinh], [Active], [Is_Delete]) VALUES ('kh2', N'Trần Minh Nhân', '0123456789', '1234567','Nhan@gmail.com','nhan123', 'HCM', '1996/05/04','','1','0')
INSERT [dbo].[Khach_Hang] ( [Ma_Khach_Hang],[Ten_Khach_Hang], [So_Dien_Thoai], [Cmnd], [Email], [Password], [Dia_Chi], [Ngay_Sinh], [Hinh], [Active], [Is_Delete]) VALUES ('kh3', N'Cao Hoàng Nhật', '0123456789', '1234567','Nhat@gmail.com','nhat123', 'HCM', '1989/12/16','','1','0')
INSERT [dbo].[Khach_Hang] ([Ma_Khach_Hang], [Ten_Khach_Hang], [So_Dien_Thoai], [Cmnd], [Email], [Password], [Dia_Chi], [Ngay_Sinh], [Hinh], [Active], [Is_Delete]) VALUES ('kh4', N'Phùng Bá', '0123456789', '1234567','Ba@gmail.com','ba123', 'HCM', '1997/04/04','','1','0')
INSERT [dbo].[Khach_Hang] ([Ma_Khach_Hang], [Ten_Khach_Hang], [So_Dien_Thoai], [Cmnd], [Email], [Password], [Dia_Chi], [Ngay_Sinh], [Hinh], [Active], [Is_Delete]) VALUES ('kh5', N'Mỹ Duyên', '0123456789', '1234567','Duyen@gmail.com','duyen123', 'HCM', '1989/01/01','','1','0')
INSERT [dbo].[Khach_Hang] ([Ma_Khach_Hang], [Ten_Khach_Hang], [So_Dien_Thoai], [Cmnd], [Email], [Password], [Dia_Chi], [Ngay_Sinh], [Hinh], [Active], [Is_Delete]) VALUES ('kh6', N'Mỹ Duyên', '0123456789', '1234567','Duyen@gmail.com','duyen123', 'HCM', '1989/01/01','','1','1')
 -- Chèn dữ liệu NhanVien - Nhân Viên
INSERT [dbo].[Nhan_Vien] ([Ma_Nhan_Vien], [Ten_Nhan_Vien], [So_Dien_Thoai], [Email], [Password], [Hinh], [Ngay_Sinh], [Gioi_Tinh], [Dia_Chi], [Vai_Tro], [Is_Delete]) VALUES ('nv1', N'Trần Minh Hiếu', '0123456789', 'hieu@fpt.vn', 'hieu123', '', '2000/04/04', 'Nam', N'Quảng Ngãi', '1','0')
INSERT [dbo].[Nhan_Vien] ([Ma_Nhan_Vien], [Ten_Nhan_Vien], [So_Dien_Thoai], [Email], [Password], [Hinh], [Ngay_Sinh], [Gioi_Tinh], [Dia_Chi], [Vai_Tro], [Is_Delete]) VALUES ('nv2', N'Trần vũ Quang Huy', '0123456789', 'huy@fpt.vn', 'huy123', '', '2000/04/04', 'Khác', N'HCM', '1','0')
INSERT [dbo].[Nhan_Vien] ([Ma_Nhan_Vien], [Ten_Nhan_Vien], [So_Dien_Thoai], [Email], [Password], [Hinh], [Ngay_Sinh], [Gioi_Tinh], [Dia_Chi], [Vai_Tro], [Is_Delete]) VALUES ('nv3', N'Võ Hoàng Tú', '0123456789', 'tuyeunga@fpt.vn', 'tuyeunga', '', '2000/04/04', 'Nam', N'Ở Đâu Quên Rồi', '1','0')
INSERT [dbo].[Nhan_Vien] ([Ma_Nhan_Vien], [Ten_Nhan_Vien], [So_Dien_Thoai], [Email], [Password], [Hinh], [Ngay_Sinh], [Gioi_Tinh], [Dia_Chi], [Vai_Tro], [Is_Delete]) VALUES ('nv4', N'Nguyễn Duy Phương', '0123456789', 'phuong@fpt.vn', 'phuong123', '', '2000/04/04', 'Nam', N'HCM', '1','0')
INSERT [dbo].[Nhan_Vien] ([Ma_Nhan_Vien], [Ten_Nhan_Vien], [So_Dien_Thoai], [Email], [Password], [Hinh], [Ngay_Sinh], [Gioi_Tinh], [Dia_Chi], [Vai_Tro], [Is_Delete]) VALUES ('nv5',N'Võ Xuân Hậu', '0123456789', 'hau@fpt.vn', 'hau123', '', '2000/04/04', 'Nam', N'Bình Định', '1','0')
-- Chèn dữ liệu LoaiTour - Loại Tour
INSERT INTO Loai_Tour (Id_Loai_Tour,Ten_Loai_Tour) VALUES ('LT00',N'Tour Giờ Chót');
INSERT INTO Loai_Tour (Id_Loai_Tour,Ten_Loai_Tour) VALUES ('LT01',N'Tour Miền Nam');
INSERT INTO Loai_Tour (Id_Loai_Tour,Ten_Loai_Tour) VALUES ('LT02',N'Tour Miền Bắc');
INSERT INTO Loai_Tour (Id_Loai_Tour,Ten_Loai_Tour) VALUES ('LT03',N'Tour Miền Trung');
INSERT INTO Loai_Tour (Id_Loai_Tour,Ten_Loai_Tour) VALUES ('LT04',N'Tour Đặc Biệt');

-- Chèn dữ liệu Tour - Just Tour
INSERT [dbo].[Tour] ( [Ten_Tour], [Gia_Tour], [Lo_Trinh], [So_Luong_Khach], [Ngay_Di], [Ngay_Ve], [Thoi_Gian], [Phuong_Tien], [Hinh], [Video],[Mo_Ta], [Id_Loai_Tour], [Is_Delete]) VALUES ( N'Sài Thành', '1000000', N'Quảng Ngãi - Đà Nẵng', '9', '2020/05/05','2020/05/12', N'7 ngày 6 đêm', N'Xe Đạp','','',N'Rất đẹp', 'LT00','0')
INSERT [dbo].[Tour] ( [Ten_Tour], [Gia_Tour], [Lo_Trinh], [So_Luong_Khach], [Ngay_Di], [Ngay_Ve], [Thoi_Gian], [Phuong_Tien], [Hinh], [Video],[Mo_Ta], [Id_Loai_Tour], [Is_Delete]) VALUES ( N'Quảng Ngãi', '12000000', N'HCM - Sóc Trăng', '5', '2020/06/06','2020/06/12', N'6 ngày 5 đêm', N'Xe Lu','','',N'Rất đẹp', 'LT03','0')
INSERT [dbo].[Tour] ( [Ten_Tour], [Gia_Tour], [Lo_Trinh], [So_Luong_Khach], [Ngay_Di], [Ngay_Ve], [Thoi_Gian], [Phuong_Tien], [Hinh], [Video],[Mo_Ta], [Id_Loai_Tour], [Is_Delete]) VALUES ( N'Hà Nội', '16000000', N'Vũng Tàu - Cà Mau', '8', '2020/07/07','2020/07/15', N'8 ngày 7 đêm', N'Cano','','',N'Rất đẹp', 'LT04','0')
INSERT [dbo].[Tour] ( [Ten_Tour], [Gia_Tour], [Lo_Trinh], [So_Luong_Khach], [Ngay_Di], [Ngay_Ve], [Thoi_Gian], [Phuong_Tien], [Hinh], [Video],[Mo_Ta], [Id_Loai_Tour], [Is_Delete]) VALUES ( N'Cà mau', '10000000', N'HCM - Hà Nội', '15', '2020/08/05','2020/08/15', N'10 ngày 9 đêm', N'Máy Bay','','',N'Rất đẹp', 'LT01','0')
INSERT [dbo].[Tour] ( [Ten_Tour], [Gia_Tour], [Lo_Trinh], [So_Luong_Khach], [Ngay_Di], [Ngay_Ve], [Thoi_Gian], [Phuong_Tien], [Hinh], [Video],[Mo_Ta], [Id_Loai_Tour], [Is_Delete]) VALUES ( N'Bắc Giang', '1000000', N'Cà Mau', '5', '2020/09/05','2020/09/12', N'7 ngày 6 đêm', N'Xuồng','','',N'Rất đẹp', 'LT02','0')
-- Chèn dữ liệu DonTour - Đơn Tour
INSERT [dbo].[Don_Tour] ( [Ngay_Dat], [Ma_Tour], [Ma_Khach_Hang], [Ma_Nhan_Vien], [Gia_Tour], [So_Luong_Khach], [Trang_Thai_Thanh_Toan], [Trang_Thai_Duyet_Don], [Ghi_Chu]) VALUES ( '2020/05/04 00:00:00', '1','kh1', 'nv1', '1000000', '10','1', '1', '')
INSERT [dbo].[Don_Tour] ( [Ngay_Dat], [Ma_Tour],[Ma_Khach_Hang], [Ma_Nhan_Vien], [Gia_Tour], [So_Luong_Khach], [Trang_Thai_Thanh_Toan], [Trang_Thai_Duyet_Don], [Ghi_Chu]) VALUES ( '2020/06/04 00:00:00', '2','kh2', 'nv2', '15000000', '15','1', '1', '')
INSERT [dbo].[Don_Tour] ( [Ngay_Dat], [Ma_Tour],[Ma_Khach_Hang], [Ma_Nhan_Vien], [Gia_Tour], [So_Luong_Khach],[Trang_Thai_Thanh_Toan], [Trang_Thai_Duyet_Don], [Ghi_Chu]) VALUES ( '2020/07/04 00:00:00', '3','kh3', 'nv3', '16000000', '20','1', '0', '')
INSERT [dbo].[Don_Tour] ( [Ngay_Dat], [Ma_Tour],[Ma_Khach_Hang], [Ma_Nhan_Vien], [Gia_Tour], [So_Luong_Khach], [Trang_Thai_Thanh_Toan], [Trang_Thai_Duyet_Don], [Ghi_Chu]) VALUES ( '2020/08/04 00:00:00', '4','kh4', 'nv4', '12000000', '15','1', '1', '')
INSERT [dbo].[Don_Tour] ( [Ngay_Dat], [Ma_Tour],[Ma_Khach_Hang], [Ma_Nhan_Vien], [Gia_Tour], [So_Luong_Khach], [Trang_Thai_Thanh_Toan], [Trang_Thai_Duyet_Don], [Ghi_Chu]) VALUES ( '2020/09/04 00:00:00', '5','kh5', 'nv5', '10000000', '10','1', '-1', '')

-- Chèn dữ liệu ThongTinDuKhach - Thông tin du khách
INSERT [dbo].[Thong_Tin_Du_Khach] ([Ma_Don_Tour], [Cmnd], [Hinh], [SDT_Zalo], [Ten_Du_Khach], [So_Thu_Tu]) VALUES ('1', '212843470','', '0123456789', N'Nguyễn Hữu Phúc', '1')
INSERT [dbo].[Thong_Tin_Du_Khach] ([Ma_Don_Tour], [Cmnd], [Hinh], [SDT_Zalo], [Ten_Du_Khach], [So_Thu_Tu]) VALUES ('2', '212874629','', '0123456789', N'Trần Minh Nhân', '1')
INSERT [dbo].[Thong_Tin_Du_Khach] ([Ma_Don_Tour], [Cmnd], [Hinh], [SDT_Zalo], [Ten_Du_Khach], [So_Thu_Tu]) VALUES ('3', '212087472','', '0123456789', N'Cao Hoàng Nhật', '1')
INSERT [dbo].[Thong_Tin_Du_Khach] ([Ma_Don_Tour], [Cmnd], [Hinh], [SDT_Zalo], [Ten_Du_Khach], [So_Thu_Tu]) VALUES ('4', '212826485','', '0123456789', N'Phùng Bá', '1')
INSERT [dbo].[Thong_Tin_Du_Khach] ([Ma_Don_Tour], [Cmnd], [Hinh], [SDT_Zalo], [Ten_Du_Khach], [So_Thu_Tu]) VALUES ('5', '212102837','', '0123456789', N'Mỹ Duyên', '1')