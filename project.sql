create database project;




CREATE TABLE account (
    idAccount INT(11) AUTO_INCREMENT PRIMARY KEY,
    accountName VARCHAR(100),
    password VARCHAR(15),
    email VARCHAR(200),
    phoneNumber VARCHAR(200),
    identifyCard VARCHAR(100),
    surname VARCHAR(20),
    name VARCHAR(50),
    nickName VARCHAR(100),
    status ENUM('Active', 'Inactive', 'Block', 'Vip')
);
CREATE TABLE role (
    idRole INT(11) AUTO_INCREMENT PRIMARY KEY,
    nameRole VARCHAR(100)
);
CREATE TABLE account_role (
    accountRoleId INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT(11),
    role_id INT(11)
);
-- Add foreign key constraint to account_role table
ALTER TABLE account_role
ADD FOREIGN KEY (account_id) REFERENCES account(idAccount),
ADD FOREIGN KEY (role_id) REFERENCES role(idRole);


INSERT INTO role (nameRole) VALUES ('admin');
INSERT INTO role (nameRole) VALUES ('serviceProviders');
INSERT INTO role (nameRole) VALUES ('user');
-- truncate table account;
-- truncate table account_role;
-- truncate table account_service;
-- truncate table role;
-- truncate table detail_account;
SET FOREIGN_KEY_CHECKS = 0;
-- tắt khóa ngoại để xóa bảng.xóa thông tin
SET FOREIGN_KEY_CHECKS = 1;
-- bật lại
INSERT INTO account ( accountName, password, email,phoneNumber, identifyCard, surname, name,nickName, status) VALUES
-- Đây là admin của web,bạn cần phải nhập đúng tên và pass để đăng nhập vào account và xem được các list.chỉ duy nhất 1 account này mới có thể xem được list
('Admin', '12345', 'HoangPhan@gmail.com', '0329673321', '1200211231', 'Phan', 'Hoàng', 'Phan Hòn' ,'Active'),

('TrMy', '12345', 'Mybe@gmail.com', '03576642445', '1200322424', 'Trần', 'My', 'Skieys',  'Inactive'),
('Sangtr', '12345', 'TranBeo@gmail.com', '03698843234', '1200234443', 'Trần', 'Sang', 'Trần Béo', 'Active'),
('MaiDora', '12345', 'MaiTran@gmail.com', '0399013321', '1200224879', 'Trần', 'Mai', 'DoRa',  'Vip'),
('PhamPhong', '12345', 'ConLoc@gmail.com', '0329946564', '1200213316', 'Phạm', 'Phong', 'LocXoay','Active'),
('NgoccE', '12345', 'PhuongNgoc@gmail.com', '0357763213', '1200231309', 'Trần', 'Ngọc', 'Rennie','Block'),
('DesMonD', '12345', 'DesHi@gmail.com', '03876656451', '1200441298', 'Nguyễn', 'Hiếu', 'Lifie',  'Inactive'),
('CuongPham', '12345', 'VuCuowng@gmail.com', '0376655465', '1200233134', 'Vũ', 'Cường', 'PapaPap',  'Active'),
('LiemVie', '12345', 'LiemPham@gmail.com', '0359943342', '1200443245', 'Phạm', 'Liêm', 'Beaf', 'Active'),
('Huong', '12345', 'Huong@gmail.com', '03476691792', '1200998475', 'Nguyễn', 'Hường', 'Bé Hường',  'Vip'),
('MinhDuc', '12345', 'NguyenDuc@gmail.com', '03675547731', '1200113243', 'Nguyễn', 'Đức', 'Blue Duck','Active'),
('NgTung', '12345', 'Tung23@gmail.com', '09698871987', '1200244312', 'Nguyễn', 'Tùng', 'Wolf', 'Active'),
('KienDD' , '12345' , 'Kien@gmail.com', '0374464552' , '1200123332', 'Trần' , 'Kiên', 'Kiên Đá' , 'Active'),
('Hoa1' , '12345' , 'HoaTae@gmail.com', '0311332454' , '1200123949', 'Trần' , 'Hoa', 'Hoa Sữa' , 'Inactive'),
('HungCoi' , '12345' , 'Hung1123@gmail.com', '0388984556' , '1200331234', 'Nguyễn' , 'Hùng', 'Hùng Hay Ho' , 'Block'),
('VuxG' , '12345' , 'Guitar@gmail.com', '0374494912' , '120022314', 'Đỗ' , 'Vũ', 'Vũ Acoustic' , 'Vip'),
('Truong25' , '12345' , 'TrTruo@gmail.com', '03676696463' , '120044324', 'Trần' , 'Trường', 'TrTruo' , 'Active'),
('TienGG', '12345','gg@gmail.com' , '0977459768', '120019893', 'Nguyễn' , 'Tiến' , 'Golden Wing' , 'Vip'),
('HgCoi' , '12345' , 'HoangCoi@gmail.com', '0354456456' , '120011233', 'Nguyễn' , 'Hoàng', 'Cối' , 'Active'),
('QuyenBooie' , '12345' , 'LeNgocQuyen@gmail.com', '0367446352' , '120023113', 'Lê' , 'Quyên', 'Booie' , 'Inactive'),
('Mee' , '12345' , 'MeeNe@gmail.com', '037423313' , '120012231', 'Phạm' , 'My', 'Mee' , 'Vip'),
('ViAn' , '12345' , 'AnPham@gmail.com', '03445323321' , '1200113232', 'Phạm' , 'An', 'ViAn' , 'Active'),
('VAnh' , '12345' , 'VietAnh@gmail.com', '0372223415' , '1200121311', 'Trần' , 'Việt Anh', 'VAnh' , 'Block'),
('KhIem123' , '12345' , 'KhIem1@gmail.com', '097774676' , '1200231134', 'Vũ' , 'Khiêm', 'KhIem' , 'Inactive'),
('HapAD' , '12345' , 'HapAD@gmail.com', '0367443453' , '1200123133', 'Trần' , 'Hoàng Anh', 'HapAD' , 'Inactive'),
('LynLe' , '12345' , 'Lyn@gmail.com', '032234342' , '1200123323', 'Lê' , 'Linh', 'Lyn' , 'Active'),
('HoBaBa' , '12345' , 'HoBa@gmail.com', '0355456434' , '1200133233', 'Hoàng' , 'Bảo', 'HoBa' , 'Vip'),
('KymTree' , '12345' , 'Kin@gmail.com', '0373424542' , '1200123244', 'Mai' , 'Chi', 'KymTree' , 'Active'),
('KhanhBuBu' , '12345' , 'BuBU@gmail.com', '0322341234' , '1200124432', 'Phạm' , 'Khánh', 'BuUBu' , 'Active'),
('HoagSoi' , '12345' , 'HoangSoi@gmail.com', '033323134' , '1200124132', 'Vũ' , 'Hoàng', 'SỏiAB' , 'Block'),
('Vux' , '12345' , 'Vux@gmail.com', '0374433234' , '1200123233', 'Nguyễn' , 'Vũ', 'Vux' , 'Inactive'),
('TrKhai' , '12345' , 'Khair@gmail.com', '0374334234' , '1200133424', 'Trần' , 'Khải', 'Khải Huyền' , 'Active'),
('MinhHuyen' , '12345' , 'Vux@gmail.com', '0374433234' , '1200123233', 'Nguyễn' , 'Vũ', 'Vux' , 'Active'),
('KimNgoc' , '12345' , 'Khair@gmail.com', '0374334234' , '1200133424', 'Trần' , 'Khải', 'Khải Huyền' , 'Active'),
('MinhMinh' , '12345' , 'Vux@gmail.com', '0374433234' , '1200123233', 'Nguyễn' , 'Vũ', 'Vux' , 'Active'),
('NguyenDiep' , '12345' , 'Khair@gmail.com', '0374334234' , '1200133424', 'Trần' , 'Khải', 'Khải Huyền' , 'Active'),
('NguyenMym' , '12345' , 'Vux@gmail.com', '0374433234' , '1200123233', 'Nguyễn' , 'Vũ', 'Vux' , 'Active'),
('Diepdiep' , '12345' , 'Khair@gmail.com', '0374334234' , '1200133424', 'Trần' , 'Khải', 'Khải Huyền' , 'Active'),
('Khakha' , '12345' , 'Vux@gmail.com', '0374433234' , '1200123233', 'Nguyễn' , 'Vũ', 'Vux' , 'Active'),
('HanhNguyen' , '12345' , 'Khair@gmail.com', '0374334234' , '1200133424', 'Trần' , 'Khải', 'Khải Huyền' , 'Active');
INSERT INTO account_role (  account_id, role_id) VALUES
(1,1),
(2,2),
(3,3),
(4,2),
(5,3),
(6,2),
(7,3),
(8,2),
(9,3),
(10,2),
(11,3),
(12,2),
(13,3),
(14,2),
(15,3),
(16,2),
(17,3),
(18,2),
(19,3),
(20,2),
(21,3),
(22,2),
(23,3),
(24,2),
(25,3),
(26,2),
(27,3),
(28,2),
(29,3),
(30,2),
(31,3),
(32,2),
(33,2),
(34,2),
(35,2),
(36,2),
(37,2),
(38,2),
(39,2),
(40,2);
CREATE TABLE detail_Account (
    idDetail INT(11) AUTO_INCREMENT PRIMARY KEY,
    dateOfBirth DATE,
    fullName VARCHAR(100),
    gender VARCHAR(100),
    city VARCHAR(200),
    nationality VARCHAR(200),
    avatar VARCHAR(500),
    portrait VARCHAR(500),
    portrait1 VARCHAR(500),
    portrait2 VARCHAR(500),
    height VARCHAR(100),
    weight VARCHAR(100),
    interest VARCHAR(100),
    describeYourself VARCHAR(100),
    regulations VARCHAR(100),
    facebook VARCHAR(100),
    joinDate DATE,
    numberOfRentals INT,
    account_id INT(11),
  
    view INT
);
ALTER TABLE  detail_Account 
ADD FOREIGN KEY (account_id ) REFERENCES account(idAccount);
-- Bảng danh mục dịch vụ
CREATE TABLE service_Category (
    idServiceCategory INT(11) AUTO_INCREMENT PRIMARY KEY,
    serviceNameCategory VARCHAR(100)
);
CREATE TABLE account_serviceCategory (
    accountService INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT(11),
    serviceCategory_id INT(11)
);
ALTER TABLE account_serviceCategory
ADD FOREIGN KEY (account_id) REFERENCES account(idAccount),
ADD FOREIGN KEY (serviceCategory_id) REFERENCES service_Category(idServiceCategory);
-- tên các danh mục
insert into service_Category(serviceNameCategory ) values
('Introduce yourself to your family'),
('Introduce your friends'),
('Travel together with a group of friends'),
('Go out together'),
('Attend birthdays'),
('Chat offline'),
('Chat online'),
('Go in Tet holiday'),
('Going out on holidays'),
('Hold hand'),
('Say love'),
('Look at your eyes'),
(' Song'),
(' Kiss hands'),
('Hug'),
('Childish'),
('Intimate gesture'),
('Watch a movie ');

   INSERT INTO detail_Account (dateOfBirth, fullName, gender, city, nationality, avatar, portrait, portrait1, portrait2, height, weight, interest, describeYourself, regulations, facebook, joinDate, numberOfRentals, account_id,  view)
