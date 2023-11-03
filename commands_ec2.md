# 💻 Commands to execute inside the EC2 SSH

First SSH to your EC2 instance using the SSH command in the *connect* button in AWS:

```
ssh -i "kafka-valorant-project.pem" ec2-user@ec2-54-198-23-227.compute-1.amaz
onaws.com
```

### 1. Download the Apache Kafka
```
wget https://downloads.apache.org/kafka/3.6.0/kafka_2.12-3.6.0.tgz  
```

### 2. Unzip the downloaded tgz
```
tar -xvf kafka_2.12-3.6.0
```

---

### 3. Download Java JVM

```
java -version  
sudo yum install java
java -version
```
### 4. Start the Zookeeper

- **Zookeer:** A service for distributed setup and coordination, essential for Kafka’s distributed functioning.
```
cd kafka_2.12-3.6.0
```
```
bin/zookeeper-server-start.sh config/zookeeper.properties
```

- Open another window to start the Kafka server
- But first SSH again to your ec2 machine 


### 5. Start the Kafka Server:

- **Kafka**: Distributed system for high-throughput data streaming
```
export KAFKA_HEAP_OPTS="-Xmx256M -Xms128M"
```

- Change the server properties: change ADVERTISED_LISTENERS to public ip of the EC2 instance and save the file
```
cd kafka_2.12-3.6.0
sudo nano config/server.properties
```

- Start the Kafka Server
```
bin/kafka-server-start.sh config/server.properties
```

### 6. Create the topic:

- Duplicate the session & enter in a new console 

```
cd kafka_2.12-3.6.0
bin/kafka-topics.sh --create --topic valorant_prjct --bootstrap-server public_ip_of_ec2:9092 --replication-factor 1 --partitions 1
```

### 7. Start Producer:

```
bin/kafka-console-producer.sh --topic valorant_prjct --bootstrap-server public_ip_of_ec2:9092
```

### 8. Start Consumer:

- Duplicate the session & enter in a new console 

```
cd kafka_2.12-3.6.0
bin/kafka-console-consumer.sh --topic valorant_prjct --bootstrap-server public_ip_of_ec2:9092
```