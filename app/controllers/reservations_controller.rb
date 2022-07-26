class ReservationsController < ApplicationController
  before_action :authenticate_user!, only: %i[create update destroy new]
  before_action :current_item, only: %i[show update destroy]

  include Response
  def index
    @data = Reservation.all
    json_response(@data)
  end

  def show
    if current_item.nil?
      json_response({ error: 'Item doesn\'t exist' }, :no_content)
    else
      json_response(current_item)
    end
  end

  def destroy
    @item = current_item
    if @item.nil?
      json_response({ error: 'Item doesn\'t exist' }, :no_content)
    else
      @item.destroy
      json_response({ message: 'Item deleted successfully' }, :no_content)
    end
  end

  def create
    @reserve = current_user.reservations.create!(allowed_params)

    if @reserve.save
      json_response(@reserve, :created)
    else
      json_response(@reserve.errors, :unprocessable_entity)
    end
  end

  private

  def current_item
    @current_item = Reservation.find(params[:id]) if Reservation.exists?(params[:id])
  end

  def allowed_params
    params.permit(:reservation_number, :date_reserved, :location_id, :bike_id,
                  user_id: current_user.id)
  end
end
