SELECT agent, COUNT(DISTINCT game_id) AS games_played, ROUND(AVG(kd), 2) AS avg_kd
FROM "vct2023_kafka"."kafka_vct2023_valorant_project"
WHERE agent IS NOT NULL
GROUP BY agent
ORDER BY games_played DESC;