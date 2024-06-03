module PlantGenerator
  PLANT_ATTRIBUTES = {
    flower1: {
      stemWidth: [0.4, 0.4, 0.4, 0.4, 0.4],
      path: [
        [[0.5, 0, 0], [0.5, 0, 0], [0.5, 0, 0.8], [0.1, 0.7, 0], [0.1, 0.7, 0], [0.1, 0.7, 0], [0.1, 0.7, 0], [0.1, 0.7, 0]],
        [[0.5, 0, 0], [0.5, 0, 0], [0.5, 0, 0.8], [0.1, 1.76, 0], [0.1, 1.76, 0], [0.1, 1.76, 0], [0.1, 1.76, 0], [0.1, 1.76, 0]],
        [[0.5, 0, 0], [0.5, 0, 0], [0.5, 0, 0.8], [0.1, 7, 0], [0.1, 7, 0], [0.1, 7, 0], [0.1, 7, 0], [0.1, 7, 0]],
        [[0.5, 0, 0], [0.5, 0, 0], [0.5, 0, 0.56], [0.1, 4.5, 0.88], [0.1, 7.46, 1.42], [0.1, 8.34, 1.08], [0.1, 8.42, 0], [0.1, 7.08, -0.26]],
        [[0.5, 0, 0], [0.5, 0, 0], [0.5, 0, 0.56], [0.1, 2.5, 0.88], [0.1, 5.46, 1.42], [0.1, 6.34, 1.08], [0.1, 6.42, 0], [0.1, 5.08, -0.26]]
      ],
      petalCount: [1, 1, 1, 1, 1],
      recRadius: [0.16, 0.17, 0.2, 0.2, 0.11],
      radiusTop: [0.3, 0.52, 1.09, 1.09, 0.2],
      radiusBottom: [0.3, 0.52, 1.09, 1.09, 0.2],
      noiseScale: [0.46, 1.95, 1.03, 1.31, 0.01],
      noiseImpactX: [0.46, 0.5, 0.5, 0.5, 0.39],
      noiseImpactY: [0.34, 0.5, 0.94, 2.63, 2.63],
      noiseImpactZ: [0, 0, 1, 0.94, 0.94],
      height: [0.16, 0.04, 0.04, 0.04, 0.01],
      radialSegments: [100, 100, 100, 11.88, 11.88],
      rotation: [[0, 0, 0], [0.03, 0, 0], [-0.38, 0.07, -0.43], [-0.38, 0.07, 0.07], [-0.71, 0.07, -0.43]]
    }
  }

  def self.create(name: '', description: '', plant_type: nil)
    plant_type ||= PLANT_ATTRIBUTES.keys.sample
    plant_type = plant_type.to_sym

    attributes = PLANT_ATTRIBUTES[plant_type]

    raise ArgumentError, "Invalid plant type: #{plant_type}" unless attributes

    bloom_color = generate_bloom_color

    plant = {
      name: name,
      description: description,
      plant_type: plant_type,
      lifespan: 86400000,
      planted: Time.now.to_i,
      phases: {
        stem: {
          color: [[0, 255, 0], [0, 255, 0], [0, 255, 0], [0, 255, 0], [0, 255, 0]], # Green RGB color for stem
          stemWidth: attributes[:stemWidth],
          path: attributes[:path]
        },
        bloom: {
          color: [bloom_color, bloom_color, bloom_color, bloom_color, bloom_color],
          petalCount: attributes[:petalCount],
          recRadius: generate_random_values(attributes[:recRadius]),
          radiusTop: generate_random_values(attributes[:radiusTop]),
          radiusBottom: generate_random_values(attributes[:radiusBottom]),
          noiseScale: generate_random_values(attributes[:noiseScale]),
          noiseImpactX: generate_random_values(attributes[:noiseImpactX]),
          noiseImpactY: generate_random_values(attributes[:noiseImpactY]),
          noiseImpactZ: generate_random_values(attributes[:noiseImpactZ]),
          height: generate_random_values(attributes[:height]),
          radialSegments: generate_random_values(attributes[:radialSegments]),
          rotation: attributes[:rotation]
        }
      }
    }

    plant
  end

  def self.generate_random_values(array)
    random_values = [array[0]]
    (1...array.size).each do |i|
      a, b = array[i - 1], array[i]
      if a && b
        if a <= b
          random_values << rand(a..b).round(2)
        else
          random_values << rand(b..a).round(2)
        end
      else
        random_values << (a || b)
      end
    end
    random_values.pop if random_values.size > 5
    random_values
  end

  def self.generate_bloom_color
    red = rand(0..255)
    green = rand(0..255)
    blue = rand(0..255)

    while red + green + blue <= 200
      red = rand(0..255)
      green = rand(0..255)
      blue = rand(0..255)
    end

    [red, green, blue]
  end
end
