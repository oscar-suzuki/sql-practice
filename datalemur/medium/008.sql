-- Spotify / Spotify Streaming History

WITH union_tbl AS(
  SELECT
    user_id,
    song_id,
    SUM(song_plays) as total
  FROM songs_history
  GROUP BY user_id, song_id
  UNION ALL
  SELECT
    user_id,
    song_id,
    COUNT(*) as total
  FROM songs_weekly
  WHERE listen_time < '2022-8-5'
  GROUP BY user_id, song_id
)
SELECT
  user_id,
  song_id,
  SUM(total) as song_plays
FROM union_tbl
GROUP BY user_id,song_id
ORDER BY song_plays DESC;
