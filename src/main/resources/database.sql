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
  text    TEXT         NOT NULL,
  tags    TEXT         NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users (id)
    ON DELETE CASCADE
)
  ENGINE = InnoDB;
CREATE TABLE comments (
  id       INT      NOT NULL AUTO_INCREMENT PRIMARY KEY,
  post_id  INT      NOT NULL,
  user_id  INT      NOT NULL,
  datetime DATETIME NOT NULL,
  TEXT     TEXT     NOT NULL,

  FOREIGN KEY (post_id) REFERENCES posts (id)
    ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES users (id)

)
  ENGINE = InnoDB;

INSERT INTO users VALUES (1, 'UnShock48', '$2a$10$4oQpnp5qjuP21UXweP5uPOWbTA6FkXUtDoz5Rd.1C0J1QTqEYyRBO',
                          'UnShock48@gmail.com');

INSERT INTO roles VALUES (1, 'ROLE_USER');

INSERT INTO user_roles VALUES (1, 1);

/*insert into table posts*/
INSERT INTO posts VALUES (1, 1, 'Шаблоны Bootstrap',
                          'Дополнительные шаблоны созданы на основе базового, представленного разделом выше.
                          Также рекомендуем посмотреть советы по Настройке Bootstrap для
                          использования вашего собственного варианта.',
                          't1');
INSERT INTO posts VALUES (2, 1, 'Панель навигации',
                          'Этот шаблон обычной панели навигации создан для наглядного примера.
                          Меню растянуто только до ширины основного контента и имеет отступ от верхней части страницы.',
                          't2');


/*insert into table comments*/
INSERT INTO comments VALUES (1, 1, 1, '2008-7-04 11-11-11', 'I love you! Mario');
INSERT INTO comments VALUES (2, 1, 1, '2008-7-04 11-11-11', 'I hate you! ALex');
INSERT INTO comments VALUES (3, 1, 1, '2008-7-04 11-11-11', 'Can i help you! Anton');