VALUES
    ('1989-06-01', 'Nguyen Thi Ngoc Mai ', 'Women', 'Ha Noi', 'Viet Nam', 'https://scontent.fhan14-4.fna.fbcdn.net/v/t1.6435-9/101698930_2676499632456682_6715767089166024704_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=7a1959&_nc_ohc=iRKTLxLEQZUAX8__2Zk&_nc_ht=scontent.fhan14-4.fna&oh=00_AfDM4cvuF1odBnQPpxZVZ8yeiGSbEj3Ax02BXH4l4sxTng&oe=65797C09', 'https://scontent.fhan14-4.fna.fbcdn.net/v/t1.6435-9/101698930_2676499632456682_6715767089166024704_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=7a1959&_nc_ohc=iRKTLxLEQZUAX8__2Zk&_nc_ht=scontent.fhan14-4.fna&oh=00_AfDM4cvuF1odBnQPpxZVZ8yeiGSbEj3Ax02BXH4l4sxTng&oe=65797C09', 'https://scontent.fhan14-4.fna.fbcdn.net/v/t1.6435-9/101698930_2676499632456682_6715767089166024704_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=7a1959&_nc_ohc=iRKTLxLEQZUAX8__2Zk&_nc_ht=scontent.fhan14-4.fna&oh=00_AfDM4cvuF1odBnQPpxZVZ8yeiGSbEj3Ax02BXH4l4sxTng&oe=65797C09', 'portrait2.jpg', '160cm', '55kg', 'Sports', 'I am an active person who enjoys outdoor activities.', 'I am looking for a friendly and open-minded partner.', 'https://www.facebook.com', '2022-09-01', 100, 4,  300),    
    ('1990-01-01', 'Nguyen Thi Phuong', 'Women', 'Ha Noi', 'Viet Nam', 'https://scontent.fhan14-3.fna.fbcdn.net/v/t39.30808-6/283481453_4734159563357335_2095439058941620403_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=5f2048&_nc_ohc=Y0NUdHOtiakAX-F40IG&_nc_ht=scontent.fhan14-3.fna&oh=00_AfByrdkMrf_-c1Pue9pCvNoz3eEcra8T5bDHQVKV7vZGWg&oe=65571435', 'https://scontent.fhan14-3.fna.fbcdn.net/v/t39.30808-6/283481453_4734159563357335_2095439058941620403_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=5f2048&_nc_ohc=Y0NUdHOtiakAX-F40IG&_nc_ht=scontent.fhan14-3.fna&oh=00_AfByrdkMrf_-c1Pue9pCvNoz3eEcra8T5bDHQVKV7vZGWg&oe=65571435', 'https://scontent.fhan14-3.fna.fbcdn.net/v/t39.30808-6/283481453_4734159563357335_2095439058941620403_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=5f2048&_nc_ohc=Y0NUdHOtiakAX-F40IG&_nc_ht=scontent.fhan14-3.fna&oh=00_AfByrdkMrf_-c1Pue9pCvNoz3eEcra8T5bDHQVKV7vZGWg&oe=65571435', 'https://scontent.fhan14-3.fna.fbcdn.net/v/t39.30808-6/283481453_4734159563357335_2095439058941620403_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=5f2048&_nc_ohc=Y0NUdHOtiakAX-F40IG&_nc_ht=scontent.fhan14-3.fna&oh=00_AfByrdkMrf_-c1Pue9pCvNoz3eEcra8T5bDHQVKV7vZGWg&oe=65571435', '160cm', '55kg', 'Sports', 'I am an active person who enjoys outdoor activities.', 'I am looking for a friendly and open-minded partner.', 'https://www.facebook.com', '2022-09-01', 230, 10, 400),    
    ('2004-07-04', 'Nguyen Tu Trinh', 'Women', 'Ho Chi Minh', 'Viet Nam', 'https://scontent.fhan14-3.fna.fbcdn.net/v/t1.6435-9/132347665_3240433176063322_2396129412640057491_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=7a1959&_nc_ohc=Adj872yqr3QAX94hhuq&_nc_ht=scontent.fhan14-3.fna&oh=00_AfCI7bNJIjOijs3sqMICEYM15vJvBGLovM2OuHICO93PsQ&oe=65798F3D', 'https://scontent.fhan14-3.fna.fbcdn.net/v/t1.6435-9/132347665_3240433176063322_2396129412640057491_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=7a1959&_nc_ohc=Adj872yqr3QAX94hhuq&_nc_ht=scontent.fhan14-3.fna&oh=00_AfCI7bNJIjOijs3sqMICEYM15vJvBGLovM2OuHICO93PsQ&oe=65798F3D', 'https://scontent.fhan14-3.fna.fbcdn.net/v/t1.6435-9/132347665_3240433176063322_2396129412640057491_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=7a1959&_nc_ohc=Adj872yqr3QAX94hhuq&_nc_ht=scontent.fhan14-3.fna&oh=00_AfCI7bNJIjOijs3sqMICEYM15vJvBGLovM2OuHICO93PsQ&oe=65798F3D', 'https://scontent.fhan14-3.fna.fbcdn.net/v/t1.6435-9/132347665_3240433176063322_2396129412640057491_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=7a1959&_nc_ohc=Adj872yqr3QAX94hhuq&_nc_ht=scontent.fhan14-3.fna&oh=00_AfCI7bNJIjOijs3sqMICEYM15vJvBGLovM2OuHICO93PsQ&oe=65798F3D', '170cm', '45kg', 'Sports', 'I am an active person who enjoys outdoor activities.', 'I am looking for a friendly and open-minded partner.', 'https://www.facebook.com', '2021-09-01', 90, 16,  350),  
    ('2005-04-05', 'Nguyen Ngoc', 'Women', 'Ha Noi', 'Viet Nam', 'https://scontent.fhan14-3.fna.fbcdn.net/v/t1.6435-9/118369812_2911721638934479_8700440516742376369_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=7a1959&_nc_ohc=oN65cstZpxgAX_0DTKq&_nc_oc=AQkCiR8Icd-qjvIOJaZLQ8EUV8xkMR97TUETdtd8B5LErat6GvuEJrpGCt4fIVYR99CEJzel9g0gfELw97EROb7c&_nc_ht=scontent.fhan14-3.fna&oh=00_AfA390I87CqVkz8sQ2ssSYH8EpK73VaxzI-8h1fHOcGABg&oe=65799B9D','https://scontent.fhan14-3.fna.fbcdn.net/v/t1.6435-9/118369812_2911721638934479_8700440516742376369_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=7a1959&_nc_ohc=oN65cstZpxgAX_0DTKq&_nc_oc=AQkCiR8Icd-qjvIOJaZLQ8EUV8xkMR97TUETdtd8B5LErat6GvuEJrpGCt4fIVYR99CEJzel9g0gfELw97EROb7c&_nc_ht=scontent.fhan14-3.fna&oh=00_AfA390I87CqVkz8sQ2ssSYH8EpK73VaxzI-8h1fHOcGABg&oe=65799B9D', 'https://scontent.fhan14-3.fna.fbcdn.net/v/t1.6435-9/118369812_2911721638934479_8700440516742376369_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=7a1959&_nc_ohc=oN65cstZpxgAX_0DTKq&_nc_oc=AQkCiR8Icd-qjvIOJaZLQ8EUV8xkMR97TUETdtd8B5LErat6GvuEJrpGCt4fIVYR99CEJzel9g0gfELw97EROb7c&_nc_ht=scontent.fhan14-3.fna&oh=00_AfA390I87CqVkz8sQ2ssSYH8EpK73VaxzI-8h1fHOcGABg&oe=65799B9D', 'https://scontent.fhan14-3.fna.fbcdn.net/v/t1.6435-9/118369812_2911721638934479_8700440516742376369_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=7a1959&_nc_ohc=oN65cstZpxgAX_0DTKq&_nc_oc=AQkCiR8Icd-qjvIOJaZLQ8EUV8xkMR97TUETdtd8B5LErat6GvuEJrpGCt4fIVYR99CEJzel9g0gfELw97EROb7c&_nc_ht=scontent.fhan14-3.fna&oh=00_AfA390I87CqVkz8sQ2ssSYH8EpK73VaxzI-8h1fHOcGABg&oe=65799B9D', '180cm', '75kg', 'Sports', 'I am an active person who enjoys outdoor activities.', 'I am looking for a friendly and open-minded partner.', 'https://www.facebook.com', '2022-01-01', 120, 18,120),  
    ('2006-03-06', 'Nguyen Thi Thao', 'Women', 'Nghe An', 'Viet Nam', 'https://scontent.fhan2-4.fna.fbcdn.net/v/t1.6435-9/100621766_2660065514100094_9186902211119022080_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=7a1959&_nc_ohc=EHppE6pdl2gAX_jFF7x&_nc_ht=scontent.fhan2-4.fna&oh=00_AfCHjvEdeU0QqjDUXaWMDLcgH8c9HEMksh4YTB1b6Iu1qw&oe=657984C6', 'https://scontent.fhan2-4.fna.fbcdn.net/v/t1.6435-9/100621766_2660065514100094_9186902211119022080_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=7a1959&_nc_ohc=EHppE6pdl2gAX_jFF7x&_nc_ht=scontent.fhan2-4.fna&oh=00_AfCHjvEdeU0QqjDUXaWMDLcgH8c9HEMksh4YTB1b6Iu1qw&oe=657984C6', 'https://scontent.fhan2-4.fna.fbcdn.net/v/t1.6435-9/100621766_2660065514100094_9186902211119022080_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=7a1959&_nc_ohc=EHppE6pdl2gAX_jFF7x&_nc_ht=scontent.fhan2-4.fna&oh=00_AfCHjvEdeU0QqjDUXaWMDLcgH8c9HEMksh4YTB1b6Iu1qw&oe=657984C6', 'https://scontent.fhan2-4.fna.fbcdn.net/v/t1.6435-9/100621766_2660065514100094_9186902211119022080_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=7a1959&_nc_ohc=EHppE6pdl2gAX_jFF7x&_nc_ht=scontent.fhan2-4.fna&oh=00_AfCHjvEdeU0QqjDUXaWMDLcgH8c9HEMksh4YTB1b6Iu1qw&oe=657984C6', '180cm', '75kg', 'Sports', 'I am an active person who enjoys outdoor activities.', 'I am looking for a friendly and open-minded partner.', 'https://www.facebook.com', '2023-04-01', 600, 21,780),   
    ('1990-05-07', 'Minh Phan', 'Women', 'Ha Noi','Viet Nam', 'https://scontent.fhan2-4.fna.fbcdn.net/v/t1.6435-9/92664704_2558948260878487_5047510493279813632_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=7a1959&_nc_ohc=X2mW4JozGeEAX_Serrk&_nc_ht=scontent.fhan2-4.fna&oh=00_AfCgcXatuKtxVSCB7fGncVc22L1rvvC7rCP93CRYspBgWg&oe=6579AC3A', 'https://scontent.fhan2-4.fna.fbcdn.net/v/t1.6435-9/92664704_2558948260878487_5047510493279813632_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=7a1959&_nc_ohc=X2mW4JozGeEAX_Serrk&_nc_ht=scontent.fhan2-4.fna&oh=00_AfCgcXatuKtxVSCB7fGncVc22L1rvvC7rCP93CRYspBgWg&oe=6579AC3A', 'https://scontent.fhan2-4.fna.fbcdn.net/v/t1.6435-9/92664704_2558948260878487_5047510493279813632_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=7a1959&_nc_ohc=X2mW4JozGeEAX_Serrk&_nc_ht=scontent.fhan2-4.fna&oh=00_AfCgcXatuKtxVSCB7fGncVc22L1rvvC7rCP93CRYspBgWg&oe=6579AC3A', 'https://scontent.fhan2-4.fna.fbcdn.net/v/t1.6435-9/92664704_2558948260878487_5047510493279813632_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=7a1959&_nc_ohc=X2mW4JozGeEAX_Serrk&_nc_ht=scontent.fhan2-4.fna&oh=00_AfCgcXatuKtxVSCB7fGncVc22L1rvvC7rCP93CRYspBgWg&oe=6579AC3A', '180cm', '75kg', 'Sports', 'I am an active person who enjoys outdoor activities.', 'I am looking for a friendly and open-minded partner.', 'https://www.facebook.com', '2022-11-05', 300, 27,  990),  
       ('2004-05-03', 'Nguyen Thi Ngoc Trinh ', 'Women', 'Ha Noi', 'Viet Nam', 'https://vtv1.mediacdn.vn/thumb_w/650/562122370168008704/2023/5/28/photo1685292972826-16852929730171992947727.jpg', 'https://vtv1.mediacdn.vn/thumb_w/650/562122370168008704/2023/5/28/photo1685292972826-16852929730171992947727.jpg', 'https://vtv1.mediacdn.vn/thumb_w/650/562122370168008704/2023/5/28/photo1685292972826-16852929730171992947727.jpg', 'https://vtv1.mediacdn.vn/thumb_w/650/562122370168008704/2023/5/28/photo1685292972826-16852929730171992947727.jpg', '160cm', '55kg', 'Sports', 'I am an active person who enjoys outdoor activities.', 'I am looking for a friendly and open-minded partner.', 'https://www.facebook.com', '2022-09-01', 700, 32,  400),    
    ('1890-08-01', 'Nguyen  Ngoc Huyen', 'Women', 'Ha Noi', 'Viet Nam', 'https://vtv1.mediacdn.vn/thumb_w/660/562122370168008704/2023/5/28/330354360516055093936218452139591474979619n-16852925140791621923371.jpg','https://vtv1.mediacdn.vn/thumb_w/660/562122370168008704/2023/5/28/330354360516055093936218452139591474979619n-16852925140791621923371.jpg', 'https://vtv1.mediacdn.vn/thumb_w/660/562122370168008704/2023/5/28/330354360516055093936218452139591474979619n-16852925140791621923371.jpg', 'https://vtv1.mediacdn.vn/thumb_w/660/562122370168008704/2023/5/28/330354360516055093936218452139591474979619n-16852925140791621923371.jpg', '160cm', '55kg', 'Sports', 'I am an active person who enjoys outdoor activities.', 'I am looking for a friendly and open-minded partner.', 'https://www.facebook.com', '2022-09-01', 100, 28,  500),    
    ('2002-05-01', 'Nguyet Minh Duc', 'Man', 'Ha Noi','Viet Nam', 'https://preview.redd.it/nh%E1%BB%AFng-m%E1%BA%ABu-%E1%BA%A3nh-trai-%C4%91%E1%BA%B9p-che-m%E1%BA%B7t-l%C3%A0m-ng%C6%B0%E1%BB%9Di-y%C3%AAu-l%C3%BD-t%C6%B0%E1%BB%9Fng-v0-10hde2imljba1.jpg?width=564&format=pjpg&auto=webp&s=811f0f4891e827df3fa5350a4da87aa5ed9d63b4', 'https://preview.redd.it/nh%E1%BB%AFng-m%E1%BA%ABu-%E1%BA%A3nh-trai-%C4%91%E1%BA%B9p-che-m%E1%BA%B7t-l%C3%A0m-ng%C6%B0%E1%BB%9Di-y%C3%AAu-l%C3%BD-t%C6%B0%E1%BB%9Fng-v0-10hde2imljba1.jpg?width=564&format=pjpg&auto=webp&s=811f0f4891e827df3fa5350a4da87aa5ed9d63b4', 'https://preview.redd.it/nh%E1%BB%AFng-m%E1%BA%ABu-%E1%BA%A3nh-trai-%C4%91%E1%BA%B9p-che-m%E1%BA%B7t-l%C3%A0m-ng%C6%B0%E1%BB%9Di-y%C3%AAu-l%C3%BD-t%C6%B0%E1%BB%9Fng-v0-10hde2imljba1.jpg?width=564&format=pjpg&auto=webp&s=811f0f4891e827df3fa5350a4da87aa5ed9d63b4', 'https://preview.redd.it/nh%E1%BB%AFng-m%E1%BA%ABu-%E1%BA%A3nh-trai-%C4%91%E1%BA%B9p-che-m%E1%BA%B7t-l%C3%A0m-ng%C6%B0%E1%BB%9Di-y%C3%AAu-l%C3%BD-t%C6%B0%E1%BB%9Fng-v0-10hde2imljba1.jpg?width=564&format=pjpg&auto=webp&s=811f0f4891e827df3fa5350a4da87aa5ed9d63b4','180cm', '75kg', 'Sports', 'I am an active person who enjoys outdoor activities.', 'I am looking for a friendly and open-minded partner.', 'https://www.facebook.com', '2022-11-05', 980, 33, 400),
    ('2002-05-01', 'Nguyet Van An', 'Man', 'Ha Noi','Viet Nam', 'https://inkythuatso.com/uploads/thumbnails/800/2022/03/anh-trai-dep-che-mat-33-31-13-32-52.jpg', 'https://inkythuatso.com/uploads/thumbnails/800/2022/03/anh-trai-dep-che-mat-33-31-13-32-52.jpg', 'https://inkythuatso.com/uploads/thumbnails/800/2022/03/anh-trai-dep-che-mat-33-31-13-32-52.jpg', 'https://inkythuatso.com/uploads/thumbnails/800/2022/03/anh-trai-dep-che-mat-33-31-13-32-52.jpg', '180cm', '75kg', 'Sports', 'I am an active person who enjoys outdoor activities.', 'I am looking for a friendly and open-minded partner.', 'https://www.facebook.com', '2022-11-05', 980, 34, 220),
    ('2002-05-01', 'Nguyet Tuan Hoang', 'Man', 'Ha Noi','Viet Nam', 'https://i.pinimg.com/564x/d6/1d/e0/d61de02218e574bd0f3b95459d774510.jpg', 'https://i.pinimg.com/564x/d6/1d/e0/d61de02218e574bd0f3b95459d774510.jpg', 'https://i.pinimg.com/564x/d6/1d/e0/d61de02218e574bd0f3b95459d774510.jpg', 'https://i.pinimg.com/564x/d6/1d/e0/d61de02218e574bd0f3b95459d774510.jpg', '180cm', '75kg', 'Sports', 'I am an active person who enjoys outdoor activities.', 'I am looking for a friendly and open-minded partner.', 'https://www.facebook.com', '2022-11-05', 680, 35,  400),
    ('2002-05-01', 'Nguyet Thanh Tung', 'Man', 'Ha Noi','Viet Nam', 'https://phongreviews.com/wp-content/uploads/2022/11/anh-trai-dep-che-mat-29.jpg', 'https://phongreviews.com/wp-content/uploads/2022/11/anh-trai-dep-che-mat-29.jpg', 'https://phongreviews.com/wp-content/uploads/2022/11/anh-trai-dep-che-mat-29.jpg', 'https://phongreviews.com/wp-content/uploads/2022/11/anh-trai-dep-che-mat-29.jpg', '180cm', '75kg', 'Sports', 'I am an active person who enjoys outdoor activities.', 'I am looking for a friendly and open-minded partner.', 'https://www.facebook.com', '2022-11-05', 180, 36,  100),   
    ('2004-12-02', 'Nguyet Viet Hoang', 'Man', 'Ho Chi Minh','Viet Nam', 'https://sohanews.sohacdn.com/2019/10/11/photo-2-15707867987161338454941.jpeg', 'https://sohanews.sohacdn.com/2019/10/11/photo-2-15707867987161338454941.jpeg', 'https://sohanews.sohacdn.com/2019/10/11/photo-2-15707867987161338454941.jpeg', 'https://sohanews.sohacdn.com/2019/10/11/photo-2-15707867987161338454941.jpeg', '180cm', '75kg', 'Sports', 'I am an active person who enjoys outdoor activities.', 'I am looking for a friendly and open-minded partner.', 'https://www.facebook.com', '2020-12-05', 190, 2,  200),
    ('2002-02-06', 'Nguyet Huy', 'Man', 'Ha Noi','Viet Nam', 'https://bsletranduy.com/wp-content/uploads/2021/09/trai-dep-che-mat-ngau.jpg', 'https://bsletranduy.com/wp-content/uploads/2021/09/trai-dep-che-mat-ngau.jpg', 'https://bsletranduy.com/wp-content/uploads/2021/09/trai-dep-che-mat-ngau.jpg', 'https://bsletranduy.com/wp-content/uploads/2021/09/trai-dep-che-mat-ngau.jpg', '180cm', '75kg', 'Sports', 'I am an active person who enjoys outdoor activities.', 'I am looking for a friendly and open-minded partner.', 'https://www.facebook.com', '2022-11-05', 180, 8,  500),
    ('2004-07-01', 'Minh Nguyen', 'Man', 'Ha Noi','Viet Nam', 'https://new.edu.vn/hinh-con-trai-dep-nhat/imager_4_21786_700.jpg', 'https://new.edu.vn/hinh-con-trai-dep-nhat/imager_4_21786_700.jpg', 'https://new.edu.vn/hinh-con-trai-dep-nhat/imager_4_21786_700.jpg', 'https://new.edu.vn/hinh-con-trai-dep-nhat/imager_4_21786_700.jpg', '180cm', '75kg', 'Sports', 'I am an active person who enjoys outdoor activities.', 'I am looking for a friendly and open-minded partner.', 'https://www.facebook.com', '2022-11-05', 280, 6, 300),
    ('2003-08-08', 'Phan Minh', 'Man', 'Ha Noi','Viet Nam', 'https://i.vietgiaitri.com/2022/1/20/viec-deo-khau-trang-thuc-su-co-anh-huong-toi-nhan-sac-cua-ban-that-day-ca4-6279152.jpg', 'https://i.vietgiaitri.com/2022/1/20/viec-deo-khau-trang-thuc-su-co-anh-huong-toi-nhan-sac-cua-ban-that-day-ca4-6279152.jpg', 'https://i.vietgiaitri.com/2022/1/20/viec-deo-khau-trang-thuc-su-co-anh-huong-toi-nhan-sac-cua-ban-that-day-ca4-6279152.jpg', 'https://i.vietgiaitri.com/2022/1/20/viec-deo-khau-trang-thuc-su-co-anh-huong-toi-nhan-sac-cua-ban-that-day-ca4-6279152.jpg', '180cm', '75kg', 'Sports', 'I am an active person who enjoys outdoor activities.', 'I am looking for a friendly and open-minded partner.', 'https://www.facebook.com', '2022-11-05', 680, 8,  200),

   ('2004-10-16', 'Tung Trinh', 'Man', 'Ho Chi Minh','Viet Nam', 'https://i.vietgiaitri.com/2021/1/12/xuat-hien-nam-than-khau-trang-phien-ban-viet-netizen-nang-nac-doi-xem-mat-de-biet-nhan-sac-that-nhu-the-nao-0b0-5511551.jpg', 'https://i.vietgiaitri.com/2021/1/12/xuat-hien-nam-than-khau-trang-phien-ban-viet-netizen-nang-nac-doi-xem-mat-de-biet-nhan-sac-that-nhu-the-nao-0b0-5511551.jpg', 'https://i.vietgiaitri.com/2021/1/12/xuat-hien-nam-than-khau-trang-phien-ban-viet-netizen-nang-nac-doi-xem-mat-de-biet-nhan-sac-that-nhu-the-nao-0b0-5511551.jpg', 'https://i.vietgiaitri.com/2021/1/12/xuat-hien-nam-than-khau-trang-phien-ban-viet-netizen-nang-nac-doi-xem-mat-de-biet-nhan-sac-that-nhu-the-nao-0b0-5511551.jpg', '180cm', '75kg', 'Sports', 'I am an active person who enjoys outdoor activities.', 'I am looking for a friendly and open-minded partner.', 'https://www.facebook.com', '2021-10-04', 190, 12, 100),
    ('2002-02-06', 'Bao Nguyen', 'Man', 'Ha Noi','Viet Nam', 'https://static2.yan.vn/YanNews/2167221/201912/dang-cap-trai-dep-vbts-deo-khau-trang-cung-khien-fan-luy-tim-443894a1.jpg', 'https://static2.yan.vn/YanNews/2167221/201912/dang-cap-trai-dep-vbts-deo-khau-trang-cung-khien-fan-luy-tim-443894a1.jpg', 'https://static2.yan.vn/YanNews/2167221/201912/dang-cap-trai-dep-vbts-deo-khau-trang-cung-khien-fan-luy-tim-443894a1.jpg', 'https://static2.yan.vn/YanNews/2167221/201912/dang-cap-trai-dep-vbts-deo-khau-trang-cung-khien-fan-luy-tim-443894a1.jpg', '180cm', '75kg', 'Sports', 'I am an active person who enjoys outdoor activities.', 'I am looking for a friendly and open-minded partner.', 'https://www.facebook.com', '2020-10-05', 180, 14,  400),
    ('2004-07-01', 'Hoang Nguyen', 'Man', 'Ho Chi Minh','Viet Nam', 'https://kenh14cdn.com/2019/10/11/kc2j4s51cvwajp903icutvkfpdmnteamdho09hyttpq-15707766656071112592163.jpg', 'https://kenh14cdn.com/2019/10/11/kc2j4s51cvwajp903icutvkfpdmnteamdho09hyttpq-15707766656071112592163.jpg', 'https://kenh14cdn.com/2019/10/11/kc2j4s51cvwajp903icutvkfpdmnteamdho09hyttpq-15707766656071112592163.jpg', 'https://kenh14cdn.com/2019/10/11/kc2j4s51cvwajp903icutvkfpdmnteamdho09hyttpq-15707766656071112592163.jpg', '180cm', '75kg', 'Sports', 'I am an active person who enjoys outdoor activities.', 'I am looking for a friendly and open-minded partner.', 'https://www.facebook.com', '2021-12-06', 280, 20,  200),
    ('2003-08-08', 'Tu Anh Nguyen', 'Man', 'Ha Noi','Viet Nam', 'https://kenh14cdn.com/2019/10/11/rgl9s6sgykdyfbkpjduizepurb9dicprlw0365cnn8-15707767571061522667505.jpg', 'https://kenh14cdn.com/2019/10/11/rgl9s6sgykdyfbkpjduizepurb9dicprlw0365cnn8-15707767571061522667505.jpg', 'https://kenh14cdn.com/2019/10/11/rgl9s6sgykdyfbkpjduizepurb9dicprlw0365cnn8-15707767571061522667505.jpg', 'https://kenh14cdn.com/2019/10/11/rgl9s6sgykdyfbkpjduizepurb9dicprlw0365cnn8-15707767571061522667505.jpg', '180cm', '75kg', 'Sports', 'I am an active person who enjoys outdoor activities.', 'I am looking for a friendly and open-minded partner.', 'https://www.facebook.com', '2023-11-15', 880, 22, 200),

   ('2001-06-06', 'Kim Nguyen', 'Women', 'Ha Noi','Viet Nam', 'https://icdn.dantri.com.vn/thumb_w/640/2019/09/19/thieu-nu-ha-thanh-xinh-nhu-hoa-kiem-hang-chuc-trieu-dong-moi-thangdocx-1568904012863.jpeg', 'https://icdn.dantri.com.vn/thumb_w/640/2019/09/19/thieu-nu-ha-thanh-xinh-nhu-hoa-kiem-hang-chuc-trieu-dong-moi-thangdocx-1568904012863.jpeg', 'https://icdn.dantri.com.vn/thumb_w/640/2019/09/19/thieu-nu-ha-thanh-xinh-nhu-hoa-kiem-hang-chuc-trieu-dong-moi-thangdocx-1568904012863.jpeg', 'https://icdn.dantri.com.vn/thumb_w/640/2019/09/19/thieu-nu-ha-thanh-xinh-nhu-hoa-kiem-hang-chuc-trieu-dong-moi-thangdocx-1568904012863.jpeg', '180cm', '75kg', 'Sports', 'I am an active person who enjoys outdoor activities.', 'I am looking for a friendly and open-minded partner.', 'https://www.facebook.com', '2023-10-15', 880, 26,  200),
    ('2003-02-01', 'Ngoc Anh Nguyen', 'Women', 'Ho Chi Minh','Viet Nam', 'https://vnn-imgs-f.vgcloud.vn/2021/10/22/15/nhan-sac-con-gai-hotgirl-cao-1m53-cuc-xinh-cua-nsut-hoang-hai-2.jpg', 'https://vnn-imgs-f.vgcloud.vn/2021/10/22/15/nhan-sac-con-gai-hotgirl-cao-1m53-cuc-xinh-cua-nsut-hoang-hai-2.jpg', 'https://vnn-imgs-f.vgcloud.vn/2021/10/22/15/nhan-sac-con-gai-hotgirl-cao-1m53-cuc-xinh-cua-nsut-hoang-hai-2.jpg', 'https://vnn-imgs-f.vgcloud.vn/2021/10/22/15/nhan-sac-con-gai-hotgirl-cao-1m53-cuc-xinh-cua-nsut-hoang-hai-2.jpg', '180cm', '75kg', 'Sports', 'I am an active person who enjoys outdoor activities.', 'I am looking for a friendly and open-minded partner.', 'https://www.facebook.com', '2023-11-15', 500, 30,  100),
    ('2007-01-19', 'Minh Anh Nguyen', 'Women', 'Ha Noi','Viet Nam', 'https://images2.thanhnien.vn/Uploaded/thuyptt/2023_01_10/nhhh-dien-vien-5545.jpg', 'https://images2.thanhnien.vn/Uploaded/thuyptt/2023_01_10/nhhh-dien-vien-5545.jpg', 'https://images2.thanhnien.vn/Uploaded/thuyptt/2023_01_10/nhhh-dien-vien-5545.jpg', 'https://images2.thanhnien.vn/Uploaded/thuyptt/2023_01_10/nhhh-dien-vien-5545.jpg', '180cm', '75kg', 'Sports', 'I am an active person who enjoys outdoor activities.', 'I am looking for a friendly and open-minded partner.', 'https://www.facebook.com', '2023-11-15', 480, 37,  400),
    ('2005-08-02', 'Dương Ngoc', 'Women', 'Ha Noi','Viet Nam', 'https://newsmd2fr.keeng.vn/tiin/archive/imageslead/2022/09/11/68es0pehagz6i3zog7a98lqn5v8gu1cw.jpg', 'https://newsmd2fr.keeng.vn/tiin/archive/imageslead/2022/09/11/68es0pehagz6i3zog7a98lqn5v8gu1cw.jpg', 'https://newsmd2fr.keeng.vn/tiin/archive/imageslead/2022/09/11/68es0pehagz6i3zog7a98lqn5v8gu1cw.jpg', 'https://newsmd2fr.keeng.vn/tiin/archive/imageslead/2022/09/11/68es0pehagz6i3zog7a98lqn5v8gu1cw.jpg', '180cm', '75kg', 'Sports', 'I am an active person who enjoys outdoor activities.', 'I am looking for a friendly and open-minded partner.', 'https://www.facebook.com', '2023-11-15', 780, 38, 300);
