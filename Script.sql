create table albums (
	album_ID SERIAL primary key,
	name_album VARCHAR(50) not null,
	release_year date not null
);

create table collection (
	collection_ID SERIAL primary key,
	name_collection VARCHAR(50) not null,
	release_year date not null
);

create table genres (
	genre_ID SERIAL primary key,
	title VARCHAR(100) not null unique
);

create table musician (
	musician_ID SERIAL primary key,
	musician_name VARCHAR(50) not null
);

create table tracks (
	track_ID SERIAL primary key,
	title VARCHAR(50) not null,
	duration time not null,
	album_id integer references albums(album_ID)
);


-- Таблицы посредники в связи многие ко многим

create table genre_musician (
	genre_ID integer references genres(genre_ID),
	musician_ID integer references musician(musician_ID),
	primary key (genre_ID, musician_ID)
);

create table track_collection (
	track_ID integer references tracks(track_ID),
	collection_ID integer references collection(collection_ID),
	primary key (track_ID, collection_ID)
);

create table album_musician (
	album_ID integer references albums(album_ID),
	musician_ID integer references musician(musician_ID),
	primary key (album_ID, musician_ID)
);