WITH RankedAgents AS (
    SELECT
        "map",
        agent,
        COUNT(*) AS agent_picks
    FROM "vct2023_kafka"."kafka_vct2023_valorant_project"
    WHERE "map" IS NOT NULL
    GROUP BY "map", agent
)
SELECT DISTINCT
    "map",
    FIRST_VALUE(agent) OVER (PARTITION BY "map" ORDER BY agent_picks DESC) AS agent,
    MAX(agent_picks) OVER (PARTITION BY "map") AS agent_picks
FROM RankedAgents;