--     lấy ra danh sách tài khoản có quyền 
SELECT 
    account.*, role.nameRole AS role_name
FROM
    account
        JOIN
    account_role ON account.idAccount = account_role.account_id
        JOIN
    role ON role.idRole = account_role.role_id
WHERE
    role.nameRole = 'user'
ORDER BY account.idAccount DESC;
       --     lấy ra danh sách tài khoản có quyền 
     
SELECT 
    account.*, role.idRole AS role_id
FROM
    account
        JOIN
    account_role ON account.idAccount = account_role.account_id
        JOIN
    role ON role.idRole = account_role.role_id
WHERE
    role.idRole = '2'
ORDER BY account.idAccount DESC;
--     lấy ra danh sách tài khoản có quyền 

SELECT 
    account.*, role.nameRole AS role_name
FROM
    account
        JOIN
    account_role ON account.idAccount = account_role.account_id
        JOIN
    role ON role.idRole = account_role.role_id
WHERE
    role.nameRole = 'serviceProviders'
ORDER BY account.idAccount DESC;
--     lấy ra danh sách tài khoản bị chặn

SELECT 
    *
FROM
    account
WHERE
    status = 'Block';
--     lấy ra các tài khoản trừ tài khoản có id =1
SELECT 
    *
FROM
    account
