class LocationsController < ApplicationController
    before_action :set_location, only: %i[show update destroy]

    include Response
    def index
        @locations = Location.all
        json_response(@locations)
    end

    def show
        json_response(@location)
    end
    
    def create
        @location = Location.create!(location_params)
        json_response(@location, :created)
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

    def location_params
        params.permit(:full_address)
    end
end
