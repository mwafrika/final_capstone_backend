class ReservationsController < ApplicationController
  before_action :authenticate_user!, only: %i[create update destroy new index]
  before_action :current_item, only: %i[show update destroy]

  include Response
  def index
    lists = current_user.reservations.includes(:bike).map do |item|
      {
        id: item.id,
        city: item.city,
        date_reserved: item.date_reserved,
        reservation_number: item.reservation_number,
        bike: item.bike,
      }
    end
    render json: { status: 'success', message: 'Loaded success', data: lists }, status: :ok
  end

  def show
    if current_item.nil?
      render json: { status: 'no content', message: 'Not able to get', data: {} }, status: :ok
    else
      render json: { status: 'success', message: 'load success', data: current_item }, status: :ok
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
    @current_item = current_user.reservations.find(params[:id]) if current_user.reservations.exists?(params[:id])
  end

  def allowed_params
    params.require(:reservation).permit(:date_reserved, :city, :bike_id, user_id: current_user.id)
  end
end