WHERE
    idAccount <> 1;
 



SELECT 
    idDetail,
    fullName,
    gender,
    avatar,
    interest,
    numberOfRentals
FROM
    detail_account
WHERE
    numberOfRentals
ORDER BY numberOfRentals DESC
LIMIT 12;
(SELECT 
    idDetail,
    fullName,
    gender,
    avatar,
    interest,
    numberOfRentals
FROM
    detail_account
WHERE
    gender = 'Man'
ORDER BY numberOfRentals DESC
LIMIT 4) UNION (SELECT 
    idDetail,
    fullName,
    gender,
    avatar,
    interest,
    numberOfRentals
FROM
    detail_account
WHERE
    gender = 'Women'
ORDER BY numberOfRentals DESC
LIMIT 8);


SELECT 
    *
FROM
    account
WHERE
    status = 'Vip';
-- lấy ra các tài khoản trong bảng thông tin chi tiết có quyền là CCDV và trạng thái hoạt động
SELECT 
    *
FROM
    detail_Account
        JOIN
    account_role ON detail_Account.account_id = account_role.account_id
        JOIN
    role ON account_role.role_id = role.idRole
        JOIN
    account ON account.idAccount = account_role.account_id
WHERE
    role.nameRole = 'serviceProviders'
        AND account.status = 'Active';     
