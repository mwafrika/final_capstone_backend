class ReservationsController < ApplicationController
  include Response
  def index
    @data = Reservation.all
    json_response(@data)
  end
end
