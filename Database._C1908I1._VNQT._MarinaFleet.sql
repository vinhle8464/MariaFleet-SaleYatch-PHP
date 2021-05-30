create database Eproject character set utf8mb4 collate utf8mb4_unicode_ci;

use Eproject;

create table account
(
    id_acc      int(11) primary key auto_increment,
    user_name   nvarchar(50) ,
    password    text,
    email       varchar(100),
    phone       varchar(20),
    fullname    nvarchar(100),
    gender         varchar(10),
    dob         date,
    addr        nvarchar(255),
    photo_acc   text,
    admin       tinyint(1),
    status      tinyint(1) default 1
);

create table product
(
    id_pro          int(11) primary key auto_increment,
    photo           text,
    name_pro        nvarchar(100),
    price_pro       int(11),
    quantity_pro    int(4),
    status_pro      int(1),
    year_pro        int(4),
    code            varchar(20),
    status          tinyint(1) default 1
);

create table photos
(
    id_photo int(11) primary key auto_increment,
    id_pro      int(11),
    img        text
);

create table desc_pro
(
    id_desc   int(1) primary key auto_increment,
    id_pro int(11),
    info          text,
    featured      text,
    advanced        text,
    additional      text
);

create table configuration
(
    id_config       int(11) primary key auto_increment,
    id_pro          int(11),
    model           nvarchar(50),
    length_overall varchar(10),
    beam            varchar(10),
    draft_max       varchar(10),
    draft_min        varchar(20),
    bridge_clearance  varchar(20),
    deadrise        varchar(20),
    dry_weight       varchar(20),
    fuel_tanks       varchar(20),
    water_tanks      varchar(20),
    Production_materials  varchar(20),
    Exterior_design nvarchar(50),
    Interior_Design nvarchar(50),
    passenger_capacity varchar(20),
    cabins          varchar(10),
    manufacturer    nvarchar(50)

);


CREATE TABLE shopping_cart
(
    id_acc         int(11),
    id_pro        int(11),
    name_shop       nvarchar(200)  NOT NULL,
    price_shop      int(11) NOT NULL,
    quantity_shop   int(5)       NOT NULL,
    photo_shop      text    NOT NULL,
    primary key (id_acc, id_pro)
);

create table invoice
(
    id_inv              int(11) primary key auto_increment,
    id_acc              int(11),
    invoice_no          int(11),
    name_pro            nvarchar(50),
    date_purchase       datetime,
    total               int(11),
    status              tinyint(1) default 1
);


create table invoice_details
(
    id_inv              int(11),
    id_pro              int(11),
    invoice_no          int(11),
    photo_inv           text,
    name_pro            nvarchar(50),
    date_purchase    datetime,
    addr                nvarchar(255),
    phone               varchar(20),
    quantity            int(5),
    price               int(11),
    total               int(11),
    status              tinyint(1) default 1,
    primary key (id_inv,id_pro)
);

create table feedback
(
    id_feedback     int(11) primary key auto_increment,
    id_pro      int(11),
    id_acc      int(11),
    user_name   nvarchar(255),
    content     text,
    status      tinyint(1) default 1
);


alter table invoice
    add constraint FK_invoice_account
        foreign key (id_acc) references account(id_acc);

alter table shopping_cart
    add constraint FK_shopping_cart_account
        foreign key (id_acc) references account(id_acc);

alter table shopping_cart
    add constraint FK_shopping_cart_product
        foreign key (id_pro) references product(id_pro);

alter table invoice_details
    add constraint FK_invoice_detail_invoice
        foreign key (id_inv) references invoice(id_inv);

alter table invoice_details
    add constraint FK_invoice_detail_product
        foreign key (id_pro) references product(id_pro);

alter table photos
    add constraint FK_photos_product
        foreign key (id_pro) references product(id_pro);

alter table configuration
    add constraint FK_configuration_product
        foreign key (id_pro) references product(id_pro);

alter table desc_pro
    add constraint FK_desc_pro_product
        foreign key (id_pro) references product(id_pro);

alter table feedback
    add constraint FK_feedback_account
        foreign key (id_acc) references  account(id_acc);

alter table feedback
    add constraint FK_feedback_product
        foreign key (id_pro) references  product(id_pro);


insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('Azimut50-1.jpg','Azimut 50',9220,30,1,2017,'Travel');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('Azimut54- (4).jpg','Azimut 54',11930,30,1,2017,'Travel');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('Azimut55 (1).jpg','Azimut 55',12380,30,1,2018,'Travel');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('Azimut60 (10).jpg','Azimut 60',15750,30,1,2017,'Travel');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('Azimut66 (1.jpg','Azimut 66',19690,30,1,2017,'Travel');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('Azimut72 (12).jpg','Azimut 72',30900,30,1,2016,'Travel');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('Azimut80 (16).jpg','Azimut 80',41600,30,1,2016,'Travel');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('Magellano43 (13).jpg','Magellano 43',5170,30,1,2017,'Travel');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('Magellano53 (9).jpg','Magellano 53',99000,30,1,2017,'Travel');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('Magellano66 (13).jpg','Magellano 66',20820,30,1,2017,'Travel');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('Magellano76 (6).jpg','Magellano 76',3710,30,1,2017,'Travel');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('Atlantis34 (7).jpg','Atlantis 34',2180,30,1,2017,'Travel');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('Atlantis43 (3).jpg','Atlantis 43',4220,30,1,2017,'Travel');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('Atlantis51 (11).jpg','Atlantis 51',7870,30,1,2018,'Travel');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('Atlantis50 (7).jpg','Atlantis 50',6520,30,1,2017,'Travel');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('Azimut55s (15).jpg','Azimut 55s',12380,30,1,2017,'Travel');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('Azimuts6 (8).jpg','Azimut s6',14420,30,1,2017,'Travel');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('Azimuts7 (6).jpg','Azimut s7',22510,30,1,2017,'Travel');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('Azimut77s (18).jpg','Azimut 77s',33760,30,1,2017,'Travel');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('25 Metri (10).jpg','25 Metri',46140,30,1,2017,'Travel');

insert into photos(id_pro, img) values ( 1, 'Azimut50-2.jpg');
insert into photos(id_pro, img) values ( 1, 'Azimut50-3.jpg');
insert into photos(id_pro, img) values ( 1, 'Azimut50-4.jpg');
insert into photos(id_pro, img) values ( 1, 'Azimut50-5.jpg');
insert into photos(id_pro, img) values ( 1, 'Azimut50-6.jpg');
insert into photos(id_pro, img) values ( 1, 'Azimut50-7.jpg');
insert into photos(id_pro, img) values ( 1, 'Azimut50-8.jpg');
insert into photos(id_pro, img) values ( 1, 'Azimut50-9.jpg');
insert into photos(id_pro, img) values ( 1, 'Azimut50-10.jpg');
insert into photos(id_pro, img) values ( 1, 'Azimut50-11.jpg');
insert into photos(id_pro, img) values ( 1, 'Azimut50-12.jpg');
insert into photos(id_pro, img) values ( 1, 'Azimut50-13.jpg');
insert into photos(id_pro, img) values ( 1, 'Azimut50-14.jpg');
insert into photos(id_pro, img) values ( 1, 'Azimut50-15.jpg');
insert into photos(id_pro, img) values ( 1, 'Azimut50-16.jpg');
insert into photos(id_pro, img) values ( 1, 'Azimut50-17.jpg');
insert into photos(id_pro, img) values ( 1, 'Azimut50-18.jpg');
insert into photos(id_pro, img) values ( 1, 'Azimut50-19.jpg');
insert into photos(id_pro, img) values ( 1, 'Azimut50-20.jpg');
insert into photos(id_pro, img) values ( 1, 'Azimut50-21.jpg');
insert into photos(id_pro, img) values ( 1, 'Azimut50-22.jpg');

insert into photos(id_pro, img) values ( 2, 'Azimut54- (3).jpg');
insert into photos(id_pro, img) values ( 2, 'Azimut54- (4).jpg');
insert into photos(id_pro, img) values ( 2, 'Azimut54- (5).jpg');
insert into photos(id_pro, img) values ( 2, 'Azimut54- (6).jpg');
insert into photos(id_pro, img) values ( 2, 'Azimut54- (7).jpg');
insert into photos(id_pro, img) values ( 2, 'Azimut54- (8).jpg');
insert into photos(id_pro, img) values ( 2, 'Azimut54- (9).jpg');
insert into photos(id_pro, img) values ( 2, 'Azimut54- (10).jpg');
insert into photos(id_pro, img) values ( 2, 'Azimut54- (11).jpg');
insert into photos(id_pro, img) values ( 2, 'Azimut54- (12).jpg');
insert into photos(id_pro, img) values ( 2, 'Azimut54- (13).jpg');
insert into photos(id_pro, img) values ( 2, 'Azimut54- (14).jpg');
insert into photos(id_pro, img) values ( 2, 'Azimut54- (15).jpg');
insert into photos(id_pro, img) values ( 2, 'Azimut54- (16).jpg');
insert into photos(id_pro, img) values ( 2, 'Azimut54- (17).jpg');
insert into photos(id_pro, img) values ( 2, 'Azimut54- (18).jpg');
insert into photos(id_pro, img) values ( 2, 'Azimut54- (2).jpg');
insert into photos(id_pro, img) values ( 2, 'Azimut54- (19).jpg');
insert into photos(id_pro, img) values ( 2, 'Azimut54- (20).jpg');
insert into photos(id_pro, img) values ( 2, 'Azimut54- (21).jpg');
insert into photos(id_pro, img) values ( 2, 'Azimut54- (22).jpg');


insert into photos(id_pro, img) values ( 3, 'Azimut55 (3).jpg');
insert into photos(id_pro, img) values ( 3, 'Azimut55 (4).jpg');
insert into photos(id_pro, img) values ( 3, 'Azimut55 (5).jpg');
insert into photos(id_pro, img) values ( 3, 'Azimut55 (6).jpg');
insert into photos(id_pro, img) values ( 3, 'Azimut55 (7).jpg');
insert into photos(id_pro, img) values ( 3, 'Azimut55 (8).jpg');
insert into photos(id_pro, img) values ( 3, 'Azimut55 (9).jpg');
insert into photos(id_pro, img) values ( 3, 'Azimut55 (10).jpg');
insert into photos(id_pro, img) values ( 3, 'Azimut55 (11).jpg');
insert into photos(id_pro, img) values ( 3, 'Azimut55 (12).jpg');
insert into photos(id_pro, img) values ( 3, 'Azimut55 (13).jpg');
insert into photos(id_pro, img) values ( 3, 'Azimut55 (2).jpg');

insert into photos(id_pro, img) values ( 4, 'Azimut60 (8).jpg');
insert into photos(id_pro, img) values ( 4, 'Azimut60 (9).jpg');
insert into photos(id_pro, img) values ( 4, 'Azimut60 (10).jpg');
insert into photos(id_pro, img) values ( 4, 'Azimut60 (11).jpg');
insert into photos(id_pro, img) values ( 4, 'Azimut60 (2).jpg');
insert into photos(id_pro, img) values ( 4, 'Azimut60 (3).jpg');
insert into photos(id_pro, img) values ( 4, 'Azimut60 (4).jpg');
insert into photos(id_pro, img) values ( 4, 'Azimut60 (5).jpg');
insert into photos(id_pro, img) values ( 4, 'Azimut60 (6).jpg');
insert into photos(id_pro, img) values ( 4, 'Azimut60 (7).jpg');
insert into photos(id_pro, img) values ( 4, 'Azimut60 (12).jpg');
insert into photos(id_pro, img) values ( 4, 'Azimut60 (13).jpg');
insert into photos(id_pro, img) values ( 4, 'Azimut60 (14).jpg');
insert into photos(id_pro, img) values ( 4, 'Azimut60 (15).jpg');

insert into photos(id_pro, img) values ( 5, 'Azimut66 (2.jpg');
insert into photos(id_pro, img) values ( 5, 'Azimut66 (3.jpg');
insert into photos(id_pro, img) values ( 5, 'Azimut66 (4.jpg');
insert into photos(id_pro, img) values ( 5, 'Azimut66 (5.jpg');
insert into photos(id_pro, img) values ( 5, 'Azimut66 (6.jpg');
insert into photos(id_pro, img) values ( 5, 'Azimut66 (7).jpg');
insert into photos(id_pro, img) values ( 5, 'Azimut66 (8).jpg');
insert into photos(id_pro, img) values ( 5, 'Azimut66 (9).jpg');
insert into photos(id_pro, img) values ( 5, 'Azimut66 (10).jpg');
insert into photos(id_pro, img) values ( 5, 'Azimut66 (11).jpg');
insert into photos(id_pro, img) values ( 5, 'Azimut66 (12).jpg');
insert into photos(id_pro, img) values ( 5, 'Azimut66 (13).jpg');
insert into photos(id_pro, img) values ( 5, 'Azimut66 (14).jpg');
insert into photos(id_pro, img) values ( 5, 'Azimut66 (15).jpg');
insert into photos(id_pro, img) values ( 5, 'Azimut66 (16).jpg');
insert into photos(id_pro, img) values ( 5, 'Azimut66 (17).jpg');
insert into photos(id_pro, img) values ( 5, 'Azimut66 (18).jpg');
insert into photos(id_pro, img) values ( 5, 'Azimut66 (19).jpg');
insert into photos(id_pro, img) values ( 5, 'Azimut66 (20).jpg');
insert into photos(id_pro, img) values ( 5, 'Azimut66 (21).jpg');
insert into photos(id_pro, img) values ( 5, 'Azimut66 (22).jpg');
insert into photos(id_pro, img) values ( 5, 'Azimut66 (23).jpg');
insert into photos(id_pro, img) values ( 5, 'Azimut66 (24).jpg');

insert into photos(id_pro, img) values ( 6, 'Azimut72 (11).jpg');
insert into photos(id_pro, img) values ( 6, 'Azimut72 (12).jpg');
insert into photos(id_pro, img) values ( 6, 'Azimut72 (13).jpg');
insert into photos(id_pro, img) values ( 6, 'Azimut72 (14).jpg');
insert into photos(id_pro, img) values ( 6, 'Azimut72 (15).jpg');
insert into photos(id_pro, img) values ( 6, 'Azimut72 (16).jpg');
insert into photos(id_pro, img) values ( 6, 'Azimut72 (17).jpg');
insert into photos(id_pro, img) values ( 6, 'Azimut72 (18).jpg');
insert into photos(id_pro, img) values ( 6, 'Azimut72 (19).jpg');
insert into photos(id_pro, img) values ( 6, 'Azimut72 (20).jpg');
insert into photos(id_pro, img) values ( 6, 'Azimut72 (21).jpg');
insert into photos(id_pro, img) values ( 6, 'Azimut72 (22).jpg');
insert into photos(id_pro, img) values ( 6, 'Azimut72 (23).jpg');
insert into photos(id_pro, img) values ( 6, 'Azimut72 (24).jpg');
insert into photos(id_pro, img) values ( 6, 'Azimut72 (25).jpg');
insert into photos(id_pro, img) values ( 6, 'Azimut72 (26).jpg');
insert into photos(id_pro, img) values ( 6, 'Azimut72 (27).jpg');
insert into photos(id_pro, img) values ( 6, 'Azimut72 (28).jpg');
insert into photos(id_pro, img) values ( 6, 'Azimut72 (29).jpg');
insert into photos(id_pro, img) values ( 6, 'Azimut72 (30).jpg');
insert into photos(id_pro, img) values ( 6, 'Azimut72 (31).jpg');
insert into photos(id_pro, img) values ( 6, 'Azimut72 (2).jpg');
insert into photos(id_pro, img) values ( 6, 'Azimut72 (3).jpg');
insert into photos(id_pro, img) values ( 6, 'Azimut72 (4).jpg');
insert into photos(id_pro, img) values ( 6, 'Azimut72 (5).jpg');
insert into photos(id_pro, img) values ( 6, 'Azimut72 (6).jpg');
insert into photos(id_pro, img) values ( 6, 'Azimut72 (7).jpg');
insert into photos(id_pro, img) values ( 6, 'Azimut72 (8).jpg');
insert into photos(id_pro, img) values ( 6, 'Azimut72 (9).jpg');
insert into photos(id_pro, img) values ( 6, 'Azimut72 (10).jpg');


insert into photos(id_pro, img) values ( 7, 'Azimut80 (16).jpg');
insert into photos(id_pro, img) values ( 7, 'Azimut80 (17).jpg');
insert into photos(id_pro, img) values ( 7, 'Azimut80 (18).jpg');
insert into photos(id_pro, img) values ( 7, 'Azimut80 (19).jpg');
insert into photos(id_pro, img) values ( 7, 'Azimut80 (20).jpg');
insert into photos(id_pro, img) values ( 7, 'Azimut80 (21).jpg');
insert into photos(id_pro, img) values ( 7, 'Azimut80 (22).jpg');
insert into photos(id_pro, img) values ( 7, 'Azimut80 (23).jpg');
insert into photos(id_pro, img) values ( 7, 'Azimut80 (24).jpg');
insert into photos(id_pro, img) values ( 7, 'Azimut80 (25).jpg');
insert into photos(id_pro, img) values ( 7, 'Azimut80 (26).jpg');
insert into photos(id_pro, img) values ( 7, 'Azimut80 (27).jpg');
insert into photos(id_pro, img) values ( 7, 'Azimut80 (28).jpg');
insert into photos(id_pro, img) values ( 7, 'Azimut80 (29).jpg');
insert into photos(id_pro, img) values ( 7, 'Azimut80 (30).jpg');
insert into photos(id_pro, img) values ( 7, 'Azimut80 (31).jpg');
insert into photos(id_pro, img) values ( 7, 'Azimut80 (31).jpg');
insert into photos(id_pro, img) values ( 7, 'Azimut80 (32.jpg)');
insert into photos(id_pro, img) values ( 7, 'Azimut80 (33).jpg');
insert into photos(id_pro, img) values ( 7, 'Azimut80 (34).jpg');
insert into photos(id_pro, img) values ( 7, 'Azimut80 (35).jpg');
insert into photos(id_pro, img) values ( 7, 'Azimut80 (2).jpg');
insert into photos(id_pro, img) values ( 7, 'Azimut80 (3).jpg');
insert into photos(id_pro, img) values ( 7, 'Azimut80 (4.jpg)');
insert into photos(id_pro, img) values ( 7, 'Azimut80 (5).jpg');
insert into photos(id_pro, img) values ( 7, 'Azimut80 (6).jpg');
insert into photos(id_pro, img) values ( 7, 'Azimut80 (7).jpg');
insert into photos(id_pro, img) values ( 7, 'Azimut80 (8).jpg');
insert into photos(id_pro, img) values ( 7, 'Azimut80 (9).jpg');
insert into photos(id_pro, img) values ( 7, 'Azimut80 (10).jpg');
insert into photos(id_pro, img) values ( 7, 'Azimut80 (11).jpg');
insert into photos(id_pro, img) values ( 7, 'Azimut80 (12).jpg');
insert into photos(id_pro, img) values ( 7, 'Azimut80 (13).jpg');
insert into photos(id_pro, img) values ( 7, 'Azimut80 (14).jpg');
insert into photos(id_pro, img) values ( 7, 'Azimut80 (15).jpg');

insert into photos(id_pro, img) values ( 8, 'Magellano43 (10).jpg');
insert into photos(id_pro, img) values ( 8, 'Magellano43 (11).jpg');
insert into photos(id_pro, img) values ( 8, 'Magellano43 (12).jpg');
insert into photos(id_pro, img) values ( 8, 'Magellano43 (13).jpg');
insert into photos(id_pro, img) values ( 8, 'Magellano43 (14).jpg');
insert into photos(id_pro, img) values ( 8, 'Magellano43 (15).jpg');
insert into photos(id_pro, img) values ( 8, 'Magellano43 (16).jpg');
insert into photos(id_pro, img) values ( 8, 'Magellano43 (17).jpg');
insert into photos(id_pro, img) values ( 8, 'Magellano43 (18).jpg');
insert into photos(id_pro, img) values ( 8, 'Magellano43 (19).jpg');
insert into photos(id_pro, img) values ( 8, 'Magellano43 (20).jpg');
insert into photos(id_pro, img) values ( 8, 'Magellano43 (21).jpg');
insert into photos(id_pro, img) values ( 8, 'Magellano43 (22).jpg');
insert into photos(id_pro, img) values ( 8, 'Magellano43 (23).jpg');
insert into photos(id_pro, img) values ( 8, 'Magellano43 (2).jpg');
insert into photos(id_pro, img) values ( 8, 'Magellano43 (3).jpg');
insert into photos(id_pro, img) values ( 8, 'Magellano43 (4).jpg');
insert into photos(id_pro, img) values ( 8, 'Magellano43 (5).jpg');
insert into photos(id_pro, img) values ( 8, 'Magellano43 (6).jpg');
insert into photos(id_pro, img) values ( 8, 'Magellano43 (7).jpg');
insert into photos(id_pro, img) values ( 8, 'Magellano43 (8).jpg');
insert into photos(id_pro, img) values ( 8, 'Magellano43 (9).jpg');

