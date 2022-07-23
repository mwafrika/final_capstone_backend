class ReservationsController < ApplicationController
  include Response
  def index
    @data = Reservation.all
    json_response(@data)
  end

  def destroy
    @item = Reservation.find(params[:id])
    @item.destroy
    head :no_content
  end


  def create
    @reserve = current_user.reservations.create!(allowed_params)

    if @reserve.save
      json_response(@reserve, :created)
    else
      json_response(@reserve.errors, :unprocessable_entity)
    end
  end

  def allowed_params
    params.permit(:reservation_number, :date_reserved,
                  :location_id, :bike_id, user_id: current_user.id)
  end
end
