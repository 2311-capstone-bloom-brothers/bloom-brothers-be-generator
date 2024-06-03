require 'spec_helper'

RSpec.describe 'Plant Generator API' do
  it 'generates a plant with given parameters' do
    post '/generate_plant', {
      name: 'Rose',
      description: 'A beautiful rose',
      plant_type: 'flower1'
    }.to_json, { 'CONTENT_TYPE' => 'application/json' }

    expect(last_response).to be_ok
    response = JSON.parse(last_response.body)

    expect(response['name']).to eq('Rose')
    expect(response['description']).to eq('A beautiful rose')
    expect(response['plant_type']).to eq('flower1')
    expect(response['phases']).to have_key('stem')
    expect(response['phases']).to have_key('bloom')
  end

  it 'generates a plant with default parameters if none are given' do
    post '/generate_plant', {}.to_json, { 'CONTENT_TYPE' => 'application/json' }

    expect(last_response).to be_ok
    response = JSON.parse(last_response.body)

    expect(response['name']).to eq('')
    expect(response['description']).to eq('')
    expect(response['plant_type']).not_to be_nil
    expect(response['phases']).to have_key('stem')
    expect(response['phases']).to have_key('bloom')
  end
end
