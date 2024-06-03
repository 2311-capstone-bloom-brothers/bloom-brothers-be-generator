require 'sinatra'
require 'json'
require_relative 'services/plant_generator'

set :port, ENV['PORT'] || 4567

before do
  if request.content_type == 'application/json'
    @request_payload = JSON.parse(request.body.read) rescue {}
  end
end

post '/generate_plant' do
  content_type :json

  begin
    name = @request_payload['name']
    description = @request_payload['description']
    plant_type = @request_payload['plant_type']

    plant = PlantGenerator.create(name: name, description: description, plant_type: plant_type)
    plant.to_json
  rescue => e
    status 500
    { error: e.message }.to_json
  end
end

get '/' do
  'App is running'
end
