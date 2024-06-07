require 'spec_helper'

RSpec.describe 'Plant Generator API' do
  it 'generates a plant with given parameters' do
    post '/generate_plant', {
      name: 'Rose',
      description: 'A beautiful rose',
      plant_type: 'flower1',
      position: 'a1'
    }.to_json, { 'CONTENT_TYPE' => 'application/json' }

    expect(last_response).to be_ok
    response = JSON.parse(last_response.body)

    expect(response['name']).to eq('Rose')
    expect(response['description']).to eq('A beautiful rose')
    expect(response['plant_type']).to eq('flower1')
    expect(response['position']).to eq('a1')
    expect(response['phases']).to have_key('stem')
    expect(response['phases']).to have_key('bloom')
  end

  it 'generates the second variety of plant with given parameters' do
    post '/generate_plant', {
      name: 'Rose',
      description: 'A beautiful rose',
      plant_type: 'flower2',
      position: 'a1'
    }.to_json, { 'CONTENT_TYPE' => 'application/json' }

    expect(last_response).to be_ok
    response = JSON.parse(last_response.body)

    expect(response['name']).to eq('Rose')
    expect(response['description']).to eq('A beautiful rose')
    expect(response['position']).to eq('a1')
    expect(response['plant_type']).to eq('flower2')
    expect(response['phases']).to have_key('stem')
    expect(response['phases']).to have_key('bloom')
  end

  it 'generates a plant with default parameters if none are given' do
    post '/generate_plant', {}.to_json, { 'CONTENT_TYPE' => 'application/json' }

    expect(last_response).to be_ok
    response = JSON.parse(last_response.body)

    expect(response['name']).to eq('')
    expect(response['description']).to eq('')
    expect(response['position']).to eq(nil)
    expect(response['plant_type']).not_to be_nil
    expect(response['phases']).to have_key('stem')
    expect(response['phases']).to have_key('bloom')
  end

  describe '.generate_bloom_color' do
    it 'generates a valid RGB color array' do
      color = PlantGenerator.generate_bloom_color

      expect(color).to be_an(Array)
      expect(color.size).to eq(3)
      expect(color).to all(be_between(0, 255))

      total_color_value = color.sum
      expect(total_color_value).to be > 200
    end
  end

  describe '.generate_random_values' do
    it 'generates random values within the specified ranges' do
      array = [0.2, 0.4, 0.6, 0.8, 1.0]
      random_values = PlantGenerator.generate_random_values(array)

      expect(random_values.size).to be <= array.size
      random_values.each_with_index do |value, index|
        if index == 0
          expect(value).to eq(array[index])
        else
          min_val = [array[index - 1], array[index]].min
          max_val = [array[index - 1], array[index]].max
          expect(value).to be_between(min_val, max_val)
        end
      end
    end
  end
end
