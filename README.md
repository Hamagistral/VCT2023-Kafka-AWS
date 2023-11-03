<div align="center">
  <a href="https://lookerstudio.google.com/reporting/da5da0af-4be0-4f7d-a84b-f7c2892df612">
    <img src="https://github.com/Hamagistral/VCT2023-Kafka-AWS/assets/66017329/2ece4678-a9ba-407d-89ca-17299a40defe" alt="Banner" width="720">
  </a>

  <div id="user-content-toc">
    <ul>
      <summary><h1 style="display: inline-block;">⚙️ REAL-TIME ANALYSIS OF VCT 2023 🎮</h1></summary>
    </ul>
  </div>
</div>
<br>

## 📝 Table of Contents

1. [ Project Overview ](#introduction)
2. [ Key Insights ](#features)
3. [ Project Architecture ](#arch)
4. [ Usage ](#usage)
5. [ Credits ](#refs)
6. [ Contact ](#contact)

<a name="introduction"></a>
## 🔬 Project Overview 

In this project, I conducted an end-to-end data engineering project, building a real-time data pipeline to collect, process, and analyze data from the Valorant Champions Tour games that happened in 2023. The project involves using various technologies, including Python, Terraform, and Amazon Web Services (AWS) with services such as EC2, S3, Glue, Athena, and Kafka for real-time streaming.

### 💾 Dataset

The project uses the *[Valorant Champions Tour 2023 All-Tournament Dataset](https://www.kaggle.com/datasets/ediashtarevin/vct-champions-2023-stats)* from Kaggle. This dataset contains extensive statistics for each player and team in each game, including information about teams, maps, and agents. It includes over 20 columns and 6000+ rows.

The dataset includes the following columns:

| **Column**      | **Description**                                                        |
| :-------------- | :--------------------------------------------------------------------- |
| **match_id**    | ID of matches played.                                                |
| **game_id**     | Game ID of each map played from each match.                           |
| **team**        | Team name.                                                           |
| **score_team**  | Final score achieved by the team.                                    |
| **opponent**    | Opponent team name.                                                  |
| **score_opp**   | Final score achieved by the opponent.                                 |
| **win_lose**    | Result of the game.                                                  |
| **map**         | Name of map played.                                                 |
| **map_pick**    | Which team picked the map.                                          |
| **player_id**   | ID of player.                                                       |
| **player**      | Player name.                                                        |
| **agent**       | Agent used in the game.                                             |
| **rating**      | Rating by player for the game.                                      |
| **acs**         | Average Combat Score.                                               |
| **kill**        | Number of Kill Accumulated.                                         |
| **death**       | Number of Death Accumulated.                                        |
| **assist**      | Number of Assist Accumulated.                                       |
| **kast%**       | Percentage of Kill, Assist, Survive, Trade.                          |
| **adr**         | Average damage dealt during a game.                                 |
| **hs%**         | Headshot percentage.                                                |
| **fk**          | First kill count.                                                   |
| **fd**          | First death count.                                                  |
| **kd**          | Kill-Death ratio.                                                   |

### 🎯 Project Goals

- Set up the cloud infrastructure using Terraform.
- Build real-time data processing and analysis from Valorant games.
- Leverage AWS cloud infrastructure, including EC2, S3, Glue, Athena to handle data processing and analysis tasks.
- Simulate real-time data flow using Python and Kafka for data streaming, with producer and consumer.
- Utilize SQL queries to gain insights into top-picked agents by map, the top-played agent overall, top-played maps, top players by rating, and team wins and losses.

<a name="features"></a>
## 🕵️ Key Insights

- 🗺️ **Top Picked Map**
  - Haven is the top 1 picked map with 110 picks followed by Pearl with 90 and Ascent with 80.
 
- 🦸‍♂️ **Top 3 Picked Agents**
  - **N°1:** Jett (Duelist) is the top-picked agent with 42 picks and an Average K/D of 1.16
  - **N°2:** Killjoy (Sentinel) is the second most picked agent with 40 picks and an Average K/D of 1.12
  - **N°3:** KAY/O (Initiator) is the third agent by picks with 29 and an Average K/D of 1.0

> Conclusion: Most teams prefer to play with those agents in the top-picked maps (Haven, Pearl, and Ascent)

- 👨‍💻 **Top players in the Tournament by Rating**
  - Xffero (DFM) has the highest rating in the tournament 2.10 in the map Haven with Sova.
  - k1Ng (T1) is second with 2.05 in Haven with Killjoy.
  - Dep (GE) with a rating of 1.91 also in Haven using Jett as an agent.

> We can see that the top 3 highest ratings were in the Haven map but with different roles of agents (Initiator, Sentinel and a Duelist)

<a name="arch"></a>
## 📝 Project Architecture

This project follows an architecture that simulates a real-time data flow of Valorant games data using Kafka producer and consumer. The architecture includes:

1. Kafka Server and Zookeeper running on an AWS EC2 instance.
2. Kafka Producer to stream real-time data.
3. Kafka Consumer to consume the real-time data.
4. Store data in JSON files and upload them to an S3 Bucket.
5. AWS Glue Crawler to crawl the S3 Bucket and create a table in AWS Athena.
6. SQL analysis using AWS Athena to gain insights into the data.

![architecture](https://github.com/Hamagistral/VCT2023-Kafka-AWS/assets/66017329/bd4cb357-1894-466f-850a-b228f8048251)

### 🛠️ Technologies Used

- **Infrastructure**: Terraform
- **Amazon Web Services (AWS)**
  - VM Machine: Amazon Elastic Compute Cloud (Amazon EC2)
  - Data Lake: S3 Bucket
  - Amazon Glue Crawler: Creates tables in the Data Catalog
  - Amazon Athena: Analyze Data
- **Real-Time Streaming**: Apache Kafka

<a name="usage"></a>
## 💻 Usage

First, clone this repository.

```
git clone https://github.com/Hamagistral/VCT2023-Kafka-AWS.git
```

#### 1. Pre-requisites

Make sure you have the following pre-installed components:

- [AWS account](https://aws.amazon.com/console/)
- [Terraform](https://developer.hashicorp.com/terraform/downloads)

#### 2. Terraform
We use Terraform to build and manage AWS infrastructure. Terraform configuration files are located in the separate folder. There are 3 configuration files:

- terraform-version - contains information about the installed version of Terraform;
- variables.tf - contains variables to make your configuration more dynamic and flexible;
- main.tf - is a key configuration file consisting of several sections.

Now you can use the steps below to generate resources inside the GCP:

1. Move to the terraform folder using bash command `cd`
2. Run `terraform init` command to initialize the configuration.
3. Use `terraform plan` to match previews local changes against a remote state.
4. Apply changes to the cloud with `terraform apply` command.

If you would like to remove your stack from the Cloud, use the `terraform destroy` command.

> See this [file](https://github.com/Hamagistral/VCT2023-Kafka-AWS/blob/master/commands_ec2.md) for the following steps in detail.

#### 3. Connect to the AWS EC2 Instance 
#### 4. Configure Kafka producer and consumer.
#### 5. Stream real-time data into Kafka.
#### 6. Store the consumed data in an S3 Bucket.

![S3bucket](https://github.com/Hamagistral/VCT2023-Kafka-AWS/assets/66017329/3d8e4e1d-e3a8-42c2-9b99-e3dfd44e3791)

#### 7. Use AWS Glue Crawler to create a table in AWS Athena.
![table_on_datacatalog](https://github.com/Hamagistral/VCT2023-Kafka-AWS/assets/66017329/bbd23fb3-79f1-4ae3-90bb-f43f716a6952)
#### 8. Analyze the data using SQL in AWS Athena.
- SQL Query for Top Players by Rating
![top_players_byrating](https://github.com/Hamagistral/VCT2023-Kafka-AWS/assets/66017329/a9d96f50-cacf-452f-a27b-85c6d7cb543d)

> For more see the [Analytics Folder](https://github.com/Hamagistral/VCT2023-Kafka-AWS/tree/master/analytics) for the results and [SQL Queries Folder](https://github.com/Hamagistral/VCT2023-Kafka-AWS/tree/master/sql_queries) for the executed SQL Queries inside Athena.

<a name="refs"></a>
## 📋 Credits

- This Project is inspired by the video of the [YouTube Channel Darshil Parmar](https://www.youtube.com/watch?v=KerNf0NANMo)  

<a name="contact"></a>
## 📨 Contact Me

[LinkedIn](https://www.linkedin.com/in/hamza-elbelghiti/) •
[Website](https://Hamagistral.me) •
[Gmail](hamza.lbelghiti@gmail.com)
