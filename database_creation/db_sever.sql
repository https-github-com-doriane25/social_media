CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(75) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1;

create table `profil`(
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `username` varchar(70) NOT NULL, 
    `profile_picture` varchar(255) NULL,
    `created_at` date NOT NULL,
    `updated_at` date NULL,
    `user_id` int(11) NOT NULL, 
    PRIMARY KEY(`id`),
    CONSTRAINT fk_users_profil FOREIGN KEY(user_id) 
    REFERENCES users(id) ON DELETE CASCADE )
    ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1;


create table `post`(
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `media` varchar(255) NULL,
  `created_at` date NOT NULL,
  `updated_at` date NULL,
  `user_id` int(11) not NULL,
  primary key(`id`),
  CONSTRAINT fk_users FOREIGN KEY(user_id)
  REFERENCES users(id)ON DELETE CASCADE)
  ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1;

create table `commentaires`(
`id` int(11) not NULL,
`content` varchar(70) Not NULL,
`created_at` date NOT NULL,
`updated_at` date NULL,
`user_id` int(11) NOT NULL,
`post_id` int(11) NOT NULL,
 primary key(`id`),
 /* CONSTRAINT fk_users FOREIGN KEY(user_id)
  REFERENCES users(id)*/
CONSTRAINT fk_post FOREIGN KEY(post_id)
REFERENCES post(id) ON DELETE CASCADE)
ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1;

create table `abonne`(
`id` int(11) NOT NULL,
`created_at` date NOT NULL,
`profil_id` int (11),
 primary key(`id`),
 CONSTRAINT fk_profil FOREIGN KEY(profil_id)
 REFERENCES profil(id) ON DELETE CASCADE
)ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1;


create table `messagerie`(
  `message` varchar(150) not null,
   `id` int(11) not null,
   `abonne_id` int (11) not null,
  PRIMARY KEY(`id`),
  /*CONSTRAINT fk_users FOREIGN KEY (users_Id),  
  REFERENCES users(id)*/
  CONSTRAINT fk_abonne FOREIGN KEY (abonne_id) 
  REFERENCES abonne(id) ON DELETE CASCADE
)ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1;
  
  