insert into photos(id_pro, img) values ( 9, 'Magellano53 (6).jpg');
insert into photos(id_pro, img) values ( 9, 'Magellano53 (7).jpg');
insert into photos(id_pro, img) values ( 9, 'Magellano53 (8).jpg');
insert into photos(id_pro, img) values ( 9, 'Magellano53 (9).jpg');
insert into photos(id_pro, img) values ( 9, 'Magellano53 (10).jpg');
insert into photos(id_pro, img) values ( 9, 'Magellano53 (11).jpg');
insert into photos(id_pro, img) values ( 9, 'Magellano53 (12).jpg');
insert into photos(id_pro, img) values ( 9, 'Magellano53 (13).jpg');
insert into photos(id_pro, img) values ( 9, 'Magellano53 (14).jpg');
insert into photos(id_pro, img) values ( 9, 'Magellano53 (15).jpg');
insert into photos(id_pro, img) values ( 9, 'Magellano53 (16).jpg');
insert into photos(id_pro, img) values ( 9, 'Magellano53 (17).jpg');
insert into photos(id_pro, img) values ( 9, 'Magellano53 (18).jpg');
insert into photos(id_pro, img) values ( 9, 'Magellano53 (19).jpg');
insert into photos(id_pro, img) values ( 9, 'Magellano53 (20).jpg');
insert into photos(id_pro, img) values ( 9, 'Magellano53 (21).jpg');
insert into photos(id_pro, img) values ( 9, 'Magellano53 (2).jpg');
insert into photos(id_pro, img) values ( 9, 'Magellano53 (3).jpg');
insert into photos(id_pro, img) values ( 9, 'Magellano53 (4).jpg');
insert into photos(id_pro, img) values ( 9, 'Magellano53 (5).jpg');

insert into photos(id_pro, img) values ( 10, 'Magellano66 (13).jpg');
insert into photos(id_pro, img) values ( 10, 'Magellano66 (14).jpg');
insert into photos(id_pro, img) values ( 10, 'Magellano66 (15).jpg');
insert into photos(id_pro, img) values ( 10, 'Magellano66 (16).jpg');
insert into photos(id_pro, img) values ( 10, 'Magellano66 (17).jpg');
insert into photos(id_pro, img) values ( 10, 'Magellano66 (18).jpg');
insert into photos(id_pro, img) values ( 10, 'Magellano66 (19).jpg');
insert into photos(id_pro, img) values ( 10, 'Magellano66 (20).jpg');
insert into photos(id_pro, img) values ( 10, 'Magellano66 (21).jpg');
insert into photos(id_pro, img) values ( 10, 'Magellano66 (2.jpg)');
insert into photos(id_pro, img) values ( 10, 'Magellano66 (3.jpg)');
insert into photos(id_pro, img) values ( 10, 'Magellano66 (4).jpg');
insert into photos(id_pro, img) values ( 10, 'Magellano66 (5).jpg');
insert into photos(id_pro, img) values ( 10, 'Magellano66 (6).jpg');
insert into photos(id_pro, img) values ( 10, 'Magellano66 (7).jpg');
insert into photos(id_pro, img) values ( 10, 'Magellano66 (8).jpg');
insert into photos(id_pro, img) values ( 10, 'Magellano66 (9).jpg');
insert into photos(id_pro, img) values ( 10, 'Magellano66 (10).jpg');
insert into photos(id_pro, img) values ( 10, 'Magellano66 (11).jpg');
insert into photos(id_pro, img) values ( 10, 'Magellano66 (12).jpg');

insert into photos(id_pro, img) values ( 11, 'Magellano76 (5).jpg');
insert into photos(id_pro, img) values ( 11, 'Magellano76 (6).jpg');
insert into photos(id_pro, img) values ( 11, 'Magellano76 (7).jpg');
insert into photos(id_pro, img) values ( 11, 'Magellano76 (8).jpg');
insert into photos(id_pro, img) values ( 11, 'Magellano76 (9).jpg');
insert into photos(id_pro, img) values ( 11, 'Magellano76 (10).jpg');
insert into photos(id_pro, img) values ( 11, 'Magellano76 (11).jpg');
insert into photos(id_pro, img) values ( 11, 'Magellano76 (12).jpg');
insert into photos(id_pro, img) values ( 11, 'Magellano76 (13).jpg');
insert into photos(id_pro, img) values ( 11, 'Magellano76 (14).jpg');
insert into photos(id_pro, img) values ( 11, 'Magellano76 (15).jpg');
insert into photos(id_pro, img) values ( 11, 'Magellano76 (16).jpg');
insert into photos(id_pro, img) values ( 11, 'Magellano76 (17).jpg');
insert into photos(id_pro, img) values ( 11, 'Magellano76 (18).jpg');
insert into photos(id_pro, img) values ( 11, 'Magellano76 (19).jpg');
insert into photos(id_pro, img) values ( 11, 'Magellano76 (20).jpg');
insert into photos(id_pro, img) values ( 11, 'Magellano76 (21).jpg');
insert into photos(id_pro, img) values ( 11, 'Magellano76 (22).jpg');
insert into photos(id_pro, img) values ( 11, 'Magellano76 (23).jpg');
insert into photos(id_pro, img) values ( 11, 'Magellano76 (24).jpg');
insert into photos(id_pro, img) values ( 11, 'Magellano76 (25).jpg');
insert into photos(id_pro, img) values ( 11, 'Magellano76 (26).jpg');
insert into photos(id_pro, img) values ( 11, 'Magellano76 (27).jpg');
insert into photos(id_pro, img) values ( 11, 'Magellano76 (28).jpg');
insert into photos(id_pro, img) values ( 11, 'Magellano76 (29).jpg');
insert into photos(id_pro, img) values ( 11, 'Magellano76 (30).jpg');
insert into photos(id_pro, img) values ( 11, 'Magellano76 (31).jpg');
insert into photos(id_pro, img) values ( 11, 'Magellano76 (32).jpg');
insert into photos(id_pro, img) values ( 11, 'Magellano76 (33).jpg');
insert into photos(id_pro, img) values ( 11, 'Magellano76 (34).jpg');
insert into photos(id_pro, img) values ( 11, 'Magellano76 (35).jpg');
insert into photos(id_pro, img) values ( 11, 'Magellano76 (36).jpg');
insert into photos(id_pro, img) values ( 11, 'Magellano76 (37).jpg');
insert into photos(id_pro, img) values ( 11, 'Magellano76 (38).jpg');
insert into photos(id_pro, img) values ( 11, 'Magellano76 (39).jpg');
insert into photos(id_pro, img) values ( 11, 'Magellano76 (41).jpg');
insert into photos(id_pro, img) values ( 11, 'Magellano76 (2).jpg');
insert into photos(id_pro, img) values ( 11, 'Magellano76 (3).jpg');
insert into photos(id_pro, img) values ( 11, 'Magellano76 (4).jpg');


insert into photos(id_pro, img) values ( 12, 'Atlantis34 (7).jpg');
insert into photos(id_pro, img) values ( 12, 'Atlantis34 (8).jpg');
insert into photos(id_pro, img) values ( 12, 'Atlantis34 (9).jpg');
insert into photos(id_pro, img) values ( 12, 'Atlantis34 (10).jpg');
insert into photos(id_pro, img) values ( 12, 'Atlantis34 (11).jpg');
insert into photos(id_pro, img) values ( 12, 'Atlantis34 (12).jpg');
insert into photos(id_pro, img) values ( 12, 'Atlantis34 (13).jpg');
insert into photos(id_pro, img) values ( 12, 'Atlantis34 (14).jpg');
insert into photos(id_pro, img) values ( 12, 'Atlantis34 (15).jpg');
insert into photos(id_pro, img) values ( 12, 'Atlantis34 (16).jpg');
insert into photos(id_pro, img) values ( 12, 'Atlantis34 (17).jpg');
insert into photos(id_pro, img) values ( 12, 'Atlantis34 (18).jpg');
insert into photos(id_pro, img) values ( 12, 'Atlantis34 (2).jpg');
insert into photos(id_pro, img) values ( 12, 'Atlantis34 (3).jpg');
insert into photos(id_pro, img) values ( 12, 'Atlantis34 (4).jpg');
insert into photos(id_pro, img) values ( 12, 'Atlantis34 (5).jpg');
insert into photos(id_pro, img) values ( 12, 'Atlantis34 (6).jpg');


insert into photos(id_pro, img) values ( 13, 'Atlantis43 (3).jpg');
insert into photos(id_pro, img) values ( 13, 'Atlantis43 (4).jpg');
insert into photos(id_pro, img) values ( 13, 'Atlantis43 (5).jpg');
insert into photos(id_pro, img) values ( 13, 'Atlantis43 (6).jpg');
insert into photos(id_pro, img) values ( 13, 'Atlantis43 (7).jpg');
insert into photos(id_pro, img) values ( 13, 'Atlantis43 (8).jpg');
insert into photos(id_pro, img) values ( 13, 'Atlantis43 (9).jpg');
insert into photos(id_pro, img) values ( 13, 'Atlantis43 (10).jpg');
insert into photos(id_pro, img) values ( 13, 'Atlantis43 (11).jpg');
insert into photos(id_pro, img) values ( 13, 'Atlantis43 (12).jpg');
insert into photos(id_pro, img) values ( 13, 'Atlantis43 (13).jpg');
insert into photos(id_pro, img) values ( 13, 'Atlantis43 (14).jpg');
insert into photos(id_pro, img) values ( 13, 'Atlantis43 (15).jpg');
insert into photos(id_pro, img) values ( 13, 'Atlantis43 (16).jpg');
insert into photos(id_pro, img) values ( 13, 'Atlantis43 (17).jpg');
insert into photos(id_pro, img) values ( 13, 'Atlantis43 (18).jpg');
insert into photos(id_pro, img) values ( 13, 'Atlantis43 (2).jpg');

insert into photos(id_pro, img) values ( 14, 'Atlantis51 (11).jpg');
insert into photos(id_pro, img) values ( 14, 'Atlantis51 (12).jpg');
insert into photos(id_pro, img) values ( 14, 'Atlantis51 (13).jpg');
insert into photos(id_pro, img) values ( 14, 'Atlantis51 (14).jpg');
insert into photos(id_pro, img) values ( 14, 'Atlantis51 (15).jpg');
insert into photos(id_pro, img) values ( 14, 'Atlantis51 (16).jpg');
insert into photos(id_pro, img) values ( 14, 'Atlantis51 (2).jpg');
insert into photos(id_pro, img) values ( 14, 'Atlantis51 (3).jpg');
insert into photos(id_pro, img) values ( 14, 'Atlantis51 (4).jpg');
insert into photos(id_pro, img) values ( 14, 'Atlantis51 (5).jpg');
insert into photos(id_pro, img) values ( 14, 'Atlantis51 (6).jpg');
insert into photos(id_pro, img) values ( 14, 'Atlantis51 (7).jpg');
insert into photos(id_pro, img) values ( 14, 'Atlantis51 (8).jpg');
insert into photos(id_pro, img) values ( 14, 'Atlantis51 (9).jpg');
insert into photos(id_pro, img) values ( 14, 'Atlantis51 (10).jpg');

insert into photos(id_pro, img) values ( 15, 'Atlantis50 (7).jpg');
insert into photos(id_pro, img) values ( 15, 'Atlantis50 (8).jpg');
insert into photos(id_pro, img) values ( 15, 'Atlantis50 (9).jpg');
insert into photos(id_pro, img) values ( 15, 'Atlantis50 (10).jpg');
insert into photos(id_pro, img) values ( 15, 'Atlantis50 (11).jpg');
insert into photos(id_pro, img) values ( 15, 'Atlantis50 (12).jpg');
insert into photos(id_pro, img) values ( 15, 'Atlantis50 (13).jpg');
insert into photos(id_pro, img) values ( 15, 'Atlantis50 (14).jpg');
insert into photos(id_pro, img) values ( 15, 'Atlantis50 (15).jpg');
insert into photos(id_pro, img) values ( 15, 'Atlantis50 (16).jpg');
insert into photos(id_pro, img) values ( 15, 'Atlantis50 (17).jpg');
insert into photos(id_pro, img) values ( 15, 'Atlantis50 (18).jpg');
insert into photos(id_pro, img) values ( 15, 'Atlantis50 (19).jpg');
insert into photos(id_pro, img) values ( 15, 'Atlantis50 (20).jpg');
insert into photos(id_pro, img) values ( 15, 'Atlantis50 (21).jpg');
insert into photos(id_pro, img) values ( 15, 'Atlantis50 (22).jpg');
insert into photos(id_pro, img) values ( 15, 'Atlantis50 (23).jpg');
insert into photos(id_pro, img) values ( 15, 'Atlantis50 (24).jpg');
insert into photos(id_pro, img) values ( 15, 'Atlantis50 (25).jpg');
insert into photos(id_pro, img) values ( 15, 'Atlantis50 (2).jpg');
insert into photos(id_pro, img) values ( 15, 'Atlantis50 (3).jpg');
insert into photos(id_pro, img) values ( 15, 'Atlantis50 (4).jpg');
insert into photos(id_pro, img) values ( 15, 'Atlantis50 (5).jpg');
insert into photos(id_pro, img) values ( 15, 'Atlantis50 (6).jpg');

insert into photos(id_pro, img) values ( 16, 'Azimut55s (8).jpg');
insert into photos(id_pro, img) values ( 16, 'Azimut55s (9).jpg');
insert into photos(id_pro, img) values ( 16, 'Azimut55s (10).jpg');
insert into photos(id_pro, img) values ( 16, 'Azimut55s (11).jpg');
insert into photos(id_pro, img) values ( 16, 'Azimut55s (12).jpg');
insert into photos(id_pro, img) values ( 16, 'Azimut55s (13).jpg');
insert into photos(id_pro, img) values ( 16, 'Azimut55s (14).jpg');
insert into photos(id_pro, img) values ( 16, 'Azimut55s (15).jpg');
insert into photos(id_pro, img) values ( 16, 'Azimut55s (16).jpg');
insert into photos(id_pro, img) values ( 16, 'Azimut55s (17).jpg');
insert into photos(id_pro, img) values ( 16, 'Azimut55s (18).jpg');
insert into photos(id_pro, img) values ( 16, 'Azimut55s (19).jpg');
insert into photos(id_pro, img) values ( 16, 'Azimut55s (20).jpg');
insert into photos(id_pro, img) values ( 16, 'Azimut55s (21).jpg');
insert into photos(id_pro, img) values ( 16, 'Azimut55s (22).jpg');
insert into photos(id_pro, img) values ( 16, 'Azimut55s (23).jpg');
insert into photos(id_pro, img) values ( 16, 'Azimut55s (24).jpg');
insert into photos(id_pro, img) values ( 16, 'Azimut55s (25).jpg');
insert into photos(id_pro, img) values ( 16, 'Azimut55s (26).jpg');
insert into photos(id_pro, img) values ( 16, 'Azimut55s (27).jpg');
insert into photos(id_pro, img) values ( 16, 'Azimut55s (28).jpg');
insert into photos(id_pro, img) values ( 16, 'Azimut55s (29).jpg');
insert into photos(id_pro, img) values ( 16, 'Azimut55s (30).jpg');
insert into photos(id_pro, img) values ( 16, 'Azimut55s (31).jpg');
insert into photos(id_pro, img) values ( 16, 'Azimut55s (32).jpg');
insert into photos(id_pro, img) values ( 16, 'Azimut55s (33).jpg');
insert into photos(id_pro, img) values ( 16, 'Azimut55s (34).jpg');
insert into photos(id_pro, img) values ( 16, 'Azimut55s (35.jpg');
insert into photos(id_pro, img) values ( 16, 'Azimut55s (36).jpg');
insert into photos(id_pro, img) values ( 16, 'Azimut55s (2).jpg');
insert into photos(id_pro, img) values ( 16, 'Azimut55s (3).jpg');
insert into photos(id_pro, img) values ( 16, 'Azimut55s (4).jpg');
insert into photos(id_pro, img) values ( 16, 'Azimut55s (5).jpg');
insert into photos(id_pro, img) values ( 16, 'Azimut55s (6).jpg');
insert into photos(id_pro, img) values ( 16, 'Azimut55s (7).jpg');

insert into photos(id_pro, img) values ( 17, 'Azimuts6 (8).jpg');
insert into photos(id_pro, img) values ( 17, 'Azimuts6 (9).jpg');
insert into photos(id_pro, img) values ( 17, 'Azimuts6 (10).jpg');
insert into photos(id_pro, img) values ( 17, 'Azimuts6 (11).jpg');
insert into photos(id_pro, img) values ( 17, 'Azimuts6 (12).jpg');
insert into photos(id_pro, img) values ( 17, 'Azimuts6 (13).jpg');
insert into photos(id_pro, img) values ( 17, 'Azimuts6 (14).jpg');
insert into photos(id_pro, img) values ( 17, 'Azimuts6 (15).jpg');
insert into photos(id_pro, img) values ( 17, 'Azimuts6 (16).jpg');
insert into photos(id_pro, img) values ( 17, 'Azimuts6 (17).jpg');
insert into photos(id_pro, img) values ( 17, 'Azimuts6 (18).jpg');
insert into photos(id_pro, img) values ( 17, 'Azimuts6 (2).jpg');
insert into photos(id_pro, img) values ( 17, 'Azimuts6 (3).jpg');
insert into photos(id_pro, img) values ( 17, 'Azimuts6 (4).jpg');
insert into photos(id_pro, img) values ( 17, 'Azimuts6 (5).jpg');
insert into photos(id_pro, img) values ( 17, 'Azimuts6 (6).jpg');
insert into photos(id_pro, img) values ( 17, 'Azimuts6 (7).jpg');

insert into photos(id_pro, img) values ( 18, 'Azimuts7 (6).jpg');
insert into photos(id_pro, img) values ( 18, 'Azimuts7 (7).jpg');
insert into photos(id_pro, img) values ( 18, 'Azimuts7 (8).jpg');
insert into photos(id_pro, img) values ( 18, 'Azimuts7 (9).jpg');
insert into photos(id_pro, img) values ( 18, 'Azimuts7 (10).jpg');
insert into photos(id_pro, img) values ( 18, 'Azimuts7 (11).jpg');
insert into photos(id_pro, img) values ( 18, 'Azimuts7 (12).jpg');
insert into photos(id_pro, img) values ( 18, 'Azimuts7 (13).jpg');
insert into photos(id_pro, img) values ( 18, 'Azimuts7 (14).jpg');
insert into photos(id_pro, img) values ( 18, 'Azimuts7 (15).jpg');
insert into photos(id_pro, img) values ( 18, 'Azimuts7 (15).jpg');
insert into photos(id_pro, img) values ( 18, 'Azimuts7 (16).jpg');
insert into photos(id_pro, img) values ( 18, 'Azimuts7 (17).jpg');
insert into photos(id_pro, img) values ( 18, 'Azimuts7 (18).jpg');
insert into photos(id_pro, img) values ( 18, 'Azimuts7 (19).jpg');
insert into photos(id_pro, img) values ( 18, 'Azimuts7 (20).jpg');
insert into photos(id_pro, img) values ( 18, 'Azimuts7 (21).jpg');
insert into photos(id_pro, img) values ( 18, 'Azimuts7 (22).jpg');
insert into photos(id_pro, img) values ( 18, 'Azimuts7 (23).jpg');
insert into photos(id_pro, img) values ( 18, 'Azimuts7 (24).jpg');
insert into photos(id_pro, img) values ( 18, 'Azimuts7 (25).jpg');
insert into photos(id_pro, img) values ( 18, 'Azimuts7 (2).jpg');
insert into photos(id_pro, img) values ( 18, 'Azimuts7 (3).jpg');
insert into photos(id_pro, img) values ( 18, 'Azimuts7 (4).jpg');
insert into photos(id_pro, img) values ( 18, 'Azimuts7 (5).jpg');

insert into photos(id_pro, img) values ( 19, 'Azimut77s (18).jpg');
insert into photos(id_pro, img) values ( 19, 'Azimut77s (19).jpg');
insert into photos(id_pro, img) values ( 19, 'Azimut77s (20).jpg');
insert into photos(id_pro, img) values ( 19, 'Azimut77s (21).jpg');
insert into photos(id_pro, img) values ( 19, 'Azimut77s (22).jpg');
insert into photos(id_pro, img) values ( 19, 'Azimut77s (23).jpg');
insert into photos(id_pro, img) values ( 19, 'Azimut77s (24).jpg');
insert into photos(id_pro, img) values ( 19, 'Azimut77s (25).jpg');
insert into photos(id_pro, img) values ( 19, 'Azimut77s (26).jpg');
insert into photos(id_pro, img) values ( 19, 'Azimut77s (27).jpg');
insert into photos(id_pro, img) values ( 19, 'Azimut77s (28).jpg');
insert into photos(id_pro, img) values ( 19, 'Azimut77s (29).jpg');
insert into photos(id_pro, img) values ( 19, 'Azimut77s (30).jpg');
insert into photos(id_pro, img) values ( 19, 'Azimut77s (31).jpg');
insert into photos(id_pro, img) values ( 19, 'Azimut77s (32).jpg');
insert into photos(id_pro, img) values ( 19, 'Azimut77s (33).jpg');
insert into photos(id_pro, img) values ( 19, 'Azimut77s (34).jpg');
insert into photos(id_pro, img) values ( 19, 'Azimut77s (2).jpg');
insert into photos(id_pro, img) values ( 19, 'Azimut77s (3).jpg');
insert into photos(id_pro, img) values ( 19, 'Azimut77s (4).jpg');
insert into photos(id_pro, img) values ( 19, 'Azimut77s (5).jpg');
insert into photos(id_pro, img) values ( 19, 'Azimut77s (6).jpg');
insert into photos(id_pro, img) values ( 19, 'Azimut77s (7).jpg');
insert into photos(id_pro, img) values ( 19, 'Azimut77s (8).jpg');
insert into photos(id_pro, img) values ( 19, 'Azimut77s (9).jpg');
insert into photos(id_pro, img) values ( 19, 'Azimut77s (10).jpg');
insert into photos(id_pro, img) values ( 19, 'Azimut77s (11).jpg');
insert into photos(id_pro, img) values ( 19, 'Azimut77s (12).jpg');
insert into photos(id_pro, img) values ( 19, 'Azimut77s (13).jpg');
insert into photos(id_pro, img) values ( 19, 'Azimut77s (14).jpg');
insert into photos(id_pro, img) values ( 19, 'Azimut77s (15).jpg');
insert into photos(id_pro, img) values ( 19, 'Azimut77s (16).jpg');
insert into photos(id_pro, img) values ( 19, 'Azimut77s (17).jpg');

