# README

A simple application for searching any prompt and seach the promot in the elastice search index.

# Version
Ruby - 3.0.0  
Rails - 7.1.3

# System dependencies
Postgres official image: postgres:12  
Elasticseach image: docker.elastic.co/elasticsearch/elasticsearch:8.12.2

# Configuration
Currently the system does not have any password protection.  
The database and elastic container is also not password protected.  
*Production* setup is not done.

# Test suit
Rspec or any test suit has not yet added.

# Application setup:
To run the application, the system should have docker installed.
1. To run the postgres and elasticsearch container  
  `$ docker compose up`
2. To run the application  
  `$ rails s`
3. For postgres database setup, to create DB in the postgres  
  `$ rails db:setup` and optional `$ rails db:migrate`
4. To populate the elasticsearch's index  
  `$ rails db:seed`  
  This will pull up data from the dataset and will create index named `user_prompts` in elasticsearch.

# About postgres setup
Postgres has mapped `5434` port to `5432` port of postgres container.  
This is currently an unprotected database without username and password.  

## Database Design  
One table name `user_prompts` this will store the search history.

# About elastic search
Elastic has mapped `9201` port to `9200` port of elasticsearch container.  
This is currently an unprotected database without username and password. 

## Elasticsearch index format
```   
{
  "_index": "user_prompts",
  "_id": "0",
  "_version": 1,
  "_seq_no": 0,
  "_primary_term": 1,
  "found": true,
  "_source": {
    "prompt": "realistic car 3 d render sci - fi car and sci - fi robotic factory structure in the coronation of napoleon painting and digital billboard with point cloud in the middle, unreal engine 5, keyshot, octane, artstation trending, ultra high detail, ultra realistic, cinematic, 8 k, 1 6 k, in style of zaha hadid, in style of nanospace michael menzelincev, in style of lee souder, in plastic, dark atmosphere, tilt shift, depth of field,"
  }
}
```