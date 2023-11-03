SELECT "map", COUNT(*) as count
FROM "vct2023_kafka"."kafka_vct2023_valorant_project"
WHERE "map" IS NOT NULL
GROUP BY "map"
ORDER BY count" DESC;