insert into photos(id_pro, img) values ( 20, '25 Metri (10).jpg');
insert into photos(id_pro, img) values ( 20, '25 Metri (11).jpg');
insert into photos(id_pro, img) values ( 20, '25 Metri (25).jpg');
insert into photos(id_pro, img) values ( 20, '25 Metri (26).jpg');
insert into photos(id_pro, img) values ( 20, '25 Metri (27).jpg');
insert into photos(id_pro, img) values ( 20, '25 Metri (2).jpg');
insert into photos(id_pro, img) values ( 20, '25 Metri (3).jpg');
insert into photos(id_pro, img) values ( 20, '25 Metri (4).jpg');
insert into photos(id_pro, img) values ( 20, '25 Metri (5).jpg');
insert into photos(id_pro, img) values ( 20, '25 Metri (6).jpg');
insert into photos(id_pro, img) values ( 20, '25 Metri (7).jpg');
insert into photos(id_pro, img) values ( 20, '25 Metri (8).jpg');
insert into photos(id_pro, img) values ( 20, '25 Metri (9).jpg');
insert into photos(id_pro, img) values ( 20, '25 Metri (12).jpg');
insert into photos(id_pro, img) values ( 20, '25 Metri (13).jpg');
insert into photos(id_pro, img) values ( 20, '25 Metri (14).jpg');
insert into photos(id_pro, img) values ( 20, '25 Metri (15).jpg');
insert into photos(id_pro, img) values ( 20, '25 Metri (16).jpg');
insert into photos(id_pro, img) values ( 20, '25 Metri (17).jpg');
insert into photos(id_pro, img) values ( 20, '25 Metri (18).jpg');
insert into photos(id_pro, img) values ( 20, '25 Metri (19).jpg');
insert into photos(id_pro, img) values ( 20, '25 Metri (20).jpg');
insert into photos(id_pro, img) values ( 20, '25 Metri (21).jpg');
insert into photos(id_pro, img) values ( 20, '25 Metri (22).jpg');
insert into photos(id_pro, img) values ( 20, '25 Metri (23).jpg');
insert into photos(id_pro, img) values ( 20, '25 Metri (24).jpg');
insert into photos(id_pro, img) values ( 20, '25 Metri (28).jpg');
insert into photos(id_pro, img) values ( 20, '25 Metri (29).jpg');
insert into photos(id_pro, img) values ( 20, '25 Metri (30).jpg');
insert into photos(id_pro, img) values ( 20, '25 Metri (31).jpg');
insert into photos(id_pro, img) values ( 20, '25 Metri (32).jpg');
insert into photos(id_pro, img) values ( 20, '25 Metri (33).jpg');
insert into photos(id_pro, img) values ( 20, '25 Metri (34).jpg');
insert into photos(id_pro, img) values ( 20, '25 Metri (35).jpg');


