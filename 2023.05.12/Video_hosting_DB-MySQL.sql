CREATE TABLE `donations` (
  `donation_id` int(11) DEFAULT NULL,
  `created_at` timestamp DEFAULT NULL,
  `amount` decimal(9,2) DEFAULT NULL,
  `donator_id` int(11) DEFAULT NULL,
  `recipient_id` int(11) DEFAULT NULL,
  `commentary` varchar(128) DEFAULT NULL
);

CREATE TABLE `reactions` (
  `reaction_id` int(11) DEFAULT NULL,
  `created_at` timestamp DEFAULT NULL,
  `reaction_value` varchar(64) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `video_id` int(11) DEFAULT NULL
);

CREATE TABLE `users` (
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `is_blocked` tinyint(1) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL
);

CREATE TABLE `videos` (
  `video_id` int(11) DEFAULT NULL,
  `created_at` timestamp DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL,
  `duration_secs` int(11) DEFAULT NULL,
  `link` varchar(128) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `is_approved` tinyint(1) DEFAULT NULL
);

ALTER TABLE `donations` ADD FOREIGN KEY (`donator_id`) REFERENCES `users` (`user_id`);

ALTER TABLE `donations` ADD FOREIGN KEY (`recipient_id`) REFERENCES `users` (`user_id`);

ALTER TABLE `reactions` ADD FOREIGN KEY (`video_id`) REFERENCES `videos` (`video_id`);

ALTER TABLE `reactions` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

ALTER TABLE `videos` ADD FOREIGN KEY (`author_id`) REFERENCES `users` (`user_id`);
