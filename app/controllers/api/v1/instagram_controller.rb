class Api::V1::InstagramController < ApplicationController

  def index
    trip = Trip.find(@trip.id)
    @instagrams = trip.instagrams
    render json: @instagrams
  end
end