-- Thêm 1 số dữ liệu mẫu vào bảng thông tin cá nhân

-- lấy ra 4 tài khoản Man và 8 tài khoản Women có idRole=2 là CCDV có lượng thuê nhiều nhất sắp xếp từ cao đến thấp
(SELECT 
    da.*
FROM
    detail_Account da
        JOIN
    account acc ON da.account_id = acc.idAccount
        JOIN
    account_role ar ON acc.idAccount = ar.account_id
        JOIN
    role r ON ar.role_id = r.idRole
WHERE
    da.gender = 'Man' AND r.idRole = 2
LIMIT 4) UNION (SELECT 
    da.*
FROM
    detail_Account da
        JOIN
    account acc ON da.account_id = acc.idAccount
        JOIN
    account_role ar ON acc.idAccount = ar.account_id
        JOIN
    role r ON ar.role_id = r.idRole
WHERE
    da.gender = 'Women' AND r.idRole = 2
LIMIT 8) ORDER BY numberOfRentals DESC;
 -- Thêm 1 số dữ liệu mẫu vào bảng thông tin cá nhân 


    
-- xóa 1 tài khoản có id được chỉ định trong bảng thông tin 
DELETE FROM detail_account 
WHERE
    idDetail = '42';
-- lấy ra 6 tài khoản có view cao nhất với idRole=2=CCDV
SELECT 
    da.*
