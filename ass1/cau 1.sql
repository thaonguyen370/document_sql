CREATE DATABASE IF NOT EXISTS test;
-- tao bang khach hang
CREATE TABLE Khach_Hang(
   Ma_KH   INT  AUTO_INCREMENT     NOT NULL,
   Ten_KH VARCHAR (20)     NOT NULL,
   Phone_No  VARCHAR(20)    NOT NULL,
   Ghi_Chu  VARCHAR(20) ,
        
   PRIMARY KEY (Ma_KH)
);
-- tao bang san pham
CREATE TABLE San_Pham(
   Ma_SP   INT  AUTO_INCREMENT    NOT NULL,
   Ten_SP VARCHAR (20)     NOT NULL,
   Don_Gia  INT              NOT NULL,
   Ma_KH  INT                NOT NULL,      
   PRIMARY KEY (Ma_SP),
   FOREIGN KEY (Ma_KH) REFERENCES khach_hang(Ma_KH)
    
);

-- tao bang don hang
CREATE TABLE Don_hang(
   Ma_DH   INT  AUTO_INCREMENT         NOT NULL,
   Ngay_DH date     NOT NULL,
   Ma_SP  INT              NOT NULL,
   So_Luong  INT ,
        
   PRIMARY KEY (Ma_DH),
   FOREIGN KEY (Ma_SP) REFERENCES san_pham(Ma_SP)
);
-- insert khach hang
INSERT INTO Khach_Hang(Ma_KH,Ten_KH,Phone_No,Ghi_Chu)
VALUES (null, 'nguyen van teo', '0987028610', 'khach vip' );

INSERT INTO Khach_Hang(Ma_KH,Ten_KH,Phone_No,Ghi_Chu)
VALUES (null, 'nguyen van ti', '0987028610', 'khach vip' );

INSERT INTO Khach_Hang(Ma_KH,Ten_KH,Phone_No,Ghi_Chu)
VALUES (null, 'nguyen van mit', '0987028610', 'khach vip' );

INSERT INTO Khach_Hang(Ma_KH,Ten_KH,Phone_No,Ghi_Chu)
VALUES (null, 'nguyen van buoi', '0987028610', 'khach vip' );

INSERT INTO Khach_Hang (Ma_KH,Ten_KH,Phone_No,Ghi_Chu)
VALUES (null, 'nguyen van cam', '0987028610', 'khach vip' );

-- INSERT san pham
INSERT INTO San_Pham (Ma_SP,Ten_SP,Don_Gia,Ma_KH)
VALUES (null, 'xe dap nhat', 1000, 1 );
INSERT INTO San_Pham (Ma_SP,Ten_SP,Don_Gia,Ma_KH)
VALUES (null, 'xe dap thai', 1000, 2 );
INSERT INTO San_Pham (Ma_SP,Ten_SP,Don_Gia,Ma_KH)
VALUES (null, 'xe dap viet nam', 1000, 3 );

-- inser hoa don

INSERT INTO Don_hang (Ma_DH,Ngay_DH,Ma_SP,So_Luong)
VALUES (null, '2005/10/10', 1, 4 );

INSERT INTO Don_hang (Ma_DH,Ngay_DH,Ma_SP,So_Luong)
VALUES (null, '2005/11/10', 2, 5 );

INSERT INTO Don_hang (Ma_DH,Ngay_DH,Ma_SP,So_Luong)
VALUES (null, '2008/10/10', 3, 2 );


-- 1b
-- 1b
 CREATE VIEW oder_view AS
SELECT Ten_KH, Ngay_DH, Ten_SP, So_Luong, (san_pham.Don_Gia*don_hang.So_Luong) AS Thanh_Tien
FROM  don_hang, san_pham,khach_hang
where don_hang.Ma_SP= san_pham.Ma_SP and khach_hang.Ma_KH= san_pham.Ma_SP;


