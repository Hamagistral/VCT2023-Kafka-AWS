SELECT
    team,
    SUM(CASE WHEN win_lose = 'team win' THEN 1 ELSE 0 END) AS total_wins,
    SUM(CASE WHEN win_lose = 'opponent win' THEN 1 ELSE 0 END) AS total_losses,
    ROUND(AVG(kd), 2) as avg_kd
FROM "vct2023_kafka"."kafka_vct2023_valorant_project"
WHERE team IS NOT NULL
GROUP BY team
ORDER BY total_wins DESC;