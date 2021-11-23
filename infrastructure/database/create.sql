ALTER DATABASE develop charset=utf8;

create table if not exists countries(
    country_id int auto_increment primary key,
    name varchar(45),
    created datetime,
    created_by int,
    modified datetime,
    modified_by int
) CHARSET=utf8;

create table if not exists regions(
    region_id int auto_increment primary key,
    country_id int,
    name varchar(45),
    created datetime,
    created_by int,
    modified datetime,
    modified_by int,
    foreign key (country_id) references countries (country_id)
) CHARSET=utf8;

create table if not exists cities(
    city_id int auto_increment primary key,
    region_id int,
    name varchar(45),
    location_latitude varchar(45),
    location_longitude varchar(45),
    created datetime,
    created_by int,
    modified datetime,
    modified_by int,
    foreign key (region_id) references regions (region_id)
) CHARSET=utf8;

create table if not exists hotels(
    hotel_id int auto_increment primary key,
    city_id int,
    hotel_type_id int,
    name varchar(45),
    stars int,
    address varchar(45),
    description text,
    no_smoking bool,
    no_animals bool,
    location_latitude varchar(45),
    location_longitude varchar(45),
    commission decimal(20,2),
    currency_id int,
    created datetime,
    created_by int,
    modified datetime,
    modified_by int,
    foreign key (city_id) references cities (city_id)
) CHARSET=utf8;

insert into countries(
    country_id, name, created,
    created_by, modified, modified_by)
    value
    (7, 'Россия', CURRENT_DATE(), 1, CURRENT_DATE(), 1);

insert into regions (
    region_id, country_id, name, created,
    created_by, modified, modified_by)
    value
    (36, 7, 'Воронежская область', CURRENT_DATE(), 1, CURRENT_DATE(), 1);

insert into cities (
    city_id, region_id, name, location_latitude, location_longitude,
    created, created_by, modified, modified_by)
    value
    (1, 36, 'Воронеж', '51°40′19″', '39°11′03″', CURRENT_DATE, 1, CURRENT_DATE(), 1);

insert into hotels (
    hotel_id, city_id, hotel_type_id, name, stars,
    address, description, no_smoking, no_animals, location_latitude,
    location_longitude, commission, currency_id, created,
    created_by, modified, modified_by)
values
(1, 1, 5, 'Мариот', 4, 'пр. Революции, 38', 'Описание не знаю что написать', 0, 1, 51.668011, 39.205525, 10, 1, CURRENT_DATE(), 1, CURRENT_DATE(), 1),
(2, 1, 3, 'Бронзовый Кабан', 4, 'ул. Кольцовская, 1Д', 'Описание не знаю что написать', 0, 1, 51.678401, 39.212834, 15, 1, CURRENT_DATE(), 1, CURRENT_DATE(), 1),
(3, 1, 4, 'Украина', 4, 'ул. Арсенальная, 4а', 'Описание не знаю что написать', 0, 1, 51.674620, 39.214856, 5, 1, CURRENT_DATE(), 1, CURRENT_DATE(), 1),
(4, 1, 2, 'Принц', 4, 'Московский проспект, 171Б', 'Описание не знаю что написать', 0, 1, 51.752702, 39.185704, 6, 1, CURRENT_DATE(), 1, CURRENT_DATE(), 1),
(5, 1, 1, 'МП', 4, 'Московский просп., 129/1', 'Описание не знаю что написать', 0, 1, 51.718049, 39.178298, 8, 1, CURRENT_DATE(), 1, CURRENT_DATE(), 1),
(6, 1, 1, 'МП', 4, 'Московский просп., 129/1', 'Описание не знаю что написать', 0, 1, 51.718049, 39.178298, 8, 1, CURRENT_DATE(), 1, CURRENT_DATE(), 1);

CREATE INDEX hotel_id ON hotels(city_id);

CREATE
    TRIGGER `hotels_insert` BEFORE INSERT
    ON `hotels`
    FOR EACH ROW BEGIN

    SET NEW.location_latitude = (select location_latitude from cities where city_id = NEW.city_id);
    SET NEW.location_longitude = (select location_longitude from cities where city_id = NEW.city_id);
END









