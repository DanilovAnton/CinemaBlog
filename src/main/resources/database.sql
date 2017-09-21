-- Table: users
CREATE TABLE users (
  id       INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  email    VARCHAR(255)

)
  ENGINE = InnoDB;

-- Table: roles
CREATE TABLE roles (
  id   INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL
)
  ENGINE = InnoDB;

-- Table for mapping user and roles: user_roles
CREATE TABLE user_roles (
  user_id INT NOT NULL,
  role_id INT NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (role_id) REFERENCES roles (id),

  UNIQUE (user_id, role_id)
)
  ENGINE = InnoDB;

/*Create tables*/
CREATE TABLE posts (
  id      INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT          NOT NULL,
  title   VARCHAR(255) NOT NULL,
  text    VARCHAR(255) NOT NULL,
  tags    VARCHAR(255) NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users (id)
    ON DELETE CASCADE
)
  ENGINE = InnoDB;
CREATE TABLE comments (
  id      INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
  post_id INT          NOT NULL,
  text    VARCHAR(255) NOT NULL,

  FOREIGN KEY (post_id) REFERENCES posts (id)
    ON DELETE CASCADE
)
  ENGINE = InnoDB;

INSERT INTO users VALUES (1, 'admin', 'admin', 'admin@admin.ru');

INSERT INTO roles VALUES (1, 'ROLE_USER');
INSERT INTO roles VALUES (2, 'ROLE_ADMIN');

INSERT INTO user_roles VALUES (1, 2);

/*insert into table posts*/
INSERT INTO posts VALUES (1, 1, 'title1', 'text1', 't1');
INSERT INTO posts VALUES (2, 1, 'title2', 'text2', 't2');


/*insert into table comments*/
INSERT INTO comments VALUES (1, 1, 'I love you! Mario');
INSERT INTO comments VALUES (2, 1, 'I hate you! ALex');
INSERT INTO comments VALUES (3, 1, 'Can i help you! Anton');

INSERT INTO comments VALUES (4, 2, 'Hello world');
INSERT INTO comments VALUES (5, 2, 'Shape of you');

