create database karuta;

use karuta;

drop table if exists user;
create table user(
    user_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    user_name VARCHAR(64) NOT NULL ,
    password BINARY(16) NOT NULL,
    email VARCHAR(64) UNIQUE NOT NULL,
    authority BOOLEAN NOT NULL,
    stat TINYINT NOT NULL,
    created DATETIME NOT NULL,
    last_login DATETIME NOT NULL,
    token BINARY(16) NOT NULL,
    code VARCHAR(64)
    );

drop table if exists card_set;
create table card_set(
    cardset_id VARCHAR(255) PRIMARY KEY NOT NULL,
    cardset_name VARCHAR(255) NOT NULL,
    creator_id INT NOT NULL,
    FOREIGN KEY (creator_id) REFERENCES user (user_id)
);

drop table if exists card;
create table card(
    card_id VARCHAR(255) PRIMARY KEY NOT NULL,
    card_name VARCHAR(255) NOT NULL,
    audio_path VARCHAR(255) NOT NULL,
    picture_path VARCHAR(255) NOT NULL,
    music_name VARCHAR(255) NOT NULL,
    translate_name VARCHAR(255) NOT NULL,
    author_name VARCHAR(255) NOT NULL,
    cardset_id VARCHAR(255) NOT NULL,
    FOREIGN KEY (cardset_id) REFERENCES card_set (cardset_id)
);

drop table if exists user__card_set;
create table user__card_set(
  card_set_id VARCHAR(255) NOT NULL,
  user_id INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES user (user_id),
  FOREIGN KEY (card_set_id) REFERENCES card_set (cardset_id)
);
alter table user__card_set add unique key(card_set_id,user_id);


