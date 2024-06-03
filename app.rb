require 'sinatra'
require 'json'
require_relative 'services/plant_generator'

before do
  if request.content_type == 'application/json'
    request.body.rewind
    @request_payload = JSON.parse(request.body.read)
  end
end

post '/generate_plant' do
  content_type :json

  name = @request_payload['name']
  description = @request_payload['description']
  plant_type = @request_payload['plant_type']

  plant = PlantGenerator.create(name: name, description: description, plant_type: plant_type)
  plant.to_json
end
