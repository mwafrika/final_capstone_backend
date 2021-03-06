class BikesController < ApplicationController
  before_action :authenticate_user!, only: %i[create update destroy new]
  before_action :set_bike, only: %i[update destroy]

  include Response
  def index
    @bike = Bike.all.map { |bike| BikeSerializer.new(bike).serializable_hash[:data][:attributes] }
    json_response(@bike)
  end

  def show
    @bike = Bike.find(params[:id])
    json_response(BikeSerializer.new(@bike).serializable_hash[:data][:attributes])
  end

  def destroy
    @bike.destroy
    head :no_content
  end

  def create
    @bike = current_user.bikes.create!(bike_params)

    if @bike.save
      json_response(BikeSerializer.new(@bike).serializable_hash[:data][:attributes], :created)
    else
      json_response(@bike.errors, :unprocessable_entity)
    end
  end

  def latest
    @post = current_user.bikes.find(params[:id])
    json_response(BikeSerializer.new(@post).serializable_hash[:data][:attributes])
  end

  private

  def set_bike
    @bike = current_user.bikes.find(params[:id])
  end

  def bike_params
    params.require(:bike).permit(:make, :model, :description, :image,
                                 :is_available, :price, user_id: current_user.id)
  end
end
