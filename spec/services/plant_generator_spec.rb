require_relative '../../app/services/plant_generator'

RSpec.describe PlantGenerator do
  describe '.create' do
    it 'generates a valid plant' do
      plant = PlantGenerator.create(name: 'My Plant', description: 'A beautiful plant', plant_type: 'flower1')

      expect(plant).to be_a(Hash)
      expect(plant[:name]).to eq('My Plant')
      expect(plant[:description]).to eq('A beautiful plant')
      expect(plant[:plant_type]).to eq(:flower1)
      expect(plant[:lifespan]).to be_an(Integer)
      expect(plant[:planted]).to be_an(Integer)
      expect(plant[:phases]).to be_a(Hash)
      expect(plant[:phases][:stem]).to be_a(Hash)
      expect(plant[:phases][:bloom]).to be_a(Hash)
    end

    it 'raises an error for an invalid plant type' do
      expect {
        PlantGenerator.create(name: 'My Plant', description: 'A beautiful plant', plant_type: 'invalid_type')
      }.to raise_error(ArgumentError, 'Invalid plant type: invalid_type')
    end
  end

  describe '.generate_random_values' do
    it 'generates random values within the given range' do
      array = [0.1, 0.5, 1.0, 1.5, 2]
      random_values = PlantGenerator.generate_random_values(array)

      expect(random_values.size).to eq(5)
      expect(random_values).to all(be_between(0.1, 2.0))
    end
  end

  describe '.generate_bloom_color' do
    it 'generates a valid bloom color' do
      bloom_color = PlantGenerator.generate_bloom_color

      expect(bloom_color).to be_an(Array)
      expect(bloom_color.size).to eq(3)
      expect(bloom_color).to all(be_between(0, 255))
      expect(bloom_color.sum).to be > 200
    end
  end
end
