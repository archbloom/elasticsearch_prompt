Elasticsearch::Model.client = Elasticsearch::Client.new(host: ENV['ELASTICSEARCH_URL'] || 'http://localhost:9201')
