class Api::V1::TripsController < ApplicationController

  before_action :set_trip, except: [:index]

  def index
    @trips = Trip.all
    render json: @trips
  end

  def show
    render json: @trip
  end

  def update
    @trip.update_attributes(trip_params)
    render json: @trip
  end

  def delete
    @trip.destroy
    render json: @trip
  end


  private

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:name,
                                 :location,
                                 :departure_time,
                                 :return_time,
                                )
  end


end
