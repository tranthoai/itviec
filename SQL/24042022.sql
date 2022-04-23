create table _user
(
    id        SERIAL PRIMARY KEY,
    full_name VARCHAR(255) not null,
    username  VARCHAR(255) not null,
    email     VARCHAR(255) not null,
    password  VARCHAR(255) not null,
    roles     TEXT         not null,
    UNIQUE (username),
    UNIQUE (email)
);


create table post
(
    id           SERIAL PRIMARY KEY,
    author_id    INTEGER REFERENCES _user (id),
    title        VARCHAR(255) not null,
    slug         VARCHAR(255) not null,
    summary      VARCHAR(255) not null,
    content      TEXT         not null,
    published_at DATE         not null,
    UNIQUE (author_id)
);

create table comment
(
    id           SERIAL PRIMARY KEY,
    post_id      INTEGER references post (id),
    author_id    INTEGER references _user (id),
    content      TEXT not null,
    published_at DATE not null,
    UNIQUE (post_id),
    UNIQUE (author_id)
);

create table tag
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(255) not null,
    UNIQUE (name)
);

CREATE TABLE post_tag
(
    post_id INT NOT NULL,
    tag_id  INT NOT NULL,
    PRIMARY KEY (post_id, tag_id)
);


