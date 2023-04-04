CREATE TABLE `follows` (
  `following_user_id` integer,
  `followed_user_id` integer,
  `created_at` timestamp
);

CREATE TABLE `users` (
  `id` integer PRIMARY KEY,
  `username` varchar(255) UNIQUE,
  `email` varchar(255),
  `validemail` bool,
  `password` varchar(255),
  `phone` varchar(255),
  `image` varchar(255),
  `dis` text,
  `created_at` timestamp
);

CREATE TABLE `order` (
  `id` integer PRIMARY KEY,
  `post_id` integer,
  `user_id` integer,
  `num_of_pice` integer,
  `body` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `posts` (
  `id` integer PRIMARY KEY,
  `title` varchar(255),
  `body` text COMMENT 'Content of the post',
  `user_id` integer,
  `image` varchar(255),
  `created_at` timestamp
);

ALTER TABLE `posts` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `users` ADD FOREIGN KEY (`id`) REFERENCES `order` (`user_id`);

ALTER TABLE `posts` ADD FOREIGN KEY (`id`) REFERENCES `order` (`post_id`);

ALTER TABLE `follows` ADD FOREIGN KEY (`following_user_id`) REFERENCES `users` (`id`);

ALTER TABLE `follows` ADD FOREIGN KEY (`followed_user_id`) REFERENCES `users` (`id`);
