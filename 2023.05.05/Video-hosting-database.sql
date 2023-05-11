SELECT
	videos.title,
    users.username,
    reactions.reaction_value
FROM reactions
JOIN videos ON reactions.video_id = videos.video_id
JOIN users ON reactions.user_id = users.user_id
WHERE videos.video_id = 1;