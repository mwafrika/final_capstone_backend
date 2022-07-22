class CarsController < ApplicationController
  before_action :authenticate_user!, only: %i[create update destroy]
  before_action :set_car, only: %i[show update destroy]

  include Response
  def index
    @cars = Car.all
    json_response(@cars)
  end

  def show
    json_response(@car)
  end

  def create
    @car = current_user.cars.create!(car_params)

    if @car.save
      json_response(@car, :created)
    else
      json_response(@car.errors, :unprocessable_entity)
    end
  end

  def latest
    @post = Car.last
    json_response(CarSerializer.new(@post).serializable_hash[:data][:attributes])
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:make, :model, :description, :image, :number_of_passenger,
                                :is_available, :price_per_hour, :price_per_day, user_id: current_user.id)
  end
end
