SELECT player, "map", opponent, agent, rating
FROM "vct2023_kafka"."kafka_vct2023_valorant_project"
ORDER BY rating DESC 
LIMIT 10;