FROM
    detail_Account da
        JOIN
    account acc ON da.account_id = acc.idAccount
        JOIN
    account_role ar ON acc.idAccount = ar.account_id
        JOIN
    role r ON ar.role_id = r.idRole
WHERE
    r.idRole = 2
ORDER BY view DESC
LIMIT 6;
-- lấy ra 12 tài khoản mới đăng ký có idRole=2=CCDV
SELECT 
    da.*
FROM
    detail_Account da
        JOIN
    account acc ON da.account_id = acc.idAccount
        JOIN
    account_role ar ON acc.idAccount = ar.account_id
        JOIN
    role r ON ar.role_id = r.idRole
WHERE
    r.idRole = 2
ORDER BY joinDate DESC
LIMIT 12;
SELECT 
    da.*
FROM
    detail_Account da
        JOIN
    account acc ON da.account_id = acc.idAccount
        JOIN
    account_role ar ON acc.idAccount = ar.account_id
        JOIN
    role r ON ar.role_id = r.idRole
WHERE
    da.gender = 'Man' AND r.idRole = 2
LIMIT 12;
SELECT 
    da.*
FROM
    detail_Account da
        JOIN
    account acc ON da.account_id = acc.idAccount
        JOIN
    account_role ar ON acc.idAccount = ar.account_id
        JOIN
    role r ON ar.role_id = r.idRole
