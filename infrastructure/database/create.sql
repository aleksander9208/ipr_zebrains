use develop;

/* Список отелей */
create table hotels(
    hotel_id int not null auto_increment primary key,
    city_id int not null,
    hotel_type_id int not null,
    name varchar(45) not null,
    attention varchar(45) not null,
    stars int not null,
    address varchar(45) not null,
    description text not null,
    no_smoking bool not null,
    no_animals bool not null,
    location_latitude float not null,
    location_longitude float not null,
    location_zoom float not null,
    commission decimal(20,2) not null,
    currency_id int not null,
    created datetime not null,
    created_by int not null,
    modified datetime not null,
    modified_by int not null
);

/* Географическое положение отелей */
create table cities(
    city_id int not null auto_increment primary key,
    region_id int not null,
    name varchar(45) not null,
    location_latitude float not null,
    location_longitude float not null,
    location_zoom float not null,
    wheater varchar(45) not null,
    created datetime not null,
    created_by int not null,
    modified datetime not null,
    modified_by int not null,
    foreign key (city_id) references hotels (city_id)
);

create table regions(
    region_id int not null auto_increment primary key,
    country_id int not null,
    name varchar(45) not null,
    created datetime not null,
    created_by int not null,
    modified datetime not null,
    modified_by int not null,
    foreign key (region_id) references cities (region_id)
);

create table countries(
    country_id int not null auto_increment primary key,
    name varchar(45) not null,
    created datetime not null,
    created_by int not null,
    modified datetime not null,
    modified_by int not null,
    foreign key (country_id) references regions (country_id)
);

/* Тип отелей */
create table hotel_types(
    hotel_type_id int not null auto_increment primary key,
    name varchar(45) not null,
    created datetime not null,
    created_by int not null,
    modified datetime not null,
    modified_by int not null,
    foreign key (hotel_type_id) references hotels (hotel_type_id)
);

/* Картинки отеля */
create table hotel_images(
    hotel_images_id int not null auto_increment primary key,
    hotel_id int not null,
    image_id int not null,
    priority int not null,
    foreign key (hotel_id) references hotels (hotel_id)
);

/* Картинки */
create table images(
    image_id int not null auto_increment primary key,
    name varchar(45) not null,
    text varchar(45) not null,
    foreign key (image_id) references hotel_images (image_id)
);

/* Картинки комнат */
create table room_images(
    room_image_id int not null auto_increment primary key,
    room_id int not null,
    image_id int not null,
    priority int not null,
    foreign key (image_id) references images (image_id)
);

/* Комнаты */
create table rooms(
    room_id int not null auto_increment primary key,
    room_type_id varchar(45) not null,
    hotel_id int not null,
    room_number int not null,
    max_children int not null,
    max_adult int not null,
    main_image varchar(45) not null,
    thumbnail_image varchar(45) not null,
    created datetime not null,
    created_by int not null,
    modified datetime not null,
    modified_by int not null,
    foreign key (hotel_id) references hotels (hotel_id)
)

/* Тип комнаты */
create table room_types(
   room_type_id int not null auto_increment primary key,
   name varchar(45) not null,
   created datetime not null,
   created_by int not null,
   modified datetime not null,
   modified_by int not null,
   foreign key (room_type_id) references rooms (room_id)
);

/* Цена комнаты */
create table room_prices(
    room_prices_id int not null auto_increment primary key,
    room_id int not null,
    start_date datetime not null,
    full_price decimal(20,2) not null,
    adult_price decimal(20,2) not null,
    child_price decimal(20,2) not null,
    published bool not null,
    created datetime not null,
    created_by int not null,
    modified datetime not null,
    modified_by int not null,
    foreign key (room_id) references rooms (room_id)
);