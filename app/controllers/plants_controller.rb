class PlantsController < ApplicationController
  def generate
    name = params[:name]
    description = params[:description]
    plant_type = params[:plant_type]

    plant = PlantGenerator.create(name: name, description: description, plant_type: plant_type)
    render json: plant
  end
end
