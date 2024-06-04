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
    },

    flower2: {
      stemWidth: [0.45, 0.45, 0.45, 0.45, 0.45],
      path: [
        [[0.5, 0, 0], [0.5, 0, 0], [0.5, 0, 0.85], [0.1, 0.75, 0], [0.1, 0.75, 0], [0.1, 0.75, 0], [0.1, 0.75, 0], [0.1, 0.75, 0]],
        [[0.5, 0, 0], [0.5, 0, 0], [0.5, 0, 0.85], [0.1, 1.85, 0], [0.1, 1.85, 0], [0.1, 1.85, 0], [0.1, 1.85, 0], [0.1, 1.85, 0]],
        [[0.5, 0, 0], [0.5, 0, 0], [0.5, 0, 0.85], [0.1, 7.85, 0], [0.1, 7.85, 0], [0.1, 7.85, 0], [0.1, 7.85, 0], [0.1, 7.85, 0]],
        [[0.5, 0, 0], [0.5, 0, 0], [0.5, 0, 0.65], [0.1, 5.5, 0.95], [0.1, 9.5, 1.45], [0.1, 10.5, 1.15], [0.1, 10.5, 0], [0.1, 8.5, -0.25]],
        [[0.5, 0, 0], [0.5, 0, 0], [0.5, 0, 0.65], [0.1, 3.5, 0.95], [0.1, 7.5, 1.45], [0.1, 8.5, 1.15], [0.1, 8.5, 0], [0.1, 6.5, -0.25]]
      ],
      qc1: [8, 9, 8, 11, 9],
      qc2: [0, 10, 20, 40, 15],
      qc3: [2, 6, 10, 12, 5],
      qc4: [7, 7, 11, 15, 10],
      noiseScale: [0.192, 0.297, 0.463, 0.820, 5.175],
      noiseImpactX: [13, 13, 12, 10, 11],
      noiseImpactY: [-30, -39, -31, -36, -36],
      noiseImpactZ: [16, 18, 17, 16, 17],
      rotIncX: [0.829, 0.732, 0.722, 0.815, 0.608],
      rotIncY: [0.019, 0.023, 0.023, 0.020, 0.022],
      rotIncZ: [0, 0, 0, 0, 0],
      depth: [3.727, 2.981, 3.527, 3.724, 3.573],
      numLeaves: [117, 98, 112, 103, 100],
      scaleX: [0.1, 0.2, 0.2, 0.25, 0.25],
      scaleY: [0.1, 0.2, 0.2, 0.25, 0.25],
      scaleZ: [0.1, 0.2, 0.2, 0.25, 0.25]
    }
  }

  def self.create(name: '', description: '', plant_type: nil, position: '')
    plant_type ||= PLANT_ATTRIBUTES.keys.sample
    plant_type = plant_type.to_sym

    attributes = PLANT_ATTRIBUTES[plant_type]

    raise ArgumentError, "Invalid plant type: #{plant_type}" unless attributes

    bloom_color = generate_bloom_color

    plant = {
      name: name || '',
      description: description || '',
      plant_type: plant_type,
      position: position,
      lifespan: 86400000,
      planted: Time.now.to_i,
      phases: {
        stem: {
          color: [[0, 255, 0], [0, 255, 0], [0, 255, 0], [0, 255, 0], [0, 255, 0]], # Green RGB color for stem
          stemWidth: attributes[:stemWidth],
          path: attributes[:path]
        }
      }
    }

    if plant_type == :flower1
      plant[:phases][:bloom] = {
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
    else
      plant[:phases][:bloom] = {
        qc1: generate_random_values(attributes[:qc1]),
        qc2: generate_random_values(attributes[:qc2]),
        qc3: generate_random_values(attributes[:qc3]),
        qc4: generate_random_values(attributes[:qc4]),
        noiseScale: generate_random_values(attributes[:noiseScale]),
        noiseImpactX: generate_random_values(attributes[:noiseImpactX]),
        noiseImpactY: generate_random_values(attributes[:noiseImpactY]),
        noiseImpactZ: generate_random_values(attributes[:noiseImpactZ]),
        rotIncX: generate_random_values(attributes[:rotIncX]),
        rotIncY: generate_random_values(attributes[:rotIncY]),
        rotIncZ: generate_random_values(attributes[:rotIncZ]),
        depth: generate_random_values(attributes[:depth]),
        numLeaves: generate_random_values(attributes[:numLeaves]),
        scaleX: generate_random_values(attributes[:scaleX]),
        scaleY: generate_random_values(attributes[:scaleY]),
        scaleZ: generate_random_values(attributes[:scaleZ])
      }
    end

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