WHERE
    da.gender = 'Women' AND r.idRole = 2
LIMIT 12;
--  lấy ra tất cả các tài khoản có đăng ký thông tin cá nhân và quyền 
SELECT 
    account.*,
    role.idRole AS role_id,
    role.nameRole AS role_name,
    detail_Account.*
FROM
    account
        JOIN
    account_role ON account.idAccount = account_role.account_id
        JOIN
    role ON role.idRole = account_role.role_id
        LEFT JOIN
    detail_Account ON account.idAccount = detail_Account.account_id;

insert into account (accountName, password, email, phoneNumber, identifyCard, surname, name, nickName, status) values
    ('Lyly', '12345', 'lypham@gmail.com', '0356789234', '0012033210', 'Phạm', 'Ly', 'Lyy', 'Block'),
    ('Huehoang', '12345', 'hue@gmail.com', '0356939234', '0045033210', 'Hoàng', 'Huế', 'HeuPing', 'Inactive'),
    ('Trlan', '12345', 'lantran@gmail.com', '0356145634', '0078923210', 'Trần', 'Lan', 'Lanlun', 'Block'),
    ('MAnh', '12345', 'maianh@gmail.com', '0356788451', '0012033456', 'Nguyễn', 'Anh', 'Manh', 'Inactive'),
    ('DuyenNg', '12345', 'duyenphan@gmail.com', '0325874234', '0036913210', 'Phan', 'Duyên', 'Duyen', 'Block'),
    ('Thuphan', '12345', 'phanthu@gmail.com', '0356147834', '0013698210', 'Phan', 'Thu', 'Thubeaty', 'Inactive'),
    ('DoanBa', '12345', 'doannguyen@gmail.com', '0965789234', '0036933210', 'Nguyễn', 'Đoàn', 'BaDoan', 'Block'),
    ('VanTien', '12345', 'tienvan@gmail.com', '0356747892', '0012032587', 'Nguyễn', 'Tiến', 'Vantien', 'Inactive'),
    ('Hiepga', '12345', 'hiepnguyen@gmail.com', '0965219234', '0012014597', 'Trần', 'Hiệp', 'Hiepga', 'Block'),
    ('TrTrinh', '12345', 'trantrinh@gmail.com', '0356325874', '0012033245', 'Trần', 'Trinh', 'Trinh', 'Inactive'),
    ('Thudao', '12345', 'daothu@gmail.com', '0954289234', '0011033210', 'Đào', 'Thư', 'Moon', 'Block'),
    ('Loanmine', '12345', 'laontran@gmail.com', '0356736544', '0045033210', 'Trần', 'Loan', 'Mine', 'Inactive'),
    ('Linhmei', '12345', 'linhpham@gmail.com', '0965489234', '0023033210', 'Phạm', 'Linh', 'Linhmei', 'Block'),
    ('Hienhin', '12345', 'dinhhien@gmail.com', '0356987534', '0034033210', 'Đinh', 'Hiền', 'Hienhien', 'Inactive'),
    ('Ngocmai', '12345', 'ngocmai@gmail.com', '0356727834', '00452033210', 'Phạm', 'Mai', 'Nmai', 'Block'),
    ('Nhinhi', '12345', 'nhinguyen@gmail.com', '0314589234', '0003563210', 'Nguyễn', 'Nhi', 'Nhiii', 'Inactive'),
    ('Thanhtruc', '12345', 'thanhtruc@gmail.com', '0632589234', '004783210', 'Nguyễn', 'Trúc', 'Bambo', 'Block'),
    ('Quynhnhu', '12345', 'nhunguyen@gmail.com', '0966789234', '0048033210', 'Nguyễn', 'Như', 'Quynhnhu', 'Inactive'),
    ('Phucgia', '12345', 'giaphuc@gmail.com', '0986789234', '0089033210', 'Phan', 'Phúc', 'GiaPuc', 'Block'),
    ('Minhhieu', '12345', 'nguyenhieu@gmail.com', '0354259234', '0045033210', 'Nguyễn', 'Hiếu', 'Hieubo', 'Inactive');
insert into detail_Account (dateOfBirth, fullName, gender, city, nationality, avatar, portrait, portrait1, portrait2, height, weight, interest, describeYourself, regulations, facebook, joinDate, numberOfRentals, account_id, view ) values
    ('2000-09-12','Nguyễn Yến Nhi', 'Fermale', 'Hà Nội','Việt Nam', 'https://gaixinhbikini.com/wp-content/uploads/2023/02/anh-gai-dep-2k-005.jpg', 'https://gaixinhbikini.com/wp-content/uploads/2023/02/anh-gai-dep-2k-005.jpg', 'https://gaixinhbikini.com/wp-content/uploads/2023/02/anh-gai-dep-2k-005.jpg', 'https://gaixinhbikini.com/wp-content/uploads/2023/02/anh-gai-dep-2k-005.jpg', 'https://gaixinhbikini.com/wp-content/uploads/2023/02/anh-gai-dep-2k-005.jpg', '1m65', '49kg', 'Sports', 'I like watch movie and listen to music', 'friendly and happy','https://www.facebook.com', '2020-11-02', 750, 4, 1200),
    ('2003-08-15','Đào Thị Thư', 'Fermale', 'Hà Nội','Việt Nam', 'https://gaixinhbikini.com/wp-content/uploads/2022/08/885401fdf0a9a442fc983005ac42b97e.jpg', 'https://gaixinhbikini.com/wp-content/uploads/2023/02/anh-gai-dep-2k-005.jpg', 'https://gaixinhbikini.com/wp-content/uploads/2022/08/885401fdf0a9a442fc983005ac42b97e.jpg', 'https://gaixinhbikini.com/wp-content/uploads/2022/08/885401fdf0a9a442fc983005ac42b97e.jpg', '1m65', '49kg', 'Sports', 'I like watch movie and listen to music', 'friendly and happy','https://www.facebook.com', '2019-03-16', 800, 5, 600),
    ('2002-09-23','Phan Tâm Như', 'Fermale', 'Đà Nẵng','Việt Nam', 'https://cdnphoto.dantri.com.vn/YAfcu9nd4T5dX06hhpaf19_QvY8=/thumb_w/960/2021/05/15/co-gai-noi-nhu-con-vi-anh-can-cuoc-xinh-nhu-mong-nhan-sac-ngoai-doi-con-bat-ngo-hon-2-1621075314070.jpg', 'https://cdnphoto.dantri.com.vn/YAfcu9nd4T5dX06hhpaf19_QvY8=/thumb_w/960/2021/05/15/co-gai-noi-nhu-con-vi-anh-can-cuoc-xinh-nhu-mong-nhan-sac-ngoai-doi-con-bat-ngo-hon-2-1621075314070.jpg', 'https://gaixinhbikini.com/wp-content/uploads/2023/02/anh-gai-dep-2k-005.jpg', 'https://cdnphoto.dantri.com.vn/YAfcu9nd4T5dX06hhpaf19_QvY8=/thumb_w/960/2021/05/15/co-gai-noi-nhu-con-vi-anh-can-cuoc-xinh-nhu-mong-nhan-sac-ngoai-doi-con-bat-ngo-hon-2-1621075314070.jpg', '1m70', '52kg', 'Sports', 'I like watch movie and listen to music', 'friendly and happy','https://www.facebook.com', '2022-02-15', 842, 4, 1500),
