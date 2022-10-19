-- apagar o banco de dados caso ele exista:
DROP DATABASE if exists mulherestech;

-- cria o banco de dados:
CREATE DATABASE mulherestech ChARACTER SET utf8 COLLATE utf8_general_ci;

-- seleciona banco de dados:
USE mulherestech;

-- cria tabela users:
CREATE TABLE users (
  id INT PRIMARY KEY AUTO_INCREMENT,
  data TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- preencge a data agora.
  name VARCHAR (255) NOT NULL,
  email VARCHAR (255) NOT NULL,
  password VARCHAR (255) NOT NULL,
  photo VARCHAR (255),
   birth DATE,
    bio TEXT,
    type ENUM('admin', 'author', 'moderator', 'user') DEFAULT 'user',
    last_login DATETIME,
    status ENUM('online', 'offline', 'deleted') DEFAULT 'online'
);

-- cadastra alguns usuarios para teste:
INSERT INTO users (
    name,
    email,
    password,
    photo,
    birth,
    bio,
    type
)  VALUES  (
    'Yeximar Villalobos',
    'villalbosyeximar3@gmail.com',
    SHA1('villa27'), -- critografa a senha usando chave SHA1.
    'https://randomuser.me/api/portraits/men/14.jpg',
    '1990-12-14',
    'Pintor, programador, escultor e enrolador.',
    'author'
),(
    'luis aguilar',
    'luiasaab1233@gmail.com',
    SHA1('lab4123'), -- critografa a senha usando chave SHA1.
    'https://randomuser.me/api/portraits/men/72.jpg',
    '1980-10-28',
    'Estritora,montadora, organizadora e professora.',
    'author'
);
-- Cria tabela articles:
CREATE TABLE articles (
    id INT PRIMARY KEY AUTO_INCREMENT,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Preenche a data com agora.
    author INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    content LONGTEXT NOT NULL,
    thumbnail VARCHAR(255) NOT NULL,
    resume VARCHAR(255) NOT NULL,
    status ENUM('online', 'offline', 'deleted') DEFAULT 'online',
    views INT DEFAULT 0,
     -- define autor como chave estrsngeira.
    FOREIGN KEY (author) REFERENCES users (id)
);

--  Insere alguns artigos para teste:
INSERT INTO articles (
    author,
    title,
    content,
    thumbnail,
    resume
) VALUES (
    '1',
    'la vida es bella pero duele mucho',
    '<h2>Título de teste</h2><p> Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo quia provident reiciendis earum, tenetur reprehenderit iure ipsum fugit praesentium alias deserunt sed maiores id rerum odio delectus perferendis voluptatum totam!</p><p> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Libero hic, modi pariatur culpa animi cum! Consequatur, odit! Repudiandae, dolorem temporibus, quaerat, unde enim error eum minus praesentium libero quibusdam consequuntur.</p><img src="https://picsum.photos/200/200" alt="Imagem aleatória." /><p> Lorem ipsum dolor sit amet consectetur adipisicing elit. Quia recusandae illum aliquam aperiam, laborum fugiat quos sunt expedita culpa! Minima harum mollitia aperiam nihil dolorem animi accusantium quia maxime expedita.</p><h3>Lista de links:</h3><ul><li><a href="https://github.com/Luferat">GitHub do Fessô</a></li><li><a href="https://catabits.com.br">Blog do Fessô</a></li><li><a href="https://facebook.com/Luferat">Facebook do Fessô</a></li></ul><p> Lorem, ipsum dolor sit amet consectetur adipisicing elit. Aliquam commodi inventore nemo doloribus asperiores provident, recusandae maxime quam molestiae sapiente autem, suscipit perspiciatis. Numquam labore minima, accusamus vitae exercitationem quod!</p>',
    'https://picsum.photos/200',
    'Saiba a origem do porque a villa es bella pero duele mucho.'
    ), (
    '2',
    'Por que os peixes nadam',
    '<h2>Título de teste</h2><p> Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo quia provident reiciendis earum, tenetur reprehenderit iure ipsum fugit praesentium alias deserunt sed maiores id rerum odio delectus perferendis voluptatum totam!</p><p> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Libero hic, modi pariatur culpa animi cum! Consequatur, odit! Repudiandae, dolorem temporibus, quaerat, unde enim error eum minus praesentium libero quibusdam consequuntur.</p><img src="https://picsum.photos/200/200" alt="Imagem aleatória." /><p> Lorem ipsum dolor sit amet consectetur adipisicing elit. Quia recusandae illum aliquam aperiam, laborum fugiat quos sunt expedita culpa! Minima harum mollitia aperiam nihil dolorem animi accusantium quia maxime expedita.</p><h3>Lista de links:</h3><ul><li><a href="https://github.com/Luferat">GitHub do Fessô</a></li><li><a href="https://catabits.com.br">Blog do Fessô</a></li><li><a href="https://facebook.com/Luferat">Facebook do Fessô</a></li></ul><p> Lorem, ipsum dolor sit amet consectetur adipisicing elit. Aliquam commodi inventore nemo doloribus asperiores provident, recusandae maxime quam molestiae sapiente autem, suscipit perspiciatis. Numquam labore minima, accusamus vitae exercitationem quod!</p>',
    'https://picsum.photos/199',
    'Alguns peixes nadam melhor que outros. Sabe por que?'
);
