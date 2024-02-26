# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# data we will recieve from the url
# {
#   "rows": [
#     {
#       "row_idx": 0,
#       "row": {
#         "Prompt": "realistic car 3 d render sci - fi car and sci - fi robotic factory structure in the coronation of napoleon painting and digital billboard with point cloud in the middle, unreal engine 5, keyshot, octane, artstation trending, ultra high detail, ultra realistic, cinematic, 8 k, 1 6 k, in style of zaha hadid, in style of nanospace michael menzelincev, in style of lee souder, in plastic, dark atmosphere, tilt shift, depth of field,"
#       },
#       "truncated_cells": []
#     }
#   ]
# }

# data we will put in the elasticsearch model in this format
# {
#   "_index": "user_prompts",
#   "_id": "0",
#   "_version": 1,
#   "_seq_no": 0,
#   "_primary_term": 1,
#   "found": true,
#   "_source": {
#     "prompt": "realistic car 3 d render sci - fi car and sci - fi robotic factory structure in the coronation of napoleon painting and digital billboard with point cloud in the middle, unreal engine 5, keyshot, octane, artstation trending, ultra high detail, ultra realistic, cinematic, 8 k, 1 6 k, in style of zaha hadid, in style of nanospace michael menzelincev, in style of lee souder, in plastic, dark atmosphere, tilt shift, depth of field,"
#   }
# }

require 'uri'
require 'net/http'
require 'json'

def index_document(document_id, data)
  uri = URI.parse("http://localhost:9201/user_prompts/_doc/#{document_id}")
  http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Put.new(uri.request_uri)
  request['Content-Type'] = 'application/json'
  request.body = data.to_json

  http.request(request)
end

uri = URI.parse('https://datasets-server.huggingface.co/rows?dataset=Gustavosta%2FStable-Diffusion-Prompts&config=default&split=train&offset=0&length=100')
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true

request = Net::HTTP::Get.new(uri.request_uri)

response = http.request(request)

json_reponse = JSON.parse(response.body)
json_reponse['rows'].each do |row|
  index_document(row['row_idx'], { prompt: row['row']['Prompt'] })
end