('2001-09-12','Phạm Ánh Tuyết', 'Fermale', 'Hồ Chí MInh','Việt Nam', 'https://icdn.dantri.com.vn/thumb_w/640/2019/10/21/nu-sinh-bac-ninh-mac-dong-phuc-hut-anh-nhin-vi-nhan-sac-kha-aidocx-1571614825913.jpeg', 'https://gaixinhbikini.com/wp-content/uploads/2023/02/anh-gai-dep-2k-005.jpg', 'https://icdn.dantri.com.vn/thumb_w/640/2019/10/21/nu-sinh-bac-ninh-mac-dong-phuc-hut-anh-nhin-vi-nhan-sac-kha-aidocx-1571614825913.jpeg', 'https://icdn.dantri.com.vn/thumb_w/640/2019/10/21/nu-sinh-bac-ninh-mac-dong-phuc-hut-anh-nhin-vi-nhan-sac-kha-aidocx-1571614825913.jpeg', '1m60', '49kg', 'Sports', 'I like watch movie and listen to music', 'friendly and happy','https://www.facebook.com', '2021-10-02', 700, 4, 1200),
    ('2000-05-12','Đinh Thị Ngọc Hiền', 'Fermale', 'Quảng Ngãi','Việt Nam', 'https://cdn.diemnhangroup.com/seoulcenter/2022/11/gai-xinh-63.jpg', 'https://cdn.diemnhangroup.com/seoulcenter/2022/11/gai-xinh-63.jpg', 'https://cdn.diemnhangroup.com/seoulcenter/2022/11/gai-xinh-63.jpg', 'https://cdn.diemnhangroup.com/seoulcenter/2022/11/gai-xinh-63.jpg', '1m62', '47kg', 'Sports', 'I like watch movie and listen to music', 'friendly and happy','https://www.facebook.com', '2020-11-02', 750, 4, 1200),
    ('2003-03-25','Nguyễn Minh Hiếu', 'Male', 'Hà Nội','Việt Nam', 'https://hekhacbiet.com/wp-content/uploads/2022/12/46-hinh-anh-trai-dep-che-mat.jpg', 'https://hekhacbiet.com/wp-content/uploads/2022/12/46-hinh-anh-trai-dep-che-mat.jpg', 'https://hekhacbiet.com/wp-content/uploads/2022/12/46-hinh-anh-trai-dep-che-mat.jpg', 'https://hekhacbiet.com/wp-content/uploads/2022/12/46-hinh-anh-trai-dep-che-mat.jpg', '1m75', '60kg', 'Sports', 'I like watch movie and listen to music', 'friendly and happy','https://www.facebook.com', '2020-05-02', 600, 3, 600),
    ('2004-01-03','Phan Thị Linh', 'Fermale', 'Hà Nội','Việt Nam', 'https://raonhanh365.vn/pictures/detail/2022/08/16/3381247845172034560.jpg', 'https://raonhanh365.vn/pictures/detail/2022/08/16/3381247845172034560.jpg', 'https://raonhanh365.vn/pictures/detail/2022/08/16/3381247845172034560.jpg', 'https://raonhanh365.vn/pictures/detail/2022/08/16/3381247845172034560.jpg', '1m63', '46kg', 'Sports', 'I like watch movie and listen to music', 'friendly and happy','https://www.facebook.com', '20200-07-02', 760, 2, 1000),
('2002-04-12','Trần Bá Đoàn', 'Male', 'Hồ Chí Minh','Việt Nam', 'https://cdnphoto.dantri.com.vn/2U7_Bb-s9lanrzx_ghHgx3qrVrs=/thumb_w/990/2021/07/26/nam-sinh-ha-noi-dat-95-diem-van-dien-trai-nhu-dien-vien-dien-anhdocx-1627297592508.jpeg', 'https://cdnphoto.dantri.com.vn/2U7_Bb-s9lanrzx_ghHgx3qrVrs=/thumb_w/990/2021/07/26/nam-sinh-ha-noi-dat-95-diem-van-dien-trai-nhu-dien-vien-dien-anhdocx-1627297592508.jpeg', 'https://cdnphoto.dantri.com.vn/2U7_Bb-s9lanrzx_ghHgx3qrVrs=/thumb_w/990/2021/07/26/nam-sinh-ha-noi-dat-95-diem-van-dien-trai-nhu-dien-vien-dien-anhdocx-1627297592508.jpeg', 'https://cdnphoto.dantri.com.vn/2U7_Bb-s9lanrzx_ghHgx3qrVrs=/thumb_w/990/2021/07/26/nam-sinh-ha-noi-dat-95-diem-van-dien-trai-nhu-dien-vien-dien-anhdocx-1627297592508.jpeg', '1m72', '56kg', 'Sports', 'I like watch movie and listen to music', 'friendly and happy','https://www.facebook.com', '2021-01-14', 500, 5, 550),
    ('2003-06-15','Nguyễn Đặng Hưng', 'Male', 'Hà Nội','Việt Nam', 'https://haycafe.vn/wp-content/uploads/2022/02/Anh-trai-dep-anh-trai-dep-dau-nam-ngoi-tren-bai-co.jpg', 'https://haycafe.vn/wp-content/uploads/2022/02/Anh-trai-dep-anh-trai-dep-dau-nam-ngoi-tren-bai-co.jpg', 'https://haycafe.vn/wp-content/uploads/2022/02/Anh-trai-dep-anh-trai-dep-dau-nam-ngoi-tren-bai-co.jpg', 'https://haycafe.vn/wp-content/uploads/2022/02/Anh-trai-dep-anh-trai-dep-dau-nam-ngoi-tren-bai-co.jpg', '1m68', '51kg', 'Sports', 'I like watch movie and listen to music', 'friendly and happy','https://www.facebook.com', '2022-03-16', 450, 4, 440),
    ('2000-10-30','Trần Thị Thu Hương', 'Fermale', 'Hà Nội','Việt Nam', 'https://www.vietnamfineart.com.vn/wp-content/uploads/2023/07/gai-xinh-2k7-10-1.jpg', 'https://www.vietnamfineart.com.vn/wp-content/uploads/2023/07/gai-xinh-2k7-10-1.jpg', 'https://www.vietnamfineart.com.vn/wp-content/uploads/2023/07/gai-xinh-2k7-10-1.jpg', 'https://www.vietnamfineart.com.vn/wp-content/uploads/2023/07/gai-xinh-2k7-10-1.jpg', '1m55', '45kg', 'Sports', 'I like watch movie and listen to music', 'friendly and happy','https://www.facebook.com', '2023-01-23', 600, 4, 500);