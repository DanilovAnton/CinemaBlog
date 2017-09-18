/*Create tables*/
CREATE TABLE posts (
  id     INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  text   VARCHAR(255) NOT NULL,
  tags   VARCHAR(255) NOT NULL
)
  ENGINE = InnoDB;
CREATE TABLE comments (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  id_post int NOT NULL,
  TEXT VARCHAR(255) NOT NULL,

  FOREIGN KEY (id_post) REFERENCES posts (id) ON DELETE CASCADE
)
  ENGINE = InnoDB;

/*insert into table posts*/
INSERT INTO posts VALUES (1,'title1','text1', 't1');
INSERT INTO posts VALUES (2,'title2','text2', 't2');


/*insert into table comments*/
INSERT INTO comments VALUES (1,1,'I love you! Mario');
INSERT INTO comments VALUES (2,1,'I hate you! ALex');
INSERT INTO comments VALUES (3,1,'Can i help you! Anton');

INSERT INTO comments VALUES (4,2,'Hello world');
INSERT INTO comments VALUES (5,2,'Shape of you');

