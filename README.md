# README

A simple application for searching any prompt and seach the promot in the elastice search index.

* Version
Ruby - 3.0.0
Rails - 7.1.3

* System dependencies
Postgres official image: postgres:12
Elasticseach image: docker.elastic.co/elasticsearch/elasticsearch:8.12.2

* Configuration
Currently the system does not have any password protection.
The database and elastic container is also not password protected.
*Production* setup is not done.

* Initial setup to porpulate the elastic search index
rails db:seed

* Test suit
Rspec or any test suit has not et added.
