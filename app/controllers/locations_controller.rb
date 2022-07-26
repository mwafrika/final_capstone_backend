class LocationsController < ApplicationController
  before_action :set_location, only: %i[show update destroy]
  before_action :authenticate_user!, only: %i[create update destroy new]

  include Response

  def index
    @locations = Location.all
    json_response(@locations)
  end

  def show
    json_response(@location)
  end

  def create
    @location = current_user.locations.create!(location_params)
    if @location.save
      json_response(@location, :created)
    else
      json_response(@location.errors, :unprocessable_entity)
    end
  end

  def update
    @location.update(location_params)
    head :no_content
  end

  def destroy
    @location.destroy
    head :no_content
  end

  def set_location
    @location = Location.find(params[:id])
  end

  private

  def location_params
    params.permit(:full_address, user_id: current_user.id)
  end
end