insert into desc_pro( id_pro, info, featured, advanced, additional) values (1, '                       <p>The greatest feature of the Azimut 50 is the large flybridge and the wide variety of equipment for the discretion of the employer

The generous space created by the intelligent area saving solutions gives you the feeling that this is not a 50 feets yacht.
</p>
', '                            <li>The master Cabin is located at the widest cabin</li>
                                <li>3rd Cbin</li>
                                <li>Cape Marina Lounge</li>
                                <li>Flybridge spacious with arrangement selections</li>
                                <li>Large window in main compartment</li>
', ' (null)
','(null)
');

insert into desc_pro( id_pro, info, featured, advanced, additional) values(2,'                              <p>The Azimut 54 is a model of yachts that you''ll think of when you want to upgrade from your cruiser to an average sized yacht. You will get all the characteristics of large size yachts such as the Master cabin at the widest part, the large flybridge with the radar arch in between and the choice of hardtop. With these shark display windows, the yacht is easily recognizable as the Azimut brand.</p>
','                         <li>Largest flybridge on the boat market 55 feet</li>
                            <li>Master Cabin at widest part</li>
                            <li>Choice Hardtop</li>
                            <li>Standard Swim Platform</li>
                            <li>Cabin Crew by choice</li>
','(null)','(null)'
                                                                          );

insert into desc_pro( id_pro, info, featured, advanced, additional) values (3, '                       <p>The Azimut Flybridge collection''s latest model, continuing the new Azimut orientation on luxury Yachts "La Dolce Vita 3.0"
</p>
', '                            <li>New Model 2018</li>
                                <li>3rd Cbin</li>
                                <liInterior Design new Style</li>

', '(null)
','(null)
');
insert into desc_pro( id_pro, info, featured, advanced, additional) values (4, '                       <p>The new Azimut model of the Flybridge series, which debuted at the Cannes Boat Show 2017 and soon became one of the best-selling models in the segment. The new interior design and the World Yacht Trophy''s Award for the title "Best interior layout in the 50-80 feet yacht size" proved to be the attraction of the new Azimut 60 model.
</p>
', '                            <li>New interior Design</li>
                                <li>New exterior design</li>

', '(null)
','(null)
');

insert into desc_pro( id_pro, info, featured, advanced, additional) values (5, '                       <p>The Azimut 66 creates a new standard for perfection and is becoming the lead yacht model in the segment. Azimut 66 is not merely attracting you by design, style and technology, but also by the value of class and style that the yacht creates for its owners over time, as a testimony of what we call the trendy style.
</p>
', '                            <li>Released in the collection from 2016</li>
                                <li>4th Cbin</li>
                                <li>Large Flybridge deck made of carbo fiber</li>
                                <li>Panoramic window</li>
                                <li>Cape Marina Lounge</li>
', '(null)
','(null)
');

insert into desc_pro( id_pro, info, featured, advanced, additional) values (6, '                       <p>The Azimut 72 is all you can find from a typical Azimut yacht-the perfection and the sophisticated in the design that brings the luxury of combining the same modern technology as the carbon fibre application in fabrication. All aims to bring the utmost comfort to the owner of the yacht

Large window with huge Flybridge deck offering 360 degrees of master with friends-the Azimut 72 is truly a dream about the class and elegance you desire.
</p>
', '                            <li>Debut year 2015</li>
                                <li>4th Cbin</li>
                                <li>Boong Flybridge làm bằng sợi carbon</li>
                                <li>Panoramic window 360 degrees</li>
                                <li>Largest flybridge on the market in size segment 70 feet</li>
                                <li>Cape Marina Lounge</li>
', '(null)
','(null)
');

insert into desc_pro( id_pro, info, featured, advanced, additional) values (7, '                       <p>TContinue the continuation of outstanding features from the Azimut 72. The Azimut 80 not only delivers a longer size but also adds a larger panoramic window allowing more natural light to the main deck but limiting light reflections from the water surface. This makes the experience of watching the sea from within the main deck to be more wonderful than ever.
</p>
', '                            <li>Design the new generation of Azimut</li>
<li>Design the latest generation of Azimut Flybridge on the market in 80 feet in size segments</li>
                                <li>Panoramic windows at the main deck</li>
                                <li>Master Cabin Size Largest</li>
                                <li>Cape Marina Lounge</li>
', '(null)
','(null)
');

insert into desc_pro( id_pro, info, featured, advanced, additional) values (8, '                       <p>The beauty and comfort, safety, the ability to go away and the hull are ideal for long trips in all weather conditions. Magellano 43 is dedicated to those who evaluate the shift in comfort during long journeys and exquisite aesthetic love.
</p>
', '                            <li>The semi-displacement hull offers high stability</li>
                                <li>3rd Cbin</li>
                                <li>Max speed 22 knots (!)</li>
                                <li>Flybridge spacious with arrangement selections</li>
                                <li>2 Bathrooms</li>
                                <li>Wide dining area in the saloon</li>
                                <li>High ceilings with collapses can be opened</li>
', '(null)
','(null)
');

insert into desc_pro( id_pro, info, featured, advanced, additional) values (9, '                       <p>Is the elder of the 43 Magellano. The Azimut Magellano 53 is a yacht for the discovery of lovers. Enjoy the calming feel of the gentle waves and luxurious spaces with the technical design for the distant journeys. It''s hard to say everything Magellano 53 brings to its owner, we can only assure that if you are a person who is looking for New Horizons on a class machine from a world leading yacht brand, Magellano is your choice.
</p>
', '                            <li>The "Dual mode" type Hull</li>
                                <li>3rd Cbin</li>
                                <li>Max speed 22 knots (!)</li>
                                <li>Get up to 350 nautical</li>
', '(null)
','(null)
');

insert into desc_pro( id_pro, info, featured, advanced, additional) values (10, '                       <p>The latest model in the Magellano series of Azimut! There is no longer any anxiety. The distance, water conditions and space on board are no longer the limit for you. On Magellano 66 is just the wind and spirit of your own freedom.
</p>
', '                            <li>Semi-type boat-displacement</li>
                                <li>4th Cbin</li>
                                <li>Two sessions for Saloońyes</li>
                                <li>Max speed 22 knots (!)</li>
                                <li>Get up to 900 nautical</li>
', '(null)
','(null)
');
insert into desc_pro( id_pro, info, featured, advanced, additional) values (11, '                       <p>Magellano 76 is for those who appreciate the comfort of their long journeys and exquisite aesthetic love. The largest model in the Azimut semi-displacement series, this giant yacht offers a journey to over 1,000 nautical knots. Everything on board reminds you that you''re not just on a yacht, that you own a yacht that lets you go wherever you want.

Beauty and comfort, safety, spacious and suitable for long trips in all sea conditions.
</p>
', '                       <li>A variety of layout options/li>
                           <li>Get up to 1000 nautical</li>
                           <li>The body is very stable-you can rest assured in any weather conditions The</li>

', '(null)
','(null)
');

insert into desc_pro( id_pro, info, featured, advanced, additional) values (12, '                       <p>TAll you want on the 10-metre-long yacht. The multi-functional yacht, both open and cruiser. Atlantis 34 offers spacious outside space and comfortable inner areas.
</p>
', '                        <li>Two Volvo Penta D3-220 hp diesel engines</li>
                            <li>  Hardtop can open in cockpit area</li>
                            <li>    Wide side windows in salon. </li>
                            <li> 2 cabins with up to 5 sleeping placesToilet</li>
                            <li> The most reasonable price on the market</li>
', '(null)
','(null)
');

insert into desc_pro( id_pro, info, featured, advanced, additional) values (13, '                       <p>Luxury and sports, with harmonious lines, gentle controls and absolute comfort, combined with a wide surprise space: the width and height of the yacht of the largest form on the market for this size
</p>
', '                    <li> The best-selling yacht of 2016.</li>
                        <li> Two x Volvo Penta D6-400 hp engine (additional driver can be placed).</li>
                        <li>  Boat Garage for 2.2 m or jetski stand.</li>
                        <li>   Pool platform.</li>
                        <li>  2 Cabins with 5 sleeping places.</li>
                        <li> Hardtop can slip in the cockpit.</li>
                        <li> 2 BathroomsThe most popular price for the cruise is 43-45 feet.</li>
', '(null)
','(null)
');

insert into desc_pro( id_pro, info, featured, advanced, additional) values (14, '                       <p>Sports, personality, new icons of yachts, plenty of interior space and top performance. You can already find at Atlantis 51. This is the first cruise to apply a new boat design with many features reminiscent of a fast and dynamic yacht.

The cruise was officially launched at the upcoming Boot Duselldorf 2018 exhibition.
</p>
', '                       <li>  The biggest size of the Atlantis series.</li>
                            <li>3 cabins, ample space. </li>
                            <li>A powerful Volvo Penta IPS engine</li>.
', '(nul)
','(null)
');
insert into desc_pro( id_pro, info, featured, advanced, additional) values (15, '                       <p>The Azimut Atlantis 50 offers a yacht with a sporty and stylish appearance. With 2 versions of the main deck "closed" and "open" Bring up 2 options for you, either to be immersed with friends or have more privacy. Atlantis 50 is still carrying the identity of the Azimut, from exterior design to interior to bring comfort to its owners
</p>
', '                 <li>Two versions-"Coupe" and "open".</li>
                     <li>Two versions-with 2 (with separate dining area) or 3 cabins.</li>
                     <li>Sporty and classy design.</li>
                     <li>Hardtop can open.</li>
                     <li>Shaft line propulsion system.</li>
                     <li>Garage for long boats up to 2.4  m.</li>
                     <li>The cockpit seating area is subject to change.</li>
', '(null)
','(null)
');

insert into desc_pro( id_pro, info, featured, advanced, additional) values (16, '                       <p>Azimut 55s is a yacht for young people who want to enjoy a sense of speed, sport and elegance. Azimut 55s is not only the leading yacht in the S collection, but also in the boat segment with the Flybridge deck in general.

Equipped with 3 dynamic IPS with advanced technology, allowing the yacht to reach high speed but still operate smoothly, save fuel. Azimut 55s also integrates a 2.5 m canoe area, a spacious control compartment, and a full-length deck that will give you a great feeling of enjoying the sea, speed and great cocktails.
</p>
', '                        <li>The lounge at the boat''s bow.</li>
                            <li>Garage for long boats up to 2.5 m. </li>
                            <li>A pool deck and a sundeck.</li>
                            <li>The hard-opening is open.</li>
                            <li>Cabin captain at the boat bow.</li>
                            <li>Powerful 3 x IPS motor system.</li>
                            <li>Speeds of up to 37 knots.</li>
', '(null)
','(null)
');

insert into desc_pro( id_pro, info, featured, advanced, additional) values (17, '                       <p>Premered in September 2018 at Cannes Boat Show Festival, Azimut S6 is the new legendary yacht of pure sport and elegant beauty. Instantly loved by fans of adventure, speed and sea worldwide, Azimut S6 also won the pretigious World Yachts Trophie for "Best Innovative Project"

Slender, Sleek, a masterpiece of design and carbon technology, S6 is truly the yacht for those who love chasing the waves while enjoying the wildest parties ever imaginable. With S6, Summer never ends!
</p>
', '<p>3 Cabins + 1 crew, maximum speed 35 knots, cruising speed 30 knots, range 275 nm, S6 is the perfect companion for great Parties with friends and loved ones at sea. Let your imagination and dreams be unleashed!</p>
', '(null)
','(null)
');
insert into desc_pro( id_pro, info, featured, advanced, additional) values (18, '                       <p>The new member of the S Collection, officially launched in May 9.2017 at the Cannes Yachts Show. S7 will be expected to change the game with the latest technology applications, especially the expansion of the use of carbon fibre in the construction of boats to deliver higher performance and lighter weight.
</p>
', '                        <li>Is available upon request</li>
', '(null)
','(null)
');

insert into desc_pro( id_pro, info, featured, advanced, additional) values (19, '                       <p>The Azimut 77s is the expression that the particular synthesis of style innovation, technology, and functions is found in all the latest models of Italian shipbuilding. As on the Azimut 55s, the characteristics of 77s are large deckhouse windows, glazed roofs, high performance, fuel saving thanks to the Volvo Penta IPS system.

Exterior design by Stefano Righini and hull design of the Pierluigi Ausonio Naval Architecture. The interior is designed by the stylish Carlo Galeazzi, with Zebrano wood and beautiful hand-stitched leather.
</p>
', '                         <li>One of the most stylish yachts by Azimut Yachts.</li>
                             <li>The back platform can be attached to your own private sundeck.</li>
                             <li>Large windows.</li>
                             <li>Glass roof at the main deck.</li>
                             <li>Absolute functionality thanks to IPS system.</li>
                             <li>The maximum speed of 36 knots and fuel consumption saves 350 L/h at a rate of 32 knots.</li>
', '(null)
','(null)
');

insert into desc_pro( id_pro, info, featured, advanced, additional) values (20, '                       <p>Grande is a collection of 3-storey yachts, with a length of 100 feet, up to 5 cabins and ample space for passengers.

Grande is the sum of all the advantages of the Azimut collection to maximize employer''s needs and more: to create a leading position.

The Azimut Grande 25METRI is purset as the new artwork added to the Azimut Grande Collection collection. The yacht is the crystallizing beauty in each design line, bringing the breath of sun-drenched Mediterranean and elegant Italian style, worthy of the perfect choice for successful owners who want to enjoy freedom in the sea
</p>
', '                         <p>Beautiful design to marvel, Outstanding carbon tech technology</p>
', '(null)
','(null)
');




insert into configuration( id_pro, model, length_overall, beam, draft_max,  draft_min, bridge_clearance,  deadrise,   dry_weight, fuel_tanks,water_tanks, Production_materials,  Exterior_design,  Interior_Design, passenger_capacity, cabins, manufacturer  ) values(1,'Azimut 50','15.88m','4.66 m', '1.52 m','null','null','12 degrees','null','2200 l',' 590 l' ,'VTR/GRP', 'Stefano Righini',' Carlo Galeazzi' ,'null',' 3+1','Azimut Yachts (Italy)');
insert into configuration( id_pro, model, length_overall, beam, draft_max,  draft_min, bridge_clearance,  deadrise,   dry_weight, fuel_tanks,water_tanks, Production_materials,  Exterior_design,  Interior_Design, passenger_capacity, cabins, manufacturer  ) values(2,'Azimut 54','16.70  m', '4.95 m', '1.35 m','null','null', '12 degrees','null',' 2340 l','590 l','VTR/GRP','Stefano Righini',' Azimut Yachts','null','3+1',' Azimut Yachts (Italy)');

insert into configuration( id_pro, model, length_overall, beam, draft_max,  draft_min, bridge_clearance,  deadrise,   dry_weight, fuel_tanks,water_tanks, Production_materials,  Exterior_design,  Interior_Design, passenger_capacity, cabins, manufacturer  ) values(3,'Azimut 55','16.7  m','4.95  m','1.35 m','null','null','12 degrees','null','2300 l','590  l',' GRPG/VTR',' Stefano Righini','Achille Salvagni','null',' 3+1',' Azimut Yachts (Italy)');

insert into configuration(id_pro, model, length_overall, beam, draft_max,  draft_min, bridge_clearance,  deadrise,   dry_weight, fuel_tanks,water_tanks, Production_materials,  Exterior_design,  Interior_Design, passenger_capacity, cabins, manufacturer  ) values(4,'Azimut 60',' 18.25  m','5.05 m','1.35 m','null','null','12 degrees','null',' 2800 l','750  l',' GRP','null','null','null','3+1',' Azimut Yachts (Italy)');

insert into configuration( id_pro, model, length_overall, beam, draft_max,  draft_min, bridge_clearance,  deadrise,   dry_weight, fuel_tanks,water_tanks, Production_materials,  Exterior_design,  Interior_Design, passenger_capacity, cabins, manufacturer  ) values(5,'Azimut 66','20.33 m',' 5.23 m',' 1.6 m','null','null','17 degrees','null',' 3900 l',' 1000 l',' VTR','Stefano Righini','Carlo Galeazzi','null',' 4+1',' Azimut Yachts (Italy)');

insert into configuration(id_pro, model, length_overall, beam, draft_max,  draft_min, bridge_clearance,  deadrise,   dry_weight, fuel_tanks,water_tanks, Production_materials,  Exterior_design,  Interior_Design, passenger_capacity, cabins, manufacturer   ) values(6,'Azimut 72',' 22.05 m','5.60 m',' 1.82 m','null','null','15.6 degrees','null',' 5200 l','1100 l',' VTR/GRP & carbon','Stefano Righini','Carlo Galeazzi','null','4+2',' Azimut Yachts (Italy)');

insert into configuration( id_pro, model, length_overall, beam, draft_max,  draft_min, bridge_clearance,  deadrise,   dry_weight, fuel_tanks,water_tanks, Production_materials,  Exterior_design,  Interior_Design, passenger_capacity, cabins, manufacturer  ) values(7,'Azimut 80','23.71 m','6.18 m','1.72 m','null','null','16.6 degrees','null','6000 l','1100 l','VTR/GRP','  Stefano Righini',' Salvagni Architetti','null','4+2',' Azimut Yachts (Italy)');

insert into configuration( id_pro, model, length_overall, beam, draft_max,  draft_min, bridge_clearance,  deadrise,   dry_weight, fuel_tanks,water_tanks, Production_materials,  Exterior_design,  Interior_Design, passenger_capacity, cabins, manufacturer  ) values(8,'Magellano 43','13.63 m','4.40 m','1.20 m','null','null','16.6 degrees','null',' 1680 l','600 l','VTR/GRP','Cor D. Rover Yacht Design','Style Dept. Azimut MC','null','2/3','Azimut Yachts (Italy)');

insert into configuration( id_pro, model, length_overall, beam, draft_max,  draft_min, bridge_clearance,  deadrise,   dry_weight, fuel_tanks,water_tanks, Production_materials,  Exterior_design,  Interior_Design, passenger_capacity, cabins, manufacturer   ) values(9,'Magellano 53','16.89  m',' 4.70 m','1.44 m','null','null','16.6 degress','null','3200 l','700 l',' VTR/GRP',' Cor D. Rover Yacht Design','Azimut Yachts','null','3/4 + 1 ',' Azimut Yachts (Italy)');
insert into configuration( id_pro, model, length_overall, beam, draft_max,  draft_min, bridge_clearance,  deadrise,   dry_weight, fuel_tanks,water_tanks, Production_materials,  Exterior_design,  Interior_Design, passenger_capacity, cabins, manufacturer   ) values(10,'Magellano 66',' 20.15  m','5.40 m','1.67 m','null','null','16.6 degrees','null','45000 l','1000 l',' VTR/GRP','Cor D. Rover Yacht Design','Azimut Yachts','null','3/4 + 1',' Azimut Yachts (Italy)');

insert into configuration( id_pro, model, length_overall, beam, draft_max,  draft_min, bridge_clearance,  deadrise,   dry_weight, fuel_tanks,water_tanks, Production_materials,  Exterior_design,  Interior_Design, passenger_capacity, cabins, manufacturer   ) values(11,'Magellano 76','24.40  m','6.13 m','1.81 m','null','null','16.6 degrees','null','7500 l','1400 l',' VTR/GRP',' Ken Freivokh','Azimut Yachts','null','4+2',' Azimut Yachts (Italy)');

insert into configuration( id_pro, model, length_overall, beam, draft_max,  draft_min, bridge_clearance,  deadrise,   dry_weight, fuel_tanks,water_tanks, Production_materials,  Exterior_design,  Interior_Design, passenger_capacity, cabins, manufacturer  ) values(12,'Atlantis 34','10.25 m','3.44 m','0.94 m','null','null','17.78 degrees','null','650 l','185 l','null','null','null','null','4+2',' Azimut Yachts (Italy)');

insert into configuration( id_pro, model, length_overall, beam, draft_max,  draft_min, bridge_clearance,  deadrise,   dry_weight, fuel_tanks,water_tanks, Production_materials,  Exterior_design,  Interior_Design, passenger_capacity, cabins, manufacturer  ) values(13,'Atlantis 43','13.86 m','4.25 m ','0.90 m','null','null','15 degrees','null','900 l','350 l','VTR/GRP','Neo Design','Neo Design & Azimut Yachts','null','4+2+1',' Azimut Yachts (Italy)');

insert into configuration(id_pro, model, length_overall, beam, draft_max,  draft_min, bridge_clearance,  deadrise,   dry_weight, fuel_tanks,water_tanks, Production_materials,  Exterior_design,  Interior_Design, passenger_capacity, cabins, manufacturer   ) values(14,'Atlantis 51','16.18 m','4.5 m','null','null','null','null','null','1500 l','450 l','VTR/GRP','Neo Design','null','null','3',' Azimut Yachts (Italy)');

insert into configuration(id_pro, model, length_overall, beam, draft_max,  draft_min, bridge_clearance,  deadrise,   dry_weight, fuel_tanks,water_tanks, Production_materials,  Exterior_design,  Interior_Design, passenger_capacity, cabins, manufacturer  ) values(15,'Atlantis 50','16.30 m','4.3 m','1.3 m','null','null','15 dergees','null','1700 l','420 l','VTR/GRP','Neo Design',' Neo Design & Azimut Yachts','null','2/3','Azimut Yachts (Italy)');

insert into configuration(id_pro, model, length_overall, beam, draft_max,  draft_min, bridge_clearance,  deadrise,   dry_weight, fuel_tanks,water_tanks, Production_materials,  Exterior_design,  Interior_Design, passenger_capacity, cabins, manufacturer   ) values(16,'Azimut 55s','17.29 m','4.75 m','1.14 m','null','null','15.8 degrees','null','1600 l','590l',' VTR/GRP & carbon','Stefano Righini','Carlo Galeazzi','null','3+1',' Azimut Yachts (Italy)');

insert into configuration(id_pro, model, length_overall, beam, draft_max,  draft_min, bridge_clearance,  deadrise,   dry_weight, fuel_tanks,water_tanks, Production_materials,  Exterior_design,  Interior_Design, passenger_capacity, cabins, manufacturer  ) values(17,'Azimut s6','18 m','4.75 m','null','null','null','null','null','2600 l','590 l','Carbon + VTR/GRP',' Stefano Righini','Francesco Guida','null','3+1 crew',' Azimut Yachts (Italy)');

insert into configuration( id_pro, model, length_overall, beam, draft_max,  draft_min, bridge_clearance,  deadrise,   dry_weight, fuel_tanks,water_tanks, Production_materials,  Exterior_design,  Interior_Design, passenger_capacity, cabins, manufacturer   ) values(19,'Azimut 77s','23.66 m','5.55 m','1.64m ','null','null','14 degrees','null','4000 l','1100 l','VTR/GRP','Stefano Righini','Carlo Galeazzi','null','4+2',' Azimut Yachts (Italy)');

insert into configuration( id_pro, model, length_overall, beam, draft_max,  draft_min, bridge_clearance,  deadrise,   dry_weight, fuel_tanks,water_tanks, Production_materials,  Exterior_design,  Interior_Design, passenger_capacity, cabins, manufacturer  ) values(20,'25 Metri','26.62 m','6.2 m','1.8 m','null','null','null','null','7800 l','1100 l','GPR','Stefano Righini',' Achille Salvagni Architetti','null','4+2 crew',' Azimut Yachts (Italy)');



insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('Monterey 204FS.jpg','Monterey 204FS',5700,30,1,'2017','Sport');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('Monterey 224FS.jpg','Monterey 224FS',6260,30,1,'2017','Sport');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('Monterey 218SS.jpg','Monterey 218SS',7290,30,1,'2017','Sport');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('Monterey 238SS.jpg','Monterey 238SS',8340,30,1,'2017','Sport');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('Monterey 258SS.jpg','Monterey 258SS',1130,30,1,'2017','Sport');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('Monterey 278SS.jpg','Monterey 278SS',1220,30,1,'2017','Sport');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('Monterey 278SSC.jpg','Monterey 278SSC',1270,30,1,'2019','Sport');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('Monterey 298SS.jpg','Monterey 298SS',1600,20,1,'2019','Sport');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('Monterey 328SS.jpg','Monterey 328SS',2520,30,1,'2017','Sport');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('Monterey 378SE.jpg','Monterey 378SE',1200,30,1,'2017','Sport');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('Monterey 385SE.jpg','Monterey 385SE',2300,30,1,'2019','Sport');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('Monterey 275SY.jpg','Monterey 275SY',1620,30,1,'2017','Sport');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('Monterey 295SY.jpg','Monterey 295SY',1820,30,1,'2017','Sport');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('Monterey 335SY.jpg','Monterey 335SY',3399,30,1,'2017','Sport');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('Monterey 355SY.jpg','Monterey 355SY',3890,30,1,'2017','Sport');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('Monterey 360SC.jpg','Monterey 360SC',3900,30,1,'2017','Sport');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('Monterey M20.jpg','Monterey M20',700,30,1,'2018','Sport');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('Monterey M22.jpg','Monterey M22',60030,30,1,'2018','Sport');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('Monterey M4.jpg','Monterey M4',980,30,1,'2017','Sport');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('Monterey M6.jpg','Monterey M6',1100,30,1,'2017','Sport');

insert into photos(id_pro, img) values ( 21, 'Monterey 204FS1.jpg');
insert into photos(id_pro, img) values ( 21, 'Monterey 204FS2.jpg');
insert into photos(id_pro, img) values ( 21, 'Monterey 204FS3.jpg');
insert into photos(id_pro, img) values ( 21, 'Monterey 204FS4.jpg');
insert into photos(id_pro, img) values ( 21, 'Monterey 204FS5.jpg');
insert into photos(id_pro, img) values ( 21, 'Monterey 204FS6.jpg');
insert into photos(id_pro, img) values ( 21, 'Monterey 204FS7.jpg');
insert into photos(id_pro, img) values ( 21, 'Monterey 204FS8.jpg');
insert into photos(id_pro, img) values ( 21, 'Monterey 204FS9.jpg');
insert into photos(id_pro, img) values ( 21, 'Monterey 204FS10.jpg');
insert into photos(id_pro, img) values ( 21, 'Monterey 204FS11.jpg');

insert into photos(id_pro, img) values ( 22, 'Monterey 224FS1.jpg');
insert into photos(id_pro, img) values ( 22, 'Monterey 224FS2.jpg');
insert into photos(id_pro, img) values ( 22, 'Monterey 224FS3.jpg');
insert into photos(id_pro, img) values ( 22, 'Monterey 224FS4.jpg');
insert into photos(id_pro, img) values ( 22, 'Monterey 224FS5.jpg');
insert into photos(id_pro, img) values ( 22, 'Monterey 224FS6.jpg');
insert into photos(id_pro, img) values ( 22, 'Monterey 224FS7.jpg');
insert into photos(id_pro, img) values ( 22, 'Monterey 224FS8.jpg');
insert into photos(id_pro, img) values ( 22, 'Monterey 224FS9.jpg');
insert into photos(id_pro, img) values ( 22, 'Monterey 224FS10.jpg');
insert into photos(id_pro, img) values ( 22, 'Monterey 224FS11.jpg');

insert into photos(id_pro, img) values ( 23, 'Monterey 218SS1.jpg');
insert into photos(id_pro, img) values ( 23, 'Monterey 218SS2.jpg');
insert into photos(id_pro, img) values ( 23, 'Monterey 218SS3.jpg');
insert into photos(id_pro, img) values ( 23, 'Monterey 218SS4.jpg');
insert into photos(id_pro, img) values ( 23, 'Monterey 218SS5.jpg');
insert into photos(id_pro, img) values ( 23, 'Monterey 218SS6.jpg');
insert into photos(id_pro, img) values ( 23, 'Monterey 218SS7.jpg');
insert into photos(id_pro, img) values ( 23, 'Monterey 218SS8.jpg');
insert into photos(id_pro, img) values ( 23, 'Monterey 218SS9.jpg');
insert into photos(id_pro, img) values ( 23, 'Monterey 218SS10.jpg');


insert into photos(id_pro, img) values ( 24, 'Monterey 238SS4.jpg');
insert into photos(id_pro, img) values ( 24, 'Monterey 238SS5.jpg');
insert into photos(id_pro, img) values ( 24, 'Monterey 238SS6.jpg');
insert into photos(id_pro, img) values ( 24, 'Monterey 238SS7.jpg');
insert into photos(id_pro, img) values ( 24, 'Monterey 238SS8.jpg');
insert into photos(id_pro, img) values ( 24, 'Monterey 238SS9.jpg');
insert into photos(id_pro, img) values ( 24, 'Monterey 238SS10.jpg');
insert into photos(id_pro, img) values ( 24, 'Monterey 238SS11.jpg');
insert into photos(id_pro, img) values ( 24, 'Monterey 238SS1.jpg');
insert into photos(id_pro, img) values ( 24, 'Monterey 238SS2.jpg');
insert into photos(id_pro, img) values ( 24, 'Monterey 238SS3.jpg');

insert into photos(id_pro, img) values ( 25, 'Monterey 258SS1.jpg');
insert into photos(id_pro, img) values ( 25, 'Monterey 258SS2.jpg');
insert into photos(id_pro, img) values ( 25, 'Monterey 258SS3.jpg');
insert into photos(id_pro, img) values ( 25, 'Monterey 258SS4.jpg');
insert into photos(id_pro, img) values ( 25, 'Monterey 258SS5.jpg');
insert into photos(id_pro, img) values ( 25, 'Monterey 258SS6.jpg');
insert into photos(id_pro, img) values ( 25, 'Monterey 258SS7.jpg');

insert into photos(id_pro, img) values ( 26, 'Monterey 278SS1.jpg');
insert into photos(id_pro, img) values ( 26, 'Monterey 278SS2.jpg');
insert into photos(id_pro, img) values ( 26, 'Monterey 278SS3.jpg');
insert into photos(id_pro, img) values ( 26, 'Monterey 278SS4.jpg');
insert into photos(id_pro, img) values ( 26, 'Monterey 278SS5.jpg');
insert into photos(id_pro, img) values ( 26, 'Monterey 278SS6.jpg');


insert into photos(id_pro, img) values ( 27, 'Monterey 298SS1.jpg');
insert into photos(id_pro, img) values ( 27, 'Monterey 298SS2.jpg');
insert into photos(id_pro, img) values ( 27, 'Monterey 298SS3.jpg');
insert into photos(id_pro, img) values ( 27, 'Monterey 298SS4.jpg');
insert into photos(id_pro, img) values ( 27, 'Monterey 298SS5.jpg');
insert into photos(id_pro, img) values ( 27, 'Monterey 298SS6.jpg');
insert into photos(id_pro, img) values ( 27, 'Monterey 298SS7.jpg');
insert into photos(id_pro, img) values ( 27, 'Monterey 298SS8.jpg');

insert into photos(id_pro, img) values ( 28, 'Monterey 328SS1.jpg');
insert into photos(id_pro, img) values ( 28, 'Monterey 328SS2.jpg');
insert into photos(id_pro, img) values ( 28, 'Monterey 328SS3.jpg');
insert into photos(id_pro, img) values ( 28, 'Monterey 328SS4.jpg');
insert into photos(id_pro, img) values ( 28, 'Monterey 328SS5.jpg');
insert into photos(id_pro, img) values ( 28, 'Monterey 328SS6.jpg');
insert into photos(id_pro, img) values ( 28, 'Monterey 328SS7.jpg');
insert into photos(id_pro, img) values ( 28, 'Monterey 328SS8.jpg');
insert into photos(id_pro, img) values ( 28, 'Monterey 328SS9.jpg');
insert into photos(id_pro, img) values ( 28, 'Monterey 328SS10.jpg');

insert into photos(id_pro, img) values ( 29, 'Monterey 378SE1.jpg');
insert into photos(id_pro, img) values ( 29, 'Monterey 378SE2.jpg');
insert into photos(id_pro, img) values ( 29, 'Monterey 378SE3.jpg');
insert into photos(id_pro, img) values ( 29, 'Monterey 378SE4.jpg');

insert into photos(id_pro, img) values ( 30, 'Monterey 385 SE1.jpg');
insert into photos(id_pro, img) values ( 30, 'Monterey 385 SE2.jpg');
insert into photos(id_pro, img) values ( 30, 'Monterey 385 SE3.jpg');
insert into photos(id_pro, img) values ( 30, 'Monterey 385 SE4.jpg');
insert into photos(id_pro, img) values ( 30, 'Monterey 385 SE5.jpg');
insert into photos(id_pro, img) values ( 30, 'Monterey 385 SE6.jpg');
insert into photos(id_pro, img) values ( 30, 'Monterey 385 SE7.jpg');

insert into photos(id_pro, img) values ( 31, 'Monterey 275SY1.jpg');
insert into photos(id_pro, img) values ( 31, 'Monterey 275SY2.jpg');
insert into photos(id_pro, img) values ( 31, 'Monterey 275SY3.jpg');
insert into photos(id_pro, img) values ( 31, 'Monterey 275SY4.jpg');
insert into photos(id_pro, img) values ( 31, 'Monterey 275SY5.jpg');
insert into photos(id_pro, img) values ( 31, 'Monterey 275SY6.jpg');
insert into photos(id_pro, img) values ( 31, 'Monterey 275SY7.jpg');
insert into photos(id_pro, img) values ( 31, 'Monterey 275SY8.jpg');
insert into photos(id_pro, img) values ( 31, 'Monterey 275SY9.jpg');
insert into photos(id_pro, img) values ( 31, 'Monterey 275SY10.jpg');

insert into photos(id_pro, img) values ( 32, 'Monterey 295SY1.jpg');
insert into photos(id_pro, img) values ( 32, 'Monterey 295SY2.jpg');
insert into photos(id_pro, img) values ( 32, 'Monterey 295SY3.jpg');
insert into photos(id_pro, img) values ( 32, 'Monterey 295SY4.jpg');
insert into photos(id_pro, img) values ( 32, 'Monterey 295SY5.jpg');
insert into photos(id_pro, img) values ( 32, 'Monterey 295SY6.jpg');
insert into photos(id_pro, img) values ( 32, 'Monterey 295SY7.jpg');
insert into photos(id_pro, img) values ( 32, 'Monterey 295SY8.jpg');
insert into photos(id_pro, img) values ( 32, 'Monterey 295SY9.jpg');
insert into photos(id_pro, img) values ( 32, 'Monterey 295SY10.jpg');

insert into photos(id_pro, img) values ( 33, 'Monterey 335SY1.jpg');
insert into photos(id_pro, img) values ( 33, 'Monterey 335SY2.jpg');
insert into photos(id_pro, img) values ( 33, 'Monterey 335SY3.jpg');
insert into photos(id_pro, img) values ( 33, 'Monterey 335SY4.jpg');
insert into photos(id_pro, img) values ( 33, 'Monterey 335SY5.jpg');
insert into photos(id_pro, img) values ( 33, 'Monterey 335SY6.jpg');
insert into photos(id_pro, img) values ( 33, 'Monterey 335SY7.jpg');
insert into photos(id_pro, img) values ( 33, 'Monterey 335SY8.jpg');

insert into photos(id_pro, img) values ( 34, 'Monterey 355SY1.jpg');
insert into photos(id_pro, img) values ( 34, 'Monterey 355SY2.jpg');
insert into photos(id_pro, img) values ( 34, 'Monterey 355SY3.jpg');
insert into photos(id_pro, img) values ( 34, 'Monterey 355SY4.jpg');
insert into photos(id_pro, img) values ( 34, 'Monterey 355SY5.jpg');
insert into photos(id_pro, img) values ( 34, 'Monterey 355SY6.jpg');
insert into photos(id_pro, img) values ( 34, 'Monterey 355SY7.jpg');
insert into photos(id_pro, img) values ( 34, 'Monterey 355SY8.jpg');
insert into photos(id_pro, img) values ( 34, 'Monterey 355SY9.jpg');

insert into photos(id_pro, img) values ( 35, 'Monterey 355SY1.jpg');
insert into photos(id_pro, img) values ( 35, 'Monterey 355SY2.jpg');
insert into photos(id_pro, img) values ( 35, 'Monterey 355SY3.jpg');
insert into photos(id_pro, img) values ( 35, 'Monterey 355SY4.jpg');
insert into photos(id_pro, img) values ( 35, 'Monterey 355SY5.jpg');
insert into photos(id_pro, img) values ( 35, 'Monterey 355SY6.jpg');
insert into photos(id_pro, img) values ( 35 , 'Monterey 355SY7.jpg');
insert into photos(id_pro, img) values ( 35 , 'Monterey 355SY8.jpg');
insert into photos(id_pro, img) values ( 35, 'Monterey 355SY9.jpg');

insert into photos(id_pro, img) values ( 36, 'Monterey 360SC1.jpg');
insert into photos(id_pro, img) values ( 36, 'Monterey 360SC2.jpg');
insert into photos(id_pro, img) values ( 36, 'Monterey 360SC3.jpg');
insert into photos(id_pro, img) values ( 36, 'Monterey 360SC4.jpg');
insert into photos(id_pro, img) values ( 36, 'Monterey 360SC5.jpg');
insert into photos(id_pro, img) values ( 36, 'Monterey 360SC6.jpg');
insert into photos(id_pro, img) values ( 36, 'Monterey 360SC8.jpg');
insert into photos(id_pro, img) values ( 36, 'Monterey 360SC7.jpg');

insert into photos(id_pro, img) values ( 37, 'Monterey M201.jpg');
insert into photos(id_pro, img) values ( 37, 'Monterey M202.jpg');
insert into photos(id_pro, img) values ( 37, 'Monterey M203.jpg');
insert into photos(id_pro, img) values ( 37, 'Monterey M204.jpg');
insert into photos(id_pro, img) values ( 37, 'Monterey M205.jpg');
insert into photos(id_pro, img) values ( 37, 'Monterey M206.jpg');

insert into photos(id_pro, img) values ( 38, 'Monterey M221.jpg');
insert into photos(id_pro, img) values ( 38, 'Monterey M222.jpg');
insert into photos(id_pro, img) values ( 38, 'Monterey M223.jpg');
insert into photos(id_pro, img) values ( 38, 'Monterey M224.jpg');
insert into photos(id_pro, img) values ( 38, 'Monterey M225.jpg');
insert into photos(id_pro, img) values ( 38, 'Monterey M226.jpg');

insert into photos(id_pro, img) values ( 39, 'Monterey M41.jpg');
insert into photos(id_pro, img) values ( 39, 'Monterey M42.jpg');
insert into photos(id_pro, img) values ( 39, 'Monterey M43.jpg');
insert into photos(id_pro, img) values ( 39, 'Monterey M44.jpg');
insert into photos(id_pro, img) values ( 39, 'Monterey M45.jpg');
insert into photos(id_pro, img) values ( 39, 'Monterey M46.jpg');
insert into photos(id_pro, img) values ( 39, 'Monterey M47.jpg');
insert into photos(id_pro, img) values ( 39, 'Monterey M48.jpg');
insert into photos(id_pro, img) values ( 39, 'Monterey M49.jpg');

insert into photos(id_pro, img) values ( 40, 'Monterey M41.jpg');
insert into photos(id_pro, img) values ( 40, 'Monterey M62.jpg');
insert into photos(id_pro, img) values ( 40, 'Monterey M63.jpg');
insert into photos(id_pro, img) values ( 40, 'Monterey M64.jpg');
insert into photos(id_pro, img) values ( 40, 'Monterey M65.jpg');
insert into photos(id_pro, img) values ( 40, 'Monterey M66.jpg');
insert into photos(id_pro, img) values ( 40, 'Monterey M67.jpg');
insert into photos(id_pro, img) values ( 40, 'Monterey M68.jpg');
insert into photos(id_pro, img) values ( 40, 'Monterey M69.jpg');
insert into photos(id_pro, img) values ( 40, 'Monterey M610.jpg');








insert into desc_pro( id_pro, info, featured, advanced, additional) values (21, '
<p>
Strong and luxurious are two words used to describe 204FS. The Facet Series design will turn 204FS into an outstanding boat. The boat is also equipped with amenities such as a stainless steel cup holder, a swim deck and a ladder into the water and spacious seats
</p>
', '                           <li>Bimini top</li>
                           <li>Refrigerator, 25 Qt, manual book</li>
                           <li>12V LED light</li>
                           <li>Glove box </li>
', '                           <li>11Kw Generator </li>
                           <li>Fiberglass liner cockpit </li>
                           <li>Handles for drinks</li>
                           <li>Fiberglass liner cockpit</li>
                           <li>12V socket </li>
                           <li>Stereo Fusion Satellite AM / FM with iPod dock & 4 speakers </li>
                           <li>Battery replacement kit</li>
                           <li>Battery case</li>
                           <li>Electrical system against heat / water</li>
                           <li>Engine compartment </li>
                           <li>Automatic boat bottom pump</li>
                           <li>Fire fighting set </li>
                           <li>Ventilation system </li>
                           <li>The bottom of the boat and the engine compartment are covered with gelcoat </li>
                           <li>Road with double fuel </li>
                           <li>Equipment with anti-fog system and lights </li>
                           <li>MP3 adapter</li>
', '                           <li>Socket, 12V</li>
                           <li>Steering wheel, black with silver details</li>
                           <li>Electric steering system</li>
                           <li>Buttons, heat and water resistant </li>
                           <li>Boat hull & deck</li>
                           <li>Cover layer, Vinylester </li>
                           <li>The eyes at the stern and nose are made of stainless steel </li>
                           <li>Stainless steel wire stem (6)</li>
                           <li>Paint the lines on the hull</li>
                           <li>Waste hole </li>
                           <li>Permanent warranty for the hull </li>
                           <li>LED driving light</li>
                           <li>NMMA certificate </li>
                           <li>Stainless steel ski tow</li>
                           <li>Anchor compartment under cushion on nose</li>
                           <li>Ladder into the water</li>
');

insert into desc_pro( id_pro, info, featured, advanced, additional) values (22, '
<p>
224FS is a boat that people will look back to see passing by the Facet Series of Monterey and the beauty of being arrogant. Strong ribs and classy amenities include an optional brace and a windshield to make the boat look fast, even when it docked.

</p>
', '                        <li> Door, with stairs going right</li>
                           <li>Fridge </li>
                           <li>12V LED light </li>
                           <li>Glove box </li>
', '                       <li> Fiberglass liner cockpit</li>
                           <li> Handles for drinks</li>
                           <li> balcony</li>
                           <li> Stereo Fusion Satellite AM / FM with iPod dock & 4 speakers</li>
                           <li>Storage compartment </li>
                           <li> Battery case</li>
                           <li> Electrical system against heat / water</li>
                           <li>Automatic boat bottom pump </li>
                           <li> Fire fighting set</li>
                           <li>Ventilation system </li>
                           <li>The bottom of the boat and the engine compartment are covered with gelcoat </li>
                           <li>Road with double fuel </li>
                           <li> </li>
                           <li> </li>
                           <li> </li>
                           <li>Equipment with anti-fog system and lights </li>
                           <li>MP3 adapter </li>
', '                           <li>Socket, 12V</li>
                           <li>Steering wheel, black with silver details</li>
                           <li>Electric steering system</li>
                           <li>Rotation system</li>
                           <li>Buttons, heat and water resistant </li>
                           <li> Air Assist Chine</li>
                           <li> Cover layer, Vinylester</li>
                           <li>The eyes at the stern and nose are made of stainless steel </li>
                           <li>Stainless steel wire stem (6) </li>
                           <li>Paint the lines on the hull </li>
                           <li>Waste hole </li>
                           <li>Horn </li>
                           <li>Permanent warranty for the hull </li>
                           <li>LED driving light </li>
                           <li> NMMA certificate</li>
                           <li> Anchor compartment under cushion on nose</li>
');

insert into desc_pro( id_pro, info, featured, advanced, additional) values (23, '
<p>Monterey Super Sport brings that feeling to the surface. With the success of the large Super Sport line, the 328, we gathered all the essence to make this boat look. At 21 feet, the 328 can make you feel like the boat is small but trust us. This is a real machine!

</p>
', '                        <li> Refrigerator, 48 Qt, portable</li>
                           <li> Refrigerator fixed</li>
                           <li>12V LED light </li>
                           <li>Glove box </li>
', '                       <li>Furniture uses fiberglass </li>
                           <li>Handles for drinks </li>
                           <li>Hatch in engine compartment </li>
                           <li>12V socket </li>
                           <li> Stereo Fusion Satellite AM / FM with iPod dock & 4 speakers</li>
                           <li>Battery replacement kit </li>
                           <li>Battery case </li>
                           <li> Electrical system against heat / water</li>
                           <li> Automatic boat bottom pump</li>
                           <li>Fire fighting set </li>
                           <li>Ventilation system </li>
                           <li> The bottom of the boat and the engine compartment are covered with gelcoat</li>
                           <li>Fuel system </li>
                           <li>Road with double fuel </li>
                           <li>Equipment with anti-fog system and lights </li>
                           <li>MP3 adapter </li>
                           <li>Socket, 12V </li>
', '                           <li>Steering wheel, black with silver details</li>
                           <li>Electric steering system </li>
                           <li>Buttons, heat and water resistant </li>
                           <li>Air Assist Chine</li>
                           <li> Cover layer, Vinylester</li>
                           <li> The eyes at the stern and nose are made of stainless steel</li>
                           <li> Stainless steel wire stem (6)</li>
                           <li>Paint the lines on the hull </li>
                           <li> Permanent warranty for the hull</li>
                           <li>LED driving light </li>
                           <li>Anchor compartment under cushion on nose </li>
                           <li>Stainless steel ski tow </li>
                           <li> Ladder into the water</li>
                           <li> The swim platform goes well with the hull</li>
                           <li>Sheath for transport </li>
                           <li>Aisle at the tail </li>
');

insert into desc_pro( id_pro, info, featured, advanced, additional) values (24, '
<p>
Equipped with the largest sunpad on the market for boats of this size, 238 is born for sun lovers! The Sunpad also has a Monterey Signature flip backrest. 238 comes with spacious compartments for all your devices.

Speaking of seats, you can choose your 238 with a left-sided fixed mattress or a multi-position backrest
</p>
', '                        <li> Refrigerator, 48 Qt, portable</li>
                           <li> Refrigerator fixed</li>
                           <li> 12V LED light</li>
                           <li> Glove box</li>
', '                       <li> Glass-lined cockpit liner</li>
                           <li> Cup drawer</li>
                           <li> Hatch in engine compartment</li>
                           <li>12V socket </li>
                           <li>Stereo Fusion Satellite AM / FM with iPod dock & 4 speakers </li>
                           <li> Faculty</li>
                           <li> Battery replacement kit</li>
                           <li> Battery case</li>
                           <li> Electrical system against heat / water</li>
                           <li> Engine compartment</li>
                           <li>Automatic boat bottom pump </li>
                           <li> Fire fighting set</li>
                           <li> The bottom of the boat and the engine compartment are covered with gelcoat</li>
                           <li> Ventilation system</li>
                           <li> Road with double fuel</li>
                           <li>Equipment with anti-fog system and lights </li>
                           <li>Electric steering system</li>
', '                           <li>Steering wheel, black with silver details</li>
                           <li>Buttons, heat and water resistant </li>
                           <li>Boat hull & deck </li>
                           <li>The eyes at the stern and nose are made of stainless steel</li>
                           <li> Stainless steel wire stem (6)</li>
                           <li> Paint the lines on the hull</li>
                           <li> Permanent warranty for the hull</li>
                           <li> LED driving light</li>
                           <li> NMMA certificate</li>
                           <li> Stainless steel ski tow</li>
                           <li> Anchor compartment under cushion on nose</li>
                           <li> Ladder into the water</li>
                           <li> The swim platform goes well with the hull</li>
                           <li> Sheath for transport</li>
                           <li> Windproof glass, Onyx</li>
                           <li> Sundeck with seats</li>
');

insert into desc_pro( id_pro, info, featured, advanced, additional) values (25, '
<p>
Let''s celebrate with Monterey''s new model - 258SS. Monterey has integrated the best functions of the line to design the perfect boat that you can experience better than ever. Manufactured with the most advanced technology, 258SS guarantees to meet all your desires.
</p>
', '                        <li>Refrigerator, 25 Qt, manual, 2 </li>
                           <li> 12V LED light</li>
                           <li> Glove box</li>
                           <li> Fiberglass liner cockpit</li>
', '                       <li>Handles for drinks </li>
                           <li> Hatch in engine compartment</li>
                           <li>12V socket </li>
                           <li> Stereo Fusion Satellite AM / FM with iPod dock & 4 speakers</li>
                           <li> Compartment</li>
                           <li> Battery replacement kit</li>
                           <li> Battery case</li>
                           <li> Electrical system against heat / wat</li>
                           <li>Engine compartment </li>
                           <li> Automatic boat bottom pump</li>
                           <li>Fire fighting set </li>
                           <li>The bottom of the boat and the engine compartment are covered with gelcoat </li>
                           <li>Fuel system </li>
                           <li> Road with double fuel</li>
                           <li> Equipment with anti-fog system and lights</li>
                           <li>MP3 adapter</li>
                           <li>Socket, 12V</li>
', '                           <li>Steering wheel, black with silver details</li>
                           <li> Electric steering system</li>
                           <li>Rotation system </li>
                           <li>Buttons, heat and water resistant</li>
                           <li>Boat hull & deck </li>
                           <li> Air Assist Chine</li>
                           <li> Cover layer, Vinylester</li>
                           <li> The eyes at the stern and nose are made of stainless steel</li>
                           <li>Stainless steel wire stem (6) </li>
                           <li>Paint the lines on the hull </li>
                           <li>Waste hole </li>
                           <li> Permanent warranty for the hull</li>
                           <li>LED driving light </li>
                           <li> NMMA certificate</li>
                           <li>Stainless steel ski tow </li>
                           <li> Anchor compartment under cushion on nose</li>
');

insert into desc_pro( id_pro, info, featured, advanced, additional) values (26, '
<p>
Delicate, high performance and operability. Turning excursions with friends and family on the Monterey 278 SS quickly becomes a habit when you are "addicted" to the experience brought on this speedboat.
</p>
', '                        <li>Refrigerator, 25 Qt, manual, 2 </li>
                           <li>12V LED light </li>
                           <li>Glove box </li>
                           <li> Fiberglass liner cockpit</li>
', '                       <li> Handles for drinks</li>
                           <li> Hatch in engine compartment</li>
                           <li>12V socket </li>
                           <li> Stereo Fusion Satellite AM / FM with iPod dock & 4 speakers</li>
                           <li>Compartment </li>
                           <li> Battery replacement kit</li>
                           <li>Electrical system against heat / water </li>
                           <li>Battery case </li>
                           <li>Automatic boat bottom pump </li>
                           <li>Fire fighting set </li>
                           <li> The bottom of the boat and the engine compartment are covered with gelcoat</li>
                           <li> Ventilation system</li>
                           <li> Road with double fuel</li>
                           <li> Fuel system</li>
                           <li> Equipment with anti-fog system and lights</li>
                           <li>MP3 adapter</li>
                           <li>Rotation system</li>
', '                           <li>Buttons, heat and water resistant</li>
                           <li>Boat hull & deck </li>
                           <li>Air Assist Chine </li>
                           <li>Cover layer, Vinylester </li>
                           <li>The eyes at the stern and nose are made of stainless stee </li>
                           <li> Stainless steel wire stem (6)</li>
                           <li> Paint the lines on the hull</li>
                           <li>Waste hole </li>
                           <li> Permanent warranty for the hull</li>
                           <li>LED driving light </li>
                           <li> NMMA certificate</li>
                           <li>Stainless steel ski tow </li>
                           <li> Anchor compartment under cushion on nose</li>
                           <li> The swim platform goes well with the hull</li>
                           <li> Ladder into the water</li>
                           <li>Windproof glass, Onyx </li>
');

insert into desc_pro( id_pro, info, featured, advanced, additional) values (27, '
<p>
Cruise comfortably in specially designed seats, L-shaped lounge or relax and enjoy the sun on the sunpad. The 278SSC includes a swim platform, stainless steel ski tow and a ladder into the water for you to have fun.

The V-shaped seat in the front provides extra seating and storage space, and is also a comfortable sleeping place for two. You can add wetbar, fridge in cockpit, grill and cover to make a day out into an unforgettable trip!
</p>
', '                        <li> Refrigerator, 48 Qt, manual</li>
                           <li>12V LED light </li>
                           <li>Fiberglass liner cockpit </li>
                           <li>Handles for drinks </li>
', '                       <li>Hatch in engine compartment </li>
                           <li>Stereo Fusion Satellite AM / FM with iPod dock & 4 speakers </li>
                           <li> Shower at the stern (cold water)</li>
                           <li>Battery replacement kit </li>
                           <li> Battery case</li>
                           <li> Electrical system against heat / wate</li>
                           <li> Engine compartment</li>
                           <li>Automatic boat bottom pump </li>
                           <li> Fire fighting set</li>
                           <li> Ventilation system</li>
                           <li> The bottom of the boat and the engine compartment are covered with gelcoat</li>
                           <li> Lights in the engine compartment</li>
                           <li> Electrically controlled hatches</li>
                           <li> Road with double fuel</li>
                           <li> Drive station</li>
                           <li>Storage compartment </li>
                           <li>Depth meter with shallow water alarm system</li>
', '                           <li>Equipment with anti-fog system and lights</li>
                           <li>MP3 adapter </li>
                           <li>Socket, 12V </li>
                           <li>Steering wheel, black with silver details </li>
                           <li>Electric steering system </li>
                           <li> Rotation system</li>
                           <li> Buttons, heat and water resistant</li>
                           <li>Trim tab indicators </li>
                           <li> Boat hull & deck</li>
                           <li> Cover layer, Vinylester</li>
                           <li> The eyes at the stern and nose are made of stainless steel</li>
                           <li> Stainless steel wire stem (6)</li>
                           <li> Paint the lines on the hull</li>
                           <li>Permanent warranty for the hull </li>
                           <li> LED driving light</li>
                           <li> Anchor compartment under cushion on nose</li>
');

insert into desc_pro( id_pro, info, featured, advanced, additional) values (28, '
<p>
This combination of luxury, technology, performance and beauty will change the way you think about motorboats. With a comfortable 9 ''width, 298 comes standard with spacious toilets, and rear seats for relaxation.

You can choose one of many cockpit arrangements, which makes the boat very versatile. You can add a bar or chair at the tail to increase the comfort even further.
</p>
', '                        <li>Refrigerator, 25 Qt, manual, 2 </li>
                           <li> 12V LED light</li>
                           <li> Glove box</li>
                           <li> Fiberglass liner cockpit</li>
', '                       <li>Handles for drinks </li>
                           <li> Hatch in engine compartment</li>
                           <li>12V socket </li>
                           <li> Stereo Fusion Satellite AM / FM with iPod dock & 4 speakers</li>
                           <li> Compartment</li>
                           <li> Battery replacement kit</li>
                           <li> Battery case</li>
                           <li> Electrical system against heat / wat</li>
                           <li>Engine compartment </li>
                           <li> Automatic boat bottom pump</li>
                           <li>Fire fighting set </li>
                           <li>The bottom of the boat and the engine compartment are covered with gelcoat </li>
                           <li>Fuel system </li>
                           <li> Road with double fuel</li>
                           <li> Equipment with anti-fog system and lights</li>
                           <li>MP3 adapter</li>
                           <li>Socket, 12V</li>
', '                           <li>Steering wheel, black with silver details</li>
                           <li> Electric steering system</li>
                           <li>Rotation system </li>
                           <li>Buttons, heat and water resistant</li>
                           <li>Boat hull & deck </li>
                           <li> Air Assist Chine</li>
                           <li> Cover layer, Vinylester</li>
                           <li> The eyes at the stern and nose are made of stainless steel</li>
                           <li>Stainless steel wire stem (6) </li>
                           <li>Paint the lines on the hull </li>
                           <li>Waste hole </li>
                           <li> Permanent warranty for the hull</li>
                           <li>LED driving light </li>
                           <li> NMMA certificate</li>
                           <li>Stainless steel ski tow </li>
                           <li> Anchor compartment under cushion on nose</li>
');

insert into desc_pro( id_pro, info, featured, advanced, additional) values (29, '
<p>
Redefining the word boat, the 328 Super Sport breaks all the rules. 328SS belongs to its own category. Length of 32''2, this double engine bowrider is a beautiful and powerful boat.

The boat includes a solarium with a variety of installation options, hot and cold toilets and spacious cabins for two. Take your family and friends with you, the boat really has many seats. The radar arch and wetbar are just one of the few items on the standard equipment list.
</p>
', '                        <li>Curtain at the stern </li>
                           <li> Bimini Top</li>
                           <li>Casing compartment </li>
                           <li> Casing compartment</li>
', '                       <li>Curtain at the front </li>
                           <li> Refrigerator, 25 Qt. hand books</li>
                           <li>LED 12 V</li>
                           <li> Doors with stairs to go immediately</li>
                           <li> Handles for drinks</li>
                           <li> Fiberglass liner cockpit</li>
                           <li>AC / DC board </li>
                           <li> Battery charge</li>
                           <li> Battery accumulators (2)</li>
                           <li> Galvanic Isolato</li>
                           <li>Automatic boat bottom pum </li>
                           <li> The bottom of the boat and the engine compartment are covered with gelcoat</li>
                           <li> Fire fighting set</li>
                           <li>Ventilation syste</li>
                           <li> Cabinets, below and above</li>
                           <li>Electric stove </li>
                           <li>Microwave oven, 120 V </li>
', '                           <li>Refrigerator, AC / DC</li>
                           <li>Compartment for garbage </li>
                           <li>Depth measurement system </li>
                           <li>Equipment with anti-fog system and lights</li>
                           <li>MP3 adapter </li>
                           <li> Steering wheel, black with silver details</li>
                           <li>Electric steering system </li>
                           <li> Buttons, heat and water resistant</li>
                           <li> Stainless steel Anchor Chafe Plate</li>
                           <li>Cover layer, Vinylester </li>
                           <li>The eyes at the stern and nose are made of stainless steel</li>
                           <li>Stainless steel wire stem (6) </li>
                           <li> Paint the lines on the hul</li>
                           <li>Permanent warranty for the hull </li>
                           <li> Permanent warranty for the hull</li>
                           <li>LED driving ligh</li>
');

insert into desc_pro( id_pro, info, featured, advanced, additional) values (30, '
<p>
The 378SE is like a yacht, allowing you to stay alone with nature and take trips to remote destinations. With a 37 ''length and maximum power of 520HP x 2 engine, you certainly won''t have to sacrifice performance for space and comfort.

On the deck you''ll find large open spaces with cockpit and seating area as well as L-lounge with sunbathing cushions. On the lower deck is a luxurious cabin - where you can rest at night.
</p>
', '                        <li> 40in LED TV</li>
                           <li>Blu-Ray Player </li>
                           <li> Subwoofer</li>
                           <li> Automatic pump</li>
', '                       <li> CO detector (2)</li>
                           <li> Pillow</li>
                           <li>vacuum system </li>
                           <li> Synthetic wooden floor</li>
                           <li> Wardrobe</li>
                           <li> Lights, 12 V</li>
                           <li> Fusion Satellite Ready AM / FM stereo system with iPod Dock, 4 speakers and</li>
                           <li> Dining table with storage compartme</li>
                           <li> V-shaped bed with compartment compartment</li>
                           <li>USB connector </li>
                           <li> Curtain at the stern</li>
                           <li> Casing compartment</li>
                           <li>Curtain at the front </li>
                           <li> Curtain for two sides</li>
                           <li>Desk in cockpit </li>
                           <li>Refrigerator, 25 Qt. hand books </li>
                           <li>LED 12 V </li>
', '                           <li>Doors with stairs to go immediately</li>
                           <li> Handles for drinks</li>
                           <li>Fiberglass liner cockpit </li>
                           <li>120V socket </li>
                           <li>Shower at the stern (Hot / cold </li>
                           <li> Wet Bar with sink, storage compartment</li>
                           <li> AC / DC board</li>
                           <li> Battery charger</li>
                           <li>Battery accumulators (2) </li>
                           <li>Galvanic Isolator </li>
                           <li> Engine compartment</li>
                           <li> Automatic boat bottom pump</li>
                           <li> Fire fighting set</li>
                           <li>The bottom of the boat and the engine compartment are covered with gelcoat </li>
                           <li>Cabinets, below and above </li>
                           <li> Compartment for garbage</li>
');

insert into desc_pro( id_pro, info, featured, advanced, additional) values (31, '
<p>
External engine version of Monterey 378 SE. Monterey 385 SE offers more space in the lower compartment, allowing you to arrange more amenities and more space for leisure and leisure activities on the deck.
</p>
', '                        <li> Refrigerator, 48 Qt, portable</li>
                           <li> Refrigerator fixed</li>
                           <li> 12V LED light</li>
                           <li> Glove box</li>
', '                       <li> Glass-lined cockpit liner</li>
                           <li> Cup drawer</li>
                           <li> Hatch in engine compartment</li>
                           <li>12V socket </li>
                           <li>Stereo Fusion Satellite AM / FM with iPod dock & 4 speakers </li>
                           <li> Faculty</li>
                           <li> Battery replacement kit</li>
                           <li> Battery case</li>
                           <li> Electrical system against heat / water</li>
                           <li> Engine compartment</li>
                           <li>Automatic boat bottom pump </li>
                           <li> Fire fighting set</li>
                           <li> The bottom of the boat and the engine compartment are covered with gelcoat</li>
                           <li> Ventilation system</li>
                           <li> Road with double fuel</li>
                           <li>Equipment with anti-fog system and lights </li>
                           <li>Electric steering system</li>
', '                           <li>Steering wheel, black with silver details</li>
                           <li>Buttons, heat and water resistant </li>
                           <li>Boat hull & deck </li>
                           <li>The eyes at the stern and nose are made of stainless steel</li>
                           <li> Stainless steel wire stem (6)</li>
                           <li> Paint the lines on the hull</li>
                           <li> Permanent warranty for the hull</li>
                           <li> LED driving light</li>
                           <li> NMMA certificate</li>
                           <li> Stainless steel ski tow</li>
                           <li> Anchor compartment under cushion on nose</li>
                           <li> Ladder into the water</li>
                           <li> The swim platform goes well with the hull</li>
                           <li> Sheath for transport</li>
                           <li> Windproof glass, Onyx</li>
                           <li> Sundeck with seats</li>
');

insert into desc_pro( id_pro, info, featured, advanced, additional) values (32, '
<p>
Is the best boat in the trailerable cruiser boat (cruise). 275SY is a perfect blend of style and functionality. The large storage compartment under the control area ensures you can carry all you need. You can choose to add a radar dome and a generator.
</p>
', '                        <li>Automatic pump </li>
                           <li>Automatic pump </li>
                           <li>CO detector (2) </li>
                           <li>Pillow</li>
', '                       <li>Socket, 120 V</li>
                           <li>Dining table with storage compartment </li>
                           <li> Fusion Satellite Ready AM / FM stereo system with iPod Dock, 4 speakers and joystick</li>
                           <li> V-shaped bed with compartment compartment</li>
                           <li>USB connector </li>
                           <li> Curtain at the stern</li>
                           <li> Bimini Top</li>
                           <li>Casing compartment </li>
                           <li> Curtain at the front</li>
                           <li> Curtain for two sides</li>
                           <li> Desk in cockpit</li>
                           <li> Refrigerator, 25 Qt. hand books</li>
                           <li> Doors with stairs to go immediately</li>
                           <li> Handles for drinks</li>
                           <li> Fiberglass liner cockpit</li>
                           <li>120V socket</li>
                           <li>Shower at the stern (Hot / cold) </li>
', '                           <li>Wet Bar with sink, storage compartment</li>
                           <li>AC / DC board </li>
                           <li>Battery charger </li>
                           <li>Battery accumulators (2 </li>
                           <li> Galvanic Isolator</li>
                           <li> Engine compartment</li>
                           <li> Automatic boat bottom pum</li>
                           <li> Fire fighting set</li>
                           <li> Ventilation system</li>
                           <li> The bottom of the boat and the engine compartment are covered with gelcoat</li>
                           <li> Cabinets, below and above</li>
                           <li> Compartment for garbage</li>
                           <li> Stainless steel sink</li>
                           <li>Microwave oven, 120 V </li>
                           <li>Refrigerator, AC / DC </li>
                           <li> Electric stove</li>
');

insert into desc_pro( id_pro, info, featured, advanced, additional) values (33, '
<p>
High performance and stylish lines bring 295SY health and fitness. With a length of 29 ''and a width of 9''2 295SY is a spacious boat, comfortable and stable. Great bar perfect for preparing snacks and drinks. The pool deck is both stylish and functional, allowing for getting in and out of the water via a stainless steel ladder.
</p>
', '                        <li>Automatic pump </li>
                           <li> Carpet</li>
                           <li> CO detector (2)</li>
                           <li>Pillow </li>
', '                       <li>Synthetic wooden floor </li>
                           <li> Fusion Satellite Ready AM / FM stereo system with iPod Dock, 4 speakers and joystick </li>
                           <li> Dining table with storage compartment</li>
                           <li> V-shaped bed with compartment compartment</li>
                           <li> USB connector</li>
                           <li> Curtain at the stern</li>
                           <li> Casing compartment</li>
                           <li> Curtain at the front</li>
                           <li> Curtain for two sides</li>
                           <li>Refrigerator, 25 Qt. hand books </li>
                           <li>Doors with stairs to go immediately </li>
                           <li>Fiberglass liner cockpit </li>
                           <li> Handles for drinks</li>
                           <li>Shower at the stern (Hot / cold) </li>
                           <li>Wet Bar with sink, storage compartment </li>
                           <li>120 V sockete </li>
                           <li>AC / DC board </li>
', '                           <li>Battery charger</li>
                           <li>Battery accumulators (2) </li>
                           <li>Galvanic Isolator </li>
                           <li>Engine compartment </li>
                           <li>Automatic boat bottom pump </li>
                           <li> Fire fighting set</li>
                           <li> Ventilation system</li>
                           <li> The bottom of the boat and the engine compartment are covered with gelcoat</li>
                           <li> Cabinets, below and above</li>
                           <li> Compartment for garbage</li>
                           <li> Stainless steel sink</li>
                           <li> Depth measurement system</li>
                           <li> Equipment with anti-fog system and lights</li>
                           <li>Steering wheel, black with silver details </li>
                           <li> Electric steering system</li>
                           <li> Buttons, heat and water resistant</li>
');

insert into desc_pro( id_pro, info, featured, advanced, additional) values (34, '
<p>
Leaving civil unrest behind in the 335 Sport Yacht. A perfect weekend getaway, the 335SY is equipped with many features of larger boats. The driver station on the 335SY has a double seat and a right compartment. The continuous staircase will allow you to safely onto the bow of the boat to sunbathe on spacious sunpad.
</p>
', '                        <li>Automatic pump </li>
                           <li>Occasionally </li>
                           <li>CO detector (2) </li>
                           <li>Synthetic wooden floor </li>
', '                       <li>Vacuum system </li>
                           <li>Fusion Satellite Ready AM / FM stereo system with iPod Dock, 4 speakers and joystick </li>
                           <li> Dining table with storage compartment</li>
                           <li> V-shaped bed with compartment compartment</li>
                           <li>USB connector </li>
                           <li>Curtain at the stern </li>
                           <li>Bimini Top </li>
                           <li>Casing compartment </li>
                           <li> Curtain at the front</li>
                           <li>Curtain for two sides </li>
                           <li> Desk in cockpit</li>
                           <li>Refrigerator, 25 Qt. hand books</li>
                           <li> LED 12 V</li>
                           <li>Doors with stairs to go immediately </li>
                           <li> Handles for drinks</li>
                           <li>Fiberglass liner cockpit</li>
                           <li>Shower at the stern (Hot / cold</li>
', '                           <li>Wet Bar with sink, storage compartment</li>
                           <li>Automatic boat bottom pump </li>
                           <li>Engine compartmen </li>
                           <li>Automatic boat bottom pump </li>
                           <li>The bottom of the boat and the engine compartment are covered with gelcoa </li>
                           <li> Ventilation system</li>
                           <li>Fire fighting set </li>
                           <li> Cabinets, below and above</li>
                           <li> Depth measurement system</li>
                           <li>Equipment with anti-fog system and lights </li>
                           <li> The eyes at the stern and nose are made of stainless steel</li>
                           <li> Stainless steel Anchor Chafe Plate</li>
                           <li>Buttons, heat and water resistant </li>
                           <li>Electric steering system </li>
                           <li> Steering wheel, black with silver details</li>
                           <li> Anchor compartment under cushion on nose</li>
');

insert into desc_pro( id_pro, info, featured, advanced, additional) values (35, '
<p>
355 Sport Yacht is one of Monterey''s most popular models. The mix of stylish design and comfortable living area makes this boat a winning combination. Equipped with Monterey''s exclusive Sun Island seats, you have three different options for relaxing on the boat. Below the sun island is a spacious storage compartment for all of your cords, bumpers and other utensils.
</p>
', '                        <li> Automatic pump</li>
                           <li>Carpet </li>
                           <li>CO detector (2) </li>
                           <li> Vacuum system</li>
', '                       <li> Vacuum system</li>
                           <li> Fusion Satellite Ready AM / FM stereo system with iPod Dock, 4 speakers and</li>
                           <li> Dining table with storage compartment</li>
                           <li> V-shaped bed with compartment compartment</li>
                           <li>USB connector </li>
                           <li>Curtain at the stern </li>
                           <li> Bimini Top</li>
                           <li>Casing compartment </li>
                           <li>Curtain at the front </li>
                           <li>Curtain for two sides </li>
                           <li>Refrigerator, 25 Qt. hand books </li>
                           <li> LED 12 V</li>
                           <li>Doors with stairs to go immediately </li>
                           <li>Handles for drinks </li>
                           <li> Shower at the stern (Hot / cold)</li>
                           <li>Wet Bar with sink, storage compartment </li>
                           <li>Battery accumulators (2)</li>
', '                           <li>Engine compartment</li>
                           <li>Automatic boat bottom pump</li>
                           <li>Fire fighting set</li>
                           <li>Ventilation system </li>
                           <li>The bottom of the boat and the engine compartment are covered with gelcoat </li>
                           <li> Cabinets, below and above</li>
                           <li>Microwave oven, 120 V </li>
                           <li>Compartment for garbage </li>
                           <li>Stainless steel sink </li>
                           <li>Equipment with anti-fog system and lights </li>
                           <li> Depth measurement system</li>
                           <li> Steering wheel, black with silver details</li>
                           <li> Buttons, heat and water resistant</li>
                           <li>Electric steering system </li>
                           <li> The eyes at the stern and nose are made of stainless steel</li>
                           <li> Stainless steel Anchor Chafe Plate</li>
');

insert into desc_pro( id_pro, info, featured, advanced, additional) values (36, '
<p>
Designed with smart seats, unlimited comfort and superior entertainment system for both upper and lower compartments. The 360SC is truly a leader in the segment. Monterey 360SC is equipped with an advanced cockpit with electric driver seats, 2 bars on both sides. Large L-shaped lounge chair and cabin table. Down below is a comfortable sleeping place with a convertible bed into a sofa and dining table. The kitchen is equipped with a window and top so you can always see the places you''ve been.
</p>
', '                        <li>The seats are very comfortable </li>
                           <li>large space </li>
                           <li> Comfortable and modern design driver station</li>
                           <li> seating area with L-shaped seat and table in cockpit</li>
                            <li> The shaped bed can be assembled into a dining area with a sofa and wooden table</li>
                            <li>Kitchen with full equipment </li>
', '                       <li> tainless steel anchor</li>
                           <li> grill platform</li>
                           <li> Remote control spotlight lamp</li>
                           <li>inlay for swimming platform (SeaDek) </li>
                           <li> Underwater lights, LED 12V</li>
                           <li> 22 "LED flat screen TV with DVD</li>
                           <li> Removable right bar chair</li>
                           <li> carpet in cockpit</li>
                           <li> inlay for cockpit (SeaDek)</li>
                           <li>desk in cockpit </li>
                           <li> grill oven</li>
                           <li>ice machine </li>
                           <li> remote control stereo</li>
                           <li> textile floor</li>
                           <li>Advanced stereo package: wet sounds, 2 bow speakers, subwoofer, 6-channel amplifier, LED speakers </li>
                           <li> Radar, 4KWHD</li>
                           <li> Power system</li>
', '                           <li> Two-way air conditioner 16,000BTU with onshore power line</li>
                           <li>Two-way air conditioner 12,000BTU (cockpit) </li>
                           <li> Propulsion motor at bow, Vetus</li>
                           <li> 7.5 kW gas generator</li>
                           <li> 6.0 kW gas generator</li>
                           <li> gray water system</li>
                           <li> mill with exhaust system</li>
                           <li>bimini top at tail </li>
                           <li> 7.0 kW diesel generator</li>
                           <li> bimini case with pouch</li>
                           <li> shells for windows</li>
');

insert into desc_pro( id_pro, info, featured, advanced, additional) values (37, '
<p>The new Monterey M20 has a strong design and outstanding capacity, equipped with many facilities for a great water experience. Standard equipment includes Air Assit Chine technology from Monterey, lots of cup holders and an integrated swim floor with lots of storage areas. Pull hooks for skiing, ladders into the water and sunbathing are also standard on the M20, a sports canoe that takes you wherever you need to go
</p>
', '                        <li> Refrigerator, 48 Qt, portable</li>
                           <li> Refrigerator fixed</li>
                           <li> 12V LED light</li>
                           <li> Glove box</li>
', '                       <li> Glass-lined cockpit liner</li>
                           <li> Cup drawer</li>
                           <li> Hatch in engine compartment</li>
                           <li>12V socket </li>
                           <li>Stereo Fusion Satellite AM / FM with iPod dock & 4 speakers </li>
                           <li> Faculty</li>
                           <li> Battery replacement kit</li>
                           <li> Battery case</li>
                           <li> Electrical system against heat / water</li>
                           <li> Engine compartment</li>
                           <li>Automatic boat bottom pump </li>
                           <li> Fire fighting set</li>
                           <li> The bottom of the boat and the engine compartment are covered with gelcoat</li>
                           <li> Ventilation system</li>
                           <li> Road with double fuel</li>
                           <li>Equipment with anti-fog system and lights </li>
                           <li>Electric steering system</li>
', '                           <li>Steering wheel, black with silver details</li>
                           <li>Buttons, heat and water resistant </li>
                           <li>Boat hull & deck </li>
                           <li>The eyes at the stern and nose are made of stainless steel</li>
                           <li> Stainless steel wire stem (6)</li>
                           <li> Paint the lines on the hull</li>
                           <li> Permanent warranty for the hull</li>
                           <li> LED driving light</li>
                           <li> NMMA certificate</li>
                           <li> Stainless steel ski tow</li>
                           <li> Anchor compartment under cushion on nose</li>
                           <li> Ladder into the water</li>
                           <li> The swim platform goes well with the hull</li>
                           <li> Sheath for transport</li>
                           <li> Windproof glass, Onyx</li>
                           <li> Sundeck with seats</li>
');

insert into desc_pro( id_pro, info, featured, advanced, additional) values (38, '
<p>
Equipped with many gadgets and technologies such as fiberglass steering wheel, luxurious metal-covered buttons, MP3-compatible, power steering. Comes with 2 interior packages, Fusion Satellite Ready AM / FM USB Stereo sound system with Bluetooth and 4 speakers, M22 is also equipped with a refrigerator. This is really a high speed canoe for your family
</p>
', '                        <li> Door, with stairs going right</li>
                           <li>Fridge </li>
                           <li>12V LED light </li>
                           <li>Glove box </li>
', '                       <li> Fiberglass liner cockpit</li>
                           <li> Handles for drinks</li>
                           <li> balcony</li>
                           <li> Stereo Fusion Satellite AM / FM with iPod dock & 4 speakers</li>
                           <li>Storage compartment </li>
                           <li> Battery case</li>
                           <li> Electrical system against heat / water</li>
                           <li>Automatic boat bottom pump </li>
                           <li> Fire fighting set</li>
                           <li>Ventilation system </li>
                           <li>The bottom of the boat and the engine compartment are covered with gelcoat </li>
                           <li>Road with double fuel </li>
                           <li> </li>
                           <li> </li>
                           <li> </li>
                           <li>Equipment with anti-fog system and lights </li>
                           <li>MP3 adapter </li>
', '                           <li>Socket, 12V</li>
                           <li>Steering wheel, black with silver details</li>
                           <li>Electric steering system</li>
                           <li>Rotation system</li>
                           <li>Buttons, heat and water resistant </li>
                           <li> Air Assist Chine</li>
                           <li> Cover layer, Vinylester</li>
                           <li>The eyes at the stern and nose are made of stainless steel </li>
                           <li>Stainless steel wire stem (6) </li>
                           <li>Paint the lines on the hull </li>
                           <li>Waste hole </li>
                           <li>Horn </li>
                           <li>Permanent warranty for the hull </li>
                           <li>LED driving light </li>
                           <li> NMMA certificate</li>
                           <li> Anchor compartment under cushion on nose</li>
');

insert into desc_pro( id_pro, info, featured, advanced, additional) values (39, '
<p>
Personality and sport are the best words to describe Monterey M4. The smallest model in the M Series, M4 still ahead of time. The standard wetbar is just the right size to prepare a drink, or a quick snack. M4 is equipped with a stainless steel water ladder. On the right is a small toilet. Padding at the bow of the boat can transform the chair into a spacious sun.

</p>
', '                        <li>Stability and function - a key feature of all M Series models</li>
                           <li> Maximum speed up to 95 km / h with the most powerful engine</li>
                           <li>The nose part may change </li>
                           <li> Wind vents in the middle</li>
', '                       <li> Desk in cockpit</li>
                           <li>Refrigerator, 48 Qt, manual </li>
                           <li>12V LED light </li>
                           <li> Glove box</li>
                           <li>Handles for drinks </li>
                           <li> Fiberglass liner cockpit</li>
                           <li>Stereo Fusion Satellite AM / FM with iPod dock & 4 speakers </li>
                           <li>Storage compartment </li>
                           <li> Shower at the stern</li>
                           <li> Wet bar with table, sink, storage compartment and garbage compartment</li>
                           <li>Battery replacement kit </li>
                           <li>Electrical system against heat / water </li>
                           <li>Engine compartment</li>
                           <li>Automatic boat bottom pump </li>
                           <li> The bottom of the boat and the engine compartment are covered with gelcoat</li>
                           <li>Fire fighting set </li>
                           <li>Ventilation system </li>
', '                           <li>Road with double fuel </li>
                           <li> Depth measurement system</li>
                           <li>Equipment with anti-fog system and lights </li>
                           <li>MP3 adapter </li>
                           <li>Socket, 12V </li>
                           <li> Steering wheel, black with silver details</li>
                           <li> Electric steering system</li>
                           <li> Buttons, heat and water resistan</li>
                           <li>Air Assist Chine </li>
                           <li> Cover layer, Vinylester</li>
                           <li>The eyes at the stern and nose are made of stainless steel </li>
                           <li> Stainless steel wire stem (6)</li>
                           <li> Paint the lines on the hull</li>
                           <li>Permanent warranty for the hull </li>
                           <li>Anchor compartment under cushion on nose </li>
');

insert into desc_pro( id_pro, info, featured, advanced, additional) values (40, '
<p>
Everything you need to enjoy a day of adventure, water skiing, windsurfing and tubing awaits you on the Monterey M6. The boat has spacious seats and storage, toilets, two ladders into the water at the bow and stern, and the Fusion and AM / FM stereo satellite sets;
Choose the wetbar and you will have all you need to enjoy a day on the water. With great graphics and boat and deck painting you will surely have one of the most outstanding boats.
M6 is stylish, classy and functional.
</p>
', '                        <li>Refrigerator, 48 Qt, manua </li>
                           <li>12V LED light </li>
                           <li>Fiberglass liner cockpit </li>
                           <li> Handles for drinks</li>
', '                       <li>Stereo Fusion Satellite AM / FM with iPod dock & 4 speakers </li>
                           <li> Shower at the stern</li>
                           <li>Storage compartment </li>
                           <li>Battery replacement kit </li>
                           <li> Electrical system against heat / water</li>
                           <li> Engine compartment</li>
                           <li> Automatic boat bottom pump</li>
                           <li> The bottom of the boat and the engine compartment are covered with gelcoat</li>
                           <li>Road with double fuel </li>
                           <li> Synthetic wooden floor</li>
                           <li> Toilet (Porta-Potti)</li>
                           <li>Depth measurement system </li>
                           <li> Equipment with anti-fog system and lights</li>
                           <li> MP3 adapter</li>
                           <li> Socket, 12V</li>
                           <li> Steering wheel, black with silver details</li>
                           <li> Electric steering system</li>
', '                           <li> Buttons, heat and water resistant</li>
                           <li>Boat hull & deck </li>
                           <li>Air Assist Chine </li>
                           <li>Cover layer, Vinylester </li>
                           <li> The eyes at the stern and nose are made of stainless steel</li>
                           <li> Stainless steel wire stem (6)</li>
                           <li> Paint the lines on the hull</li>
                           <li> Permanent warranty for the hull</li>
                           <li> Anchor compartment under cushion on nose</li>
                           <li>The swim platform goes well with the hull </li>
                           <li>Ladder into the water </li>
                           <li>Seat cushions with storage compartment</li>
                           <li> Seats with storage compartment</li>
                           <li> L-shaped seat and storage compartment</li>
                           <li> Seats with storage compartments</li>
');

insert into configuration( id_pro, model,length_overall, beam, draft_max,draft_min,bridge_clearance,deadrise,dry_weight,fuel_tanks,water_tanks,Production_materials,  Exterior_design,  Interior_Design,passenger_capacity,cabins,manufacturer)
values(21,'Monterey 217OB','6.60','2.50','0.86','0.53','2.26','19','1406','136','37.80','null','null','null',' 7 ','0',' Monterey Boats (USA)');

insert into configuration( id_pro, model,length_overall, beam, draft_max,draft_min,bridge_clearance,deadrise,dry_weight,fuel_tanks,water_tanks,Production_materials,  Exterior_design,  Interior_Design,passenger_capacity,cabins,manufacturer)
values(22,'Monterey 217OB',' 6.90',' 2.60','0.91',' 0.58','2.26','20','1406','136','37.80','null','null','null',' 7','0 ',' Monterey Boats (USA)');

insert into configuration( id_pro, model,length_overall, beam, draft_max,draft_min,bridge_clearance,deadrise,dry_weight,fuel_tanks,water_tanks,Production_materials,  Exterior_design,  Interior_Design,passenger_capacity,cabins,manufacturer)
values(23,'Monterey 217OB','6.60','2.55','0.89','0.59','2.00','19','0','136','37.80','null','null','null','7','0','Monterey Boats (USA)');

insert into configuration( id_pro, model,length_overall, beam, draft_max,draft_min,bridge_clearance,deadrise,dry_weight,fuel_tanks,water_tanks,Production_materials,  Exterior_design,  Interior_Design,passenger_capacity,cabins,manufacturer)
values(24,'Monterey 217OB','7.01','2.60','0.94','0.64','2.40','20','1.792','208.20','37.80','null','null','null','10','0','Monterey Boats (USA)');

insert into configuration( id_pro, model,length_overall, beam, draft_max,draft_min,bridge_clearance,deadrise,dry_weight,fuel_tanks,water_tanks,Production_materials,  Exterior_design,  Interior_Design,passenger_capacity,cabins,manufacturer)
values(25,'Monterey 217OB','7.01','2.90','1.74','0.64','2.40','20','1.792','208.20','37.80','null','null','null','7','1','Monterey Boats (USA)');

insert into configuration( id_pro, model,length_overall, beam, draft_max,draft_min,bridge_clearance,deadrise,dry_weight,fuel_tanks,water_tanks,Production_materials,  Exterior_design,  Interior_Design,passenger_capacity,cabins,manufacturer)
values(26,'Monterey 217OB','7.12','2.10','0.94','0.64','2.40','20','1.792','208.20','37.80','null','null','null','11','0','Monterey Boats (USA)');

insert into configuration( id_pro, model,length_overall, beam, draft_max,draft_min,bridge_clearance,deadrise,dry_weight,fuel_tanks,water_tanks,Production_materials,  Exterior_design,  Interior_Design,passenger_capacity,cabins,manufacturer)
values(27,'Monterey 217OB','7.46','2.23','0.94','0.64','2.40','18','1.792','208.20','37.80','null','null','null','7','0','Monterey Boats (USA)');

insert into configuration( id_pro, model,length_overall, beam, draft_max,draft_min,bridge_clearance,deadrise,dry_weight,fuel_tanks,water_tanks,Production_materials,  Exterior_design,  Interior_Design,passenger_capacity,cabins,manufacturer)
values(28,'Monterey 217OB','7.28','2.12','0.94','0.64','2.40','20','1.792','248.20','37.80','null','null','null','11','1','Monterey Boats (USA)');

insert into configuration( id_pro, model,length_overall, beam, draft_max,draft_min,bridge_clearance,deadrise,dry_weight,fuel_tanks,water_tanks,Production_materials,  Exterior_design,  Interior_Design,passenger_capacity,cabins,manufacturer)
values(29,'Monterey 217OB','7.98','2.21','0.94','0.64','2.40','18','1.792','208.20','37.80','null','null','null','7','0','Monterey Boats (USA)');

insert into configuration( id_pro, model,length_overall, beam, draft_max,draft_min,bridge_clearance,deadrise,dry_weight,fuel_tanks,water_tanks,Production_materials,  Exterior_design,  Interior_Design,passenger_capacity,cabins,manufacturer)
values(30,'Monterey 217OB','7.27','2.50','0.94','0.64','2.40','18','1.792','202.20','37.80','null','null','null','11','0','Monterey Boats (USA)');

insert into configuration( id_pro, model,length_overall, beam, draft_max,draft_min,bridge_clearance,deadrise,dry_weight,fuel_tanks,water_tanks,Production_materials,  Exterior_design,  Interior_Design,passenger_capacity,cabins,manufacturer)
values(31,'Monterey 217OB','7.72','3.51','0.94','0.64','2.40','18','1.792','208.20','37.80','null','null','null','5','1','Monterey Boats (USA)');

insert into configuration( id_pro, model,length_overall, beam, draft_max,draft_min,bridge_clearance,deadrise,dry_weight,fuel_tanks,water_tanks,Production_materials,  Exterior_design,  Interior_Design,passenger_capacity,cabins,manufacturer)
values(32,'Monterey 217OB','7.65','2.54','0.94','0.64','2.40','18','1.792','208.20','37.80','null','null','null','4','0','Monterey Boats (USA)');

insert into configuration( id_pro, model,length_overall, beam, draft_max,draft_min,bridge_clearance,deadrise,dry_weight,fuel_tanks,water_tanks,Production_materials,  Exterior_design,  Interior_Design,passenger_capacity,cabins,manufacturer)
values(33,'Monterey 217OB','7.10','2.56','0.94','0.64','2.40','20','1.792','208.20','37.80','null','null','null','7','0','Monterey Boats (USA)');

insert into configuration( id_pro, model,length_overall, beam, draft_max,draft_min,bridge_clearance,deadrise,dry_weight,fuel_tanks,water_tanks,Production_materials,  Exterior_design,  Interior_Design,passenger_capacity,cabins,manufacturer)
values(34,'Monterey 217OB','7.95','2.59','0.94','0.64','2.40','19','1.792','208.20','37.80','null','null','null','8','1','Monterey Boats (USA)');

insert into configuration( id_pro, model,length_overall, beam, draft_max,draft_min,bridge_clearance,deadrise,dry_weight,fuel_tanks,water_tanks,Production_materials,  Exterior_design,  Interior_Design,passenger_capacity,cabins,manufacturer)
values(35,'Monterey 217OB','7.02','2.20','0.94','0.64','2.40','20','2.392','318.20','37.80','null','null','null','7','0','Monterey Boats (USA)');

insert into configuration( id_pro, model,length_overall, beam, draft_max,draft_min,bridge_clearance,deadrise,dry_weight,fuel_tanks,water_tanks,Production_materials,  Exterior_design,  Interior_Design,passenger_capacity,cabins,manufacturer)
values(36,'Monterey 217OB','7.14','2.10','0.94','0.64','2.40','20','1.792','208.20','37.80','null','null','null','9','1','Monterey Boats (USA)');

insert into configuration( id_pro, model,length_overall, beam, draft_max,draft_min,bridge_clearance,deadrise,dry_weight,fuel_tanks,water_tanks,Production_materials,  Exterior_design,  Interior_Design,passenger_capacity,cabins,manufacturer)
values(37,'Monterey 217OB','7.12','2.30','0.94','0.64','2.40','19','1.792','208.20','37.80','null','null','null','13','0','Monterey Boats (USA)');

insert into configuration( id_pro, model,length_overall, beam, draft_max,draft_min,bridge_clearance,deadrise,dry_weight,fuel_tanks,water_tanks,Production_materials,  Exterior_design,  Interior_Design,passenger_capacity,cabins,manufacturer)
values(38,'Monterey 217OB','7.98','3.55','0.91','0.64','2.78','20','2.789','190.20','35.90','null','null','null','7','2','Monterey Boats (USA)');

insert into configuration( id_pro, model,length_overall, beam, draft_max,draft_min,bridge_clearance,deadrise,dry_weight,fuel_tanks,water_tanks,Production_materials,  Exterior_design,  Interior_Design,passenger_capacity,cabins,manufacturer)
values(39,'Monterey 217OB','5.01','2.20','0.94','0.64','2.40','18','1.792','208.20','37.80','null','null','null','12','1','Monterey Boats (USA)');

insert into configuration( id_pro, model,length_overall, beam, draft_max,draft_min,bridge_clearance,deadrise,dry_weight,fuel_tanks,water_tanks,Production_materials,  Exterior_design,  Interior_Design,passenger_capacity,cabins,manufacturer)
values(40,'Monterey 217OB','6.01','2.37','0.78','0.87','2.35','19','2.892','223.20','35.80','null','null','null','9','1','Monterey Boats (USA)');


insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('sessa_c351.jpg','Sessa C35',5000,30,1,'2017','Fishing');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('sessa_fly16.jpg','Sessa FLY 42',2900,30,1,'2017','Fishing');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('fly_4723.jpg','Sessa FLY 47',3400,30,1,'2017','Fishing');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('super_airn1.jpg','Super Air Nautique 210',4500,30,1,'2017','Fishing');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('nautique_G211.jpg','Super Air Nautique G21',23000,30,1,'2017','Fishing');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('nautique_g231.jpg','Super Air Nautique G23',14000,30,1,'2017','Fishing');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('nautique_g2301.jpg','Super Air Nautique G230',23000,30,1,'2017','Fishing');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('nautique_g251.jpg','Super Air Nautique G25',9800,30,1,'2017','Fishing');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('nautique_g2001.jpg','Sport Nautique 200',12000,30,1,'2016','Fishing');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('nautique_ski1.jpg','Ski Nautique 200 - Open Bow',9000,30,1,'2017','Fishing');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('nautique_ski21.jpg','Ski Nautique 200 - Closed Bow',15000,30,1,'2017','Fishing');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('Touring361.jpg','Touring 36',13000,30,1,'2017','Fishing');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('Touring401.jpg','ten',8000,30,1,'2016','Fishing');
insert into product(photo, name_pro, price_pro, quantity_pro, status_pro, year_pro, code) values('waveshuttlevip1.jpg','Waveshuttle 56 version VIP',50000,30,1,'2016','Travel');
insert into photos(id_pro, img) values ( 41, 'sessa_c351.jpg');
insert into photos(id_pro, img) values ( 41, 'sessa_c352.jpg');
insert into photos(id_pro, img) values ( 41, 'sessa_c353.jpg');
insert into photos(id_pro, img) values ( 41, 'sessa_c354.jpg');
insert into photos(id_pro, img) values ( 41, 'sessa_c355.jpg');
insert into photos(id_pro, img) values ( 41, 'sessa_c356.jpg');
insert into photos(id_pro, img) values ( 41, 'sessa_c357.jpg');
insert into photos(id_pro, img) values ( 41, 'sessa_c358.jpg');
insert into photos(id_pro, img) values ( 41, 'sessa_c359.jpg');
insert into photos(id_pro, img) values ( 41, 'sessa_c3510.jpg');
insert into photos(id_pro, img) values ( 41, 'sessa_c3511.jpg');
insert into photos(id_pro, img) values ( 41, 'sessa_c3512.jpg');
insert into photos(id_pro, img) values ( 41, 'sessa_c3513.jpg');
insert into photos(id_pro, img) values ( 41, 'sessa_c3514.jpg');
insert into photos(id_pro, img) values ( 41, 'sessa_c3515.jpg');

insert into photos(id_pro, img) values ( 42, 'sessa_fly16.jpg');
insert into photos(id_pro, img) values ( 42, 'sessa_fly17.jpg');
insert into photos(id_pro, img) values ( 42, 'sessa_fly18.jpg');
insert into photos(id_pro, img) values ( 42, 'sessa_fly19.jpg');
insert into photos(id_pro, img) values ( 42, 'sessa_fly20.jpg');
insert into photos(id_pro, img) values ( 42, 'sessa_fly21.jpg');
insert into photos(id_pro, img) values ( 42, 'sessa_fly22.jpg');

insert into photos(id_pro, img) values ( 43, 'fly_4723.jpg');
insert into photos(id_pro, img) values ( 43, 'fly_4724.jpg');
insert into photos(id_pro, img) values ( 43, 'fly_4725.jpg');
insert into photos(id_pro, img) values ( 43, 'fly_4726.jpg');
insert into photos(id_pro, img) values ( 43, 'fly_4727.jpg');
insert into photos(id_pro, img) values ( 43, 'fly_4728.jpg');
insert into photos(id_pro, img) values ( 43, 'fly_4729.jpg');
insert into photos(id_pro, img) values ( 43, 'fly_4730.jpg');
insert into photos(id_pro, img) values ( 43, 'fly_4731.jpg');
insert into photos(id_pro, img) values ( 43, 'fly_4732.jpg');
insert into photos(id_pro, img) values ( 43, 'fly_4733.jpg');

insert into photos(id_pro, img) values ( 44, 'super_airn1.jpg');
insert into photos(id_pro, img) values ( 44, 'super_airn2.jpg');
insert into photos(id_pro, img) values ( 44, 'super_airn3.jpg');
insert into photos(id_pro, img) values ( 44, 'super_airn4.jpg');
insert into photos(id_pro, img) values ( 44, 'super_airn5.jpg');
insert into photos(id_pro, img) values ( 44, 'super_airn6.jpg');
insert into photos(id_pro, img) values ( 44, 'super_airn7.jpg');
insert into photos(id_pro, img) values ( 44, 'super_airn8.jpg');
insert into photos(id_pro, img) values ( 44, 'super_airn9.jpg');
insert into photos(id_pro, img) values ( 44, 'super_airn10.jpg');
insert into photos(id_pro, img) values ( 44, 'super_airn11.jpg');
insert into photos(id_pro, img) values ( 44, 'super_airn12.jpg');
insert into photos(id_pro, img) values ( 44, 'super_airn13.jpg');
insert into photos(id_pro, img) values ( 44, 'super_airn14.jpg');
insert into photos(id_pro, img) values ( 44, 'super_airn15.jpg');
insert into photos(id_pro, img) values ( 44, 'super_airn16.jpg');


insert into photos(id_pro, img) values ( 45, 'nautique_G211.jpg');
insert into photos(id_pro, img) values ( 45, 'nautique_G212.jpg');
insert into photos(id_pro, img) values ( 45, 'nautique_G213.jpg');
insert into photos(id_pro, img) values ( 45, 'nautique_G214.jpg');
insert into photos(id_pro, img) values ( 45, 'nautique_G215.jpg');
insert into photos(id_pro, img) values ( 45, 'nautique_G216.jpg');
insert into photos(id_pro, img) values ( 45, 'nautique_G217.jpg');
insert into photos(id_pro, img) values ( 45, 'nautique_G218.jpg');
insert into photos(id_pro, img) values ( 45, 'nautique_G219.jpg');
insert into photos(id_pro, img) values ( 45, 'nautique_G2110.jpg');
insert into photos(id_pro, img) values ( 45, 'nautique_G2111.jpg');
insert into photos(id_pro, img) values ( 45, 'nautique_G2112.jpg');
insert into photos(id_pro, img) values ( 45, 'nautique_G2113.jpg');
insert into photos(id_pro, img) values ( 45, 'nautique_G2114.jpg');
insert into photos(id_pro, img) values ( 45, 'nautique_G2115.jpg');

insert into photos(id_pro, img) values ( 46, 'nautique_g231.jpg');
insert into photos(id_pro, img) values ( 46, 'nautique_g232.jpg');
insert into photos(id_pro, img) values ( 46, 'nautique_g233.jpg');
insert into photos(id_pro, img) values ( 46, 'nautique_g234.jpg');
insert into photos(id_pro, img) values ( 46, 'nautique_g235.jpg');
insert into photos(id_pro, img) values ( 46, 'nautique_g236.jpg');
insert into photos(id_pro, img) values ( 46, 'nautique_g237.jpg');
insert into photos(id_pro, img) values ( 46, 'nautique_g238.jpg');
insert into photos(id_pro, img) values ( 46, 'nautique_g239.jpg');
insert into photos(id_pro, img) values ( 46, 'nautique_G2310.jpg');
insert into photos(id_pro, img) values ( 46, 'nautique_G2311.jpg');
insert into photos(id_pro, img) values ( 46, 'nautique_G2312.jpg');
insert into photos(id_pro, img) values ( 46, 'nautique_G2313.jpg');
insert into photos(id_pro, img) values ( 46, 'nautique_G2314.jpg');
insert into photos(id_pro, img) values ( 46, 'nautique_G2315.jpg');

insert into photos(id_pro, img) values ( 47, 'nautique_g2301.jpg');
insert into photos(id_pro, img) values ( 47, 'nautique_g2302.jpg');
insert into photos(id_pro, img) values ( 47, 'nautique_g2303.jpg');
insert into photos(id_pro, img) values ( 47, 'nautique_g2304.jpg');
insert into photos(id_pro, img) values ( 47, 'nautique_g2305.jpg');
insert into photos(id_pro, img) values ( 47, 'nautique_g2306.jpg');
insert into photos(id_pro, img) values ( 47, 'nautique_g2307.jpg');
insert into photos(id_pro, img) values ( 47, 'nautique_g2308.jpg');
insert into photos(id_pro, img) values ( 47, 'nautique_g2309.jpg');
insert into photos(id_pro, img) values ( 47, 'nautique_G23010.jpg');
insert into photos(id_pro, img) values ( 47, 'nautique_G23011.jpg');
insert into photos(id_pro, img) values ( 47, 'nautique_G23012.jpg');
insert into photos(id_pro, img) values ( 47, 'nautique_G23013.jpg');
insert into photos(id_pro, img) values ( 47, 'nautique_G23014.jpg');
insert into photos(id_pro, img) values ( 47, 'nautique_G23015.jpg');

insert into photos(id_pro, img) values ( 48, 'nautique_G251.jpg');
insert into photos(id_pro, img) values ( 48, 'nautique_G252.jpg');
insert into photos(id_pro, img) values ( 48, 'nautique_G253.jpg');
insert into photos(id_pro, img) values ( 48, 'nautique_G254.jpg');
insert into photos(id_pro, img) values ( 48, 'nautique_G255.jpg');
insert into photos(id_pro, img) values ( 48, 'nautique_G256.jpg');
insert into photos(id_pro, img) values ( 48, 'nautique_G257.jpg');

insert into photos(id_pro, img) values ( 49, 'nautique_g2001.jpg');
insert into photos(id_pro, img) values ( 49, 'nautique_g2002.jpg');
insert into photos(id_pro, img) values ( 49, 'nautique_g2003.jpg');
insert into photos(id_pro, img) values ( 49, 'nautique_g2004.jpg');
insert into photos(id_pro, img) values ( 49, 'nautique_g2005.jpg');
insert into photos(id_pro, img) values ( 49, 'nautique_g2006.jpg');
insert into photos(id_pro, img) values ( 49, 'nautique_g2007.jpg');
insert into photos(id_pro, img) values ( 49, 'nautique_g2008.jpg');
insert into photos(id_pro, img) values ( 49, 'nautique_g2009.jpg');
insert into photos(id_pro, img) values ( 49, 'nautique_G20010.jpg');
insert into photos(id_pro, img) values ( 49, 'nautique_G20011.jpg');
insert into photos(id_pro, img) values ( 49, 'nautique_G20012.jpg');
insert into photos(id_pro, img) values ( 49, 'nautique_G20013.jpg');
insert into photos(id_pro, img) values ( 49, 'nautique_G20014.jpg');

insert into photos(id_pro, img) values ( 50, 'nautique_ski1.jpg');
insert into photos(id_pro, img) values ( 50, 'nautique_ski2.jpg');
insert into photos(id_pro, img) values ( 50, 'nautique_ski3.jpg');
insert into photos(id_pro, img) values ( 50, 'nautique_ski4.jpg');
insert into photos(id_pro, img) values ( 50, 'nautique_ski5.jpg');
insert into photos(id_pro, img) values ( 50, 'nautique_ski6.jpg');
insert into photos(id_pro, img) values ( 50, 'nautique_ski7.jpg');
insert into photos(id_pro, img) values ( 50, 'nautique_ski8.jpg');
insert into photos(id_pro, img) values ( 50, 'nautique_ski9.jpg');
insert into photos(id_pro, img) values ( 50, 'nautique_ski10.jpg');

insert into photos(id_pro, img) values ( 51, 'nautique_ski21.jpg');
insert into photos(id_pro, img) values ( 51, 'nautique_ski22.jpg');
insert into photos(id_pro, img) values ( 51, 'nautique_ski23.jpg');
insert into photos(id_pro, img) values ( 51, 'nautique_ski24.jpg');
insert into photos(id_pro, img) values ( 51, 'nautique_ski25.jpg');
insert into photos(id_pro, img) values ( 51, 'nautique_ski26.jpg');
insert into photos(id_pro, img) values ( 51, 'nautique_ski27.jpg');
insert into photos(id_pro, img) values ( 51, 'nautique_ski28.jpg');
insert into photos(id_pro, img) values ( 51, 'nautique_ski29.jpg');
insert into photos(id_pro, img) values ( 51, 'nautique_ski210.jpg');
insert into photos(id_pro, img) values ( 51, 'nautique_ski211.jpg');
insert into photos(id_pro, img) values ( 51, 'nautique_ski212.jpg');
insert into photos(id_pro, img) values ( 51, 'nautique_ski213.jpg');
insert into photos(id_pro, img) values ( 51, 'nautique_ski214.jpg');
insert into photos(id_pro, img) values ( 51, 'nautique_ski215.jpg');

insert into photos(id_pro, img) values ( 52, 'Touring361.jpg');
insert into photos(id_pro, img) values ( 52, 'Touring362.jpg');
insert into photos(id_pro, img) values ( 52, 'Touring363.jpg');
insert into photos(id_pro, img) values ( 52, 'Touring364.jpg');
insert into photos(id_pro, img) values ( 52, 'Touring365.jpg');
insert into photos(id_pro, img) values ( 52, 'Touring366.jpg');
insert into photos(id_pro, img) values ( 52, 'Touring367.jpg');
insert into photos(id_pro, img) values ( 52, 'Touring368.jpg');
insert into photos(id_pro, img) values ( 52, 'Touring369.jpg');
insert into photos(id_pro, img) values ( 52, 'Touring3610.jpg');
insert into photos(id_pro, img) values ( 52, 'Touring3611.jpg');
insert into photos(id_pro, img) values ( 52, 'Touring3612.jpg');
insert into photos(id_pro, img) values ( 52, 'Touring3613.jpg');
insert into photos(id_pro, img) values ( 52, 'Touring3614.jpg');
insert into photos(id_pro, img) values ( 52, 'Touring3615.jpg');

insert into photos(id_pro, img) values ( 53, 'Touring401.jpg');
insert into photos(id_pro, img) values ( 53, 'Touring402.jpg');
insert into photos(id_pro, img) values ( 53, 'Touring403.jpg');
insert into photos(id_pro, img) values ( 53, 'Touring404.jpg');
insert into photos(id_pro, img) values ( 53, 'Touring405.jpg');
insert into photos(id_pro, img) values ( 53, 'Touring406.jpg');
insert into photos(id_pro, img) values ( 53, 'Touring407.jpg');
insert into photos(id_pro, img) values ( 53, 'Touring408.jpg');
insert into photos(id_pro, img) values ( 53, 'Touring409.jpg');
insert into photos(id_pro, img) values ( 53, 'Touring4010.jpg');
insert into photos(id_pro, img) values ( 53, 'Touring4011.jpg');
insert into photos(id_pro, img) values ( 53, 'Touring4012.jpg');
insert into photos(id_pro, img) values ( 53, 'Touring4013.jpg');
insert into photos(id_pro, img) values ( 53, 'Touring4014.jpg');
insert into photos(id_pro, img) values ( 53, 'Touring4015.jpg');



insert into photos(id_pro, img) values ( 54, 'waveshuttlevip1.jpg');
insert into photos(id_pro, img) values ( 54, 'waveshuttlevip2.jpg');
insert into photos(id_pro, img) values ( 54, 'waveshuttlevip3.jpg');
insert into photos(id_pro, img) values ( 54, 'waveshuttlevip4.jpg');
insert into photos(id_pro, img) values ( 54, 'waveshuttlevip5.jpg');
insert into photos(id_pro, img) values ( 54, 'waveshuttlevip6.jpg');
insert into photos(id_pro, img) values ( 54, 'waveshuttlevip7.jpg');
insert into photos(id_pro, img) values ( 54, 'waveshuttlevip8.jpg');
insert into photos(id_pro, img) values ( 54, 'waveshuttlevip9.jpg');
insert into photos(id_pro, img) values ( 54, 'waveshuttlevip10.jpg');
insert into photos(id_pro, img) values ( 54, 'waveshuttlevip11.jpg');
insert into photos(id_pro, img) values ( 54, 'waveshuttlevip12.jpg');
insert into desc_pro( id_pro, info, featured, advanced, additional) values (41, '                       <p>TOne of the most successful models of Sessa Marine shipyard with over 500 units sold in 15 years. Model C35 sport-coupe inspired by the design and style of C68. Interior layout brings absolute freedom to the owner.
		</p>
		', '                           (null)

		', '                       <li>Provided on demand</li>

		', '                           (null)
		');
insert into configuration( id_pro, model, length_overall, beam, draft_max, draft_min, bridge_clearance, deadrise, dry_weight, fuel_tanks, water_tanks, Production_materials, Exterior_design, Interior_Design, passenger_capacity, cabins, manufacturer) values (41,' Sessa C35','11.33  m','3.45 m',null,null,'Max.640hp/ 470kW',null,null,'460 l','286 l',null,'Christian Grande',5,12,12,'Sessa Marine (Italy)');
insert into desc_pro( id_pro, info, featured, advanced, additional) values (42, '                       <p>Not just a means of transportation, Sessa FLY 42 is also a means to enjoy the atmosphere and feeling of freedom at sea. So, with more than 50 years of experience, Sessa has created a yacht as a small bar on the sea, where you can relax, immerse yourself in nature but still be provided with amenities. really.
		', '                           <li>Bmini on the flybridge</li>
		                           <li>Engine equipped with IPS</li>
		                           <li>Owner''s cabin at the bow of the boat</li>

		', '                           <li>Provided on demand</li>

		', '                          (null)
		');
insert into configuration( id_pro, model, length_overall, beam, draft_max, draft_min, bridge_clearance, deadrise, dry_weight, fuel_tanks, water_tanks, Production_materials, Exterior_design, Interior_Design, passenger_capacity, cabins, manufacturer) values (42,'Sessa FLY 42','13.1  m','3.9 m',' 0.82 m',null,'VOLVO PENTA 2 ',null,'10.7 t',' 2 x 490 l','350 l','VTR/ GRP','Christian Grande',2,5,2,'Sessa Marine');
insert into desc_pro( id_pro, info, featured, advanced, additional) values (43, '                       <p>Sessa Fly 47 is a turning point for Sessa in the yacht market. Extending the concept of the Flybride Sport yacht, Sessa created a Universal Yacht for the FLY 47. A design for those who want to sail to the fullest with what they need. A perfect balance between interior and exterior space, bold and personality, performance and technology and create a 47-foot yacht with 3 spacious cabins (about 17m2), and a bathroom with a bath Separate stand, spacious kitchen area and especially the FLYBRIDGE deck can accommodate 8 - 10 people (16.5 m2).
		</p>
		', '                           <li>Planning hull</li>
		                           <li>The engine is equipped with an IPS system</li>
		                           <li>16.5m2 of flybridge area</li>

		', '                            <li>Provided on demand</li>

		', '                       (null)
		');
insert into configuration(ID_PRO, MODEL, LENGTH_OVERALL, BEAM, DRAFT_MAX, DRAFT_MIN, BRIDGE_CLEARANCE, DEADRISE, DRY_WEIGHT, FUEL_TANKS, WATER_TANKS, PRODUCTION_MATERIALS, EXTERIOR_DESIGN, INTERIOR_DESIGN, PASSENGER_CAPACITY, CABINS, MANUFACTURER)  values (43,'Sessa FLY 47',' 14.27  m',' 4.39 m','1,1 m','null','MAX. 870 HP/ 640 KW','null','null','2 x 636 l','560 l','VTR/GRP','Christian Grande',6,12,3,' Sessa Marine');
insert into desc_pro( id_pro, info, featured, advanced, additional) values (44, '                       <p>Super Air Nautique 210 has set a new standard for canoes that make waves since its inception. The diverse wave mode and especially the diamond-shaped mechanism will bring the maximum excitement every time you surf on Super Air Nautique 210.
		</p>
		', '                           <li>Nautique Surf System (NSS)</li>
		                           <li>Surf Select remote control, available in Pebble watch version</li>
		                           <li>Coastal Editionc is corrosion resistant</li>
		                           <li>MSound system from JL Audio</li>
		', '                           <li>Nautique LINC 2.0 Digital Helm System with Speed Control</li>
		                           <li>Nautique Surf System ™ with WAVEPLATE </li>
		                           <li>Wake Package (Ballast System 1300 LBS)</li>
		                           <li>Tower with rotating rack for Wakeboard / Wakesurf</li>
		                           <li>Stereo - MX Series (PA-4A Stereo, 4 JL speakers) </li>
		                           <li>Hydro-Gate® with SportShift ™ </li>
		                           <li>Exhaust pipe </li>
		                           <li>Dripless Shaft Packing</li>
		                           <li>Terminals (4)</li>
		                           <li>Led light</li>
		                           <li>Refrigerator (removable)</li>
		                           <li>Compartment for garbage </li>
		                           <li>Backrest removable (right)</li>
		', '                          (null)
		');
insert into configuration( id_pro, model, length_overall, beam, draft_max, draft_min, bridge_clearance, deadrise, dry_weight, fuel_tanks, water_tanks, Production_materials, Exterior_design, Interior_Design, passenger_capacity, cabins, manufacturer) values(44,'Super Air Nautique 210','7.10  m','2.49 m',' 0.71 m','null','null','null','1.905 t','140.10 l','null','GRP','null','null',12,'null',' Nautique (USA)');
insert into desc_pro( id_pro, info, featured, advanced, additional) values (45, '                       <p>The G-Series begins with the Super Air Nautique G21. Improved with new technology since 2016, the G21 offers unmatched versatility, making this boat unrivaled and winning numerous awards. The ability to customize at your fingertips both inside and behind the boat gives you total control to shape a perfect wakeboard or wakesurf wave.
		</p>
		', '                           <li>Nautique Surf System (NSS)</li>
		                           <li>Surf Select remote control, available in Pebble watch version</li>
		                           <li>Hull with NCRS wave change system</li>
		                           <li>LINC multi-function touch screen</li>
		', '                    <li>Nautique Configurable Running Surface with Hydro-Plate</li>
		                           <li>Nautique LINC PANORAY with control unit</li>
		                           <li>Wake Package (System 2850 Pound Ballast)</li>
		                           <li>Nautique Surf System ™ with WAVEPLATE</li>
		                           <li>Flight Control tower with rotating frame for Wakeboard / Wakesurf </li>
		                           <li>Stereo - M Series Elite (PA-4A Stereo, 6 JL speakers, 1 JL 10 "Subwoofer and 1 JL 8 amplifier </li>
		                           <li>Zero Off GPS system</li>
		                           <li>Lamp </li>
		                           <li>Exhaust pipe </li>
		                           <li>Dripless Shaft Packing</li>
		                           <li>Terminals (4) </li>
		                           <li>Led light </li>
		                           <li>Refrigerator (Removable) </li>
		                           <li>Compartment for garbage </li>
		                           <li>Lounge chair on the left </li>
		                           <li>Camera</li>
		', '                      (null)
		');
insert into configuration( id_pro, model, length_overall, beam, draft_max, draft_min, bridge_clearance, deadrise, dry_weight, fuel_tanks, water_tanks, Production_materials, Exterior_design, Interior_Design, passenger_capacity, cabins, manufacturer) values (45,'Super Air Nautique G21','7.24  m',' 2.59 m','0.64 m','null','null','null',' 2.517 t',' 176 l','null',' GRP','null','null',14,'null',' Nautique (USA)');
insert into desc_pro( id_pro, info, featured, advanced, additional) values (46, '                       <p>The top model of G21 in the segment. Super Air Nautique G23 still brings all the outstanding features of the G series and moreover, combined with a completely new design that gives the boat a sporty, healthy appearance.
		</p>
		', '                           <li>Nautique Surf System (NSS)</li>
		                           <li>Surf Select remote control, available in Pebble watch version</li>
		                           <li>Hull with NCRS wave change system</li>
		                           <li>LINC multi-function touch screen </li>
		', '                          <li>Nautique Configurable Running Surface with Hydro-Plate</li>
		                           <li>Nautique LINC PANORAY with control unit</li>
		                           <li>Wake Package (System 2850 Pound Ballast)</li>
		                           <li>Nautique Surf System ™ with WAVEPLATE</li>
		                           <li>Flight Control tower with rotating frame for Wakeboard / Wakesurf </li>
		                           <li>Stereo - M Series Elite (PA-4A Stereo, 6 JL speakers, 1 JL 10 "Subwoofer and 1 JL 8 amplifier </li>
		                           <li>Zero Off GPS system</li>
		                           <li>Lamp </li>
		                           <li>Exhaust pipe </li>
		                           <li>Dripless Shaft Packing</li>
		                           <li>Terminals (4) </li>
		                           <li>Led light </li>
		                           <li>Refrigerator (Removable) </li>
		                           <li>Compartment for garbage </li>
		                           <li>"Lounge chair on the left </li>
		                           <li>Camera</li>
		', '                         (null)
		');
insert into configuration( id_pro, model, length_overall, beam, draft_max, draft_min, bridge_clearance, deadrise, dry_weight, fuel_tanks, water_tanks, Production_materials, Exterior_design, Interior_Design, passenger_capacity, cabins, manufacturer) values (46,'Super Air Nautique G23','7.70  m',' 2.59 m',' 0.64 m','null','null','null',' 2.676 t','246.10 l','null',' GRP','null','null',16,'null',' Nautique (USA)');
insert into desc_pro( id_pro, info, featured, advanced, additional) values (47, '                       <p>Super Air Nautique 230 equips you with everything you need from a surf boat. More than 10 years since its inception, Super Air Nautique 230 has always been a product mentioned by experts.
		</p>
		', '                           <li>Nautique Surf System (NSS)</li>
		                           <li>Surf Select remote control, available in Pebble watch version</li>
		                           <li>Coastal Editionc is corrosion resistant</li>
		                           <li>Sound system from JL Audio</li>
		', '                           <li>Nautique LINC 2.0 Digital Helm System with Speed Control </li>
		                           <li>Nautique Surf System ™ with WAVEPLATE </li>
		                           <li>Wake Package (Ballast System 1300 LBS)</li>
		                           <li>Tower with rotating rack for Wakeboard / Wakesurf</li>
		                           <li>Stereo - MX Series (PA-4A Stereo, 4 JL speakers) </li>
		                           <li>Hydro-Gate® with SportShift ™</li>
		                           <li>Exhaust pipe</li>
		                           <li>Dripless Shaft Packing</li>
		                           <li>Terminals (4) </li>
		                           <li>Led light</li>
		                           <li>Refrigerator (removable)</li>
		                           <li>Compartment for garbage </li>
		                           <li>Backrest removable (right) </li>

		', '                        (null)
		');
insert into configuration( id_pro, model, length_overall, beam, draft_max, draft_min, bridge_clearance, deadrise, dry_weight, fuel_tanks, water_tanks, Production_materials, Exterior_design, Interior_Design, passenger_capacity, cabins, manufacturer) values (47,'Super Air Nautique 230',' 7.73  m',' 2.55 m',' 0.74 m','null','null','null',' 2.109 t',' 177.90 l','null',' GRP','null','null',15,'null',' Nautique (USA)');
insert into desc_pro( id_pro, info, featured, advanced, additional) values (48, '                       <p>Super Air Nautique G25 is the most advanced surfing boat in the world to date. Completely new design, new style and new technology. All create a real super food in the world of surfing sports boats.
		</p>
		', '                            <li>Nautique Surf System (NSS)</li>
		                           <li>Surf Select remote control, available in Pebble watch version</li>
		                           <li>Coastal Editionc is corrosion</li>
		                           <li>LINC multi-function touch screen</li>
		<li>Plenty of space</li>
		', '                            <li>Nautique Configurable Running Surface with Hydro-Plate</li>
		                           <li>Nautique LINC PANORAY with control unit</li>
		                           <li>Wake Package (System 2850 Pound Ballast)</li>
		                           <li>Nautique Surf System ™ with WAVEPLATE</li>
		                           <li>Flight Control tower with rotating frame for Wakeboard / Wakesurf </li>
		                           <li>Stereo - M Series Elite (PA-4A Stereo, 6 JL speakers, 1 JL 10 "Subwoofer and 1 JL 8 amplifier </li>
		                           <li>Zero Off GPS system</li>
		                           <li>Lamp </li>
		                           <li>Exhaust pipe </li>
		                           <li>Dripless Shaft Packing</li>
		                           <li>Terminals (4) </li>
		                           <li>Led light </li>
		                           <li>Refrigerator (Removable) </li>
		                           <li>Compartment for garbage </li>
		                           <li>"Lounge chair on the left </li>
		                           <li>Camera</li>
		', '                        (null)
		');
insert into configuration( id_pro, model, length_overall, beam, draft_max, draft_min, bridge_clearance, deadrise, dry_weight, fuel_tanks, water_tanks, Production_materials, Exterior_design, Interior_Design, passenger_capacity, cabins, manufacturer) values (48,'Super Air Nautique G25',' 8.31  m','2.59 m',' 0.64 m',null,null,null,'  2.903 t',' 314.20 l','null','GRP','null','null',19,'null','Nautique (USA)');
insert into desc_pro( id_pro, info, featured, advanced, additional) values (49, '                       <p>During non-working breaks, Nautique''s engineers are surfing and skateboarding enthusiasts, with the desire to share their passion for water sports with others. Sport Nautique 200 is an appealing blend of their experience, professionalism and passion. Sport Nautique 200 rather than boat. It is designed to make every minute on the surface of the water special, with absolute sports performance. From wakeboarding and wakesurfing, to hardcore three-event skiing, shine bright and share your passion with everyone in this special boat.
		</p>
		', '                           <li>736 pound ballast: creates a wave immediately after touching the button</li>
		                           <li>Sound system from JL Audio</li>
		                           <li>PCM engine EX3 or ZR4</li>

		', '                          <li>Nautique LINC 2.0 Digital Helm System with Speed Control </li>
		                           <li>Nautique Surf System ™ with WAVEPLATE </li>
		                           <li>Wake Package (Ballast System 1300 LBS)</li>
		                           <li>Tower with rotating rack for Wakeboard / Wakesurf</li>
		                           <li>Stereo - MX Series (PA-4A Stereo, 4 JL speakers) </li>
		                           <li>Hydro-Gate® with SportShift ™</li>
		                           <li>Exhaust pipe</li>
		                           <li>Dripless Shaft Packing</li>
		                           <li>Terminals (4) </li>
		                           <li>Led light</li>
		                           <li>Refrigerator (removable)</li>
		                           <li>Compartment for garbage </li>
		                           <li>Backrest removable (right) </li>
		', '                      (null)
		');
insert into configuration( id_pro, model, length_overall, beam, draft_max, draft_min, bridge_clearance, deadrise, dry_weight, fuel_tanks, water_tanks, Production_materials, Exterior_design, Interior_Design, passenger_capacity, cabins, manufacturer) values (49,'Sport Nautique 200',' 6.65  m',' 2.41 m',' 0.60 m','null','null','null','1.474 t',' 106 l','null','GRP','null','null',10,'null',' Nautique (USA)');
insert into desc_pro( id_pro, info, featured, advanced, additional) values (50, '                       <p>In every country where the Ski Nautique 200 - Open Bow is available, this canoe is always appreciated by surf experts and in particular by water sports lovers in general. The perfect waveform and spacious interior, the Ski Nautique 200 - Open Bow will always be the perfect choice for water sports.
		</p>
		', '                           <li>N / A ballast</li>
		                           <li>19 world records</li>
		                           <li>Sound system from JL Audio</li>
		                           <li>New engines H5 and H6 DI from PCM and GM Marine Engine Technology </li>
		                            <li>Three-event performance</li>
		', '                           <li>Keyless entry system</li>
		                           <li>Measuring machine </li>
		                           <li>Nautique Digital Cruise with depth gauge </li>
		                           <li>Propeller Tournament</li>
		                           <li>Hydro-Gate® w / SportShift ™</li>
		                           <li>Hydro-Gate® w / SportShift ™ </li>
		                           <li>Cushion at the bow of the boat </li>
		                           <li>Dripless Shaft Packing</li>

		', '                        (null)
		');
insert into  configuration( id_pro, model, length_overall, beam, draft_max, draft_min, bridge_clearance, deadrise, dry_weight, fuel_tanks, water_tanks, Production_materials, Exterior_design, Interior_Design, passenger_capacity, cabins, manufacturer) values (50,'Ski Nautique 200 - Open Bow','6.65  m','2.41 m','0.56 m','null','null','null',' 1.293 t',' 102.10 l','null','GRP','null','null',9,'null',' Nautique (USA)');
insert into desc_pro( id_pro, info, featured, advanced, additional) values (51, '                       <p>Originating from the legendary Nautique, the Ski Nautique 200 - Closed Bow (closed nose) has a worldwide reputation for being a great ski boat. This boat''s 19 world records prove that this is the perfect choice. A leader in water skiing, the Ski Nautique 200 participates in the most prestigious events in the world including Masters Waterski Tournament, the Moomba Masters and Nautique U.S. Open of Waterskiing and always win the prestigious award.
		</p>
		', '                           <li>N/A ballast</li>
		                           <li>Great functionality proved by many awards</li>
		                           <li>JL Audio stereo system</li>
		                           <li>H5 and H6 DI engines from PCM and GM Marine Engine Technology </li>
		                        <li>Three-event performance</li>
		', '                           <li>Keyless entry system </li>
		                           <li>Measuring machine </li>
		                           <li>Nautique Digital Cruise with depth gauge </li>
		                           <li>Propeller Tournament</li>
		                           <li>Hydro-Gate® w / SportShift ™ </li>
		                           <li>Pillar in the middle </li>
		                           <li>Cushion at the bow of the boat</li>
		                           <li>Dripless Shaft Packing</li>

		', '                       (null)
		');
insert into configuration( id_pro, model, length_overall, beam, draft_max, draft_min, bridge_clearance, deadrise, dry_weight, fuel_tanks, water_tanks, Production_materials, Exterior_design, Interior_Design, passenger_capacity, cabins, manufacturer) values (51,'Ski Nautique 200 - Open Bow','6.65  m','2.41 m','0.56 m','null','null','null',' 1.293 t',' 102.10 l','null','GRP','null','null',9,'null',' Nautique (USA)');

insert into desc_pro( id_pro, info, featured, advanced, additional) values (52, '                       <p>One of Gulf Craft''s most successful lines, for passenger purposes. The Touring line includes Touring 36 and Touring 40. These boats are popular in boat rental industry in Arab, Oman, Maldives, Africa and the Middle East.
		</p>
		', '                           <li>Ability to carry up to 29 guests</li>
		                           <li>Different layout options - open and coupe</li>
		                           <li>External engine with up to 600 horsepower</li>
		                           <li>Many different options to meet your business needs </li>
		', '                     (null)
		', '                       (null)
		');
insert into configuration( id_pro, model, length_overall, beam, draft_max, draft_min, bridge_clearance, deadrise, dry_weight, fuel_tanks, water_tanks, Production_materials, Exterior_design, Interior_Design, passenger_capacity, cabins, manufacturer) values (52,'Touring 36','10.70  m',' 3.81 m',' 0.70 m','null','null','null','null',' 1140 l',' 190 l','null','null','null',12,'null',' Gulf Craft (UAE)');
insert into desc_pro( id_pro, info, featured, advanced, additional) values (53, '                       <p>One of Gulf Craft''s most successful lines, for passenger purposes. The Touring line includes Touring 36 and Touring 40. These boats are popular in boat rental industry in Arab, Oman, Maldives, Africa and the Middle East.
		</p>
		', '                           <li>Capable of carrying up to 37 guests (including captain and vice captain)</li>
		                           <li>Different layouts for the main deck to meet different business needs</li>
		                           <li>Two engine options - outside (up to 900 hp) and inside (up to 740 hp)</li>

		', '                         (null)
		', '                       (null)
		');
insert into configuration(id_pro, model, length_overall, beam, draft_max, draft_min, bridge_clearance, deadrise, dry_weight, fuel_tanks, water_tanks, Production_materials, Exterior_design, Interior_Design, passenger_capacity, cabins, manufacturer) values (53,'Touring 40',' 12.30  m',' 3.80 m','0.70 m','null','null','null','null','1140 l','190 l','null','null','null',12,'null',' Gulf Craft (UAE)');
insert into desc_pro( id_pro, info, featured, advanced, additional) values (54, '                       <p>Waveshuttle 56 is a high-speed business yacht, available in two versions - VIP and Ferry. VIP version includes lounge-style lounge with 24 seats. VIP version for those who need more luxury and privacy in a large space. Boat includes toilet, warehouse and crew area (for 2 people). Devices include generators, air conditioners, bow and propulsion engines, Garmin navigation packages with radar and other equipment. This is a special yacht for business purposes, very popular among government officials, 5-star hotels and resorts, large corporations and executive management.
		</p>
		', '                           <li>High speed yacht for business purposes</li>
		                           <li>25 seats</li>
		                           <li>Internal oil motor (choice of different horsepower)</li>
		                           <li>Propulsion motor in standard</li>
		', '                       (null)
		', '                       (null)
		');
insert into configuration( id_pro, model, length_overall, beam, draft_max, draft_min, bridge_clearance, deadrise, dry_weight, fuel_tanks, water_tanks, Production_materials, Exterior_design, Interior_Design, passenger_capacity, cabins, manufacturer) values (54,'Waveshuttle 56 VIP',' 18.12  m',' 4.88 m','1.09 m','null','null','null','null',' 3600 l','800 l','null','null','null',25,2,' Gulf Craft (UAE)');


insert into account( user_name, password, email, phone, fullname, gender, dob, addr, photo_acc, admin, status) values ('admin','admin','marinafleet@gmail.com', '0123456789', 'Marina Fleet', 'male', '2020-06-26', 'District 3, HCM city, VietNam', 'avatar.jpg', 1, 0);

