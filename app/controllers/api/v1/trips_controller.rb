class Api::V1::TripsController < ApplicationController

  before_action :set_trip, except: [:index, :create]

  def index
    @trips = Trip.all
    render json: @trips
  end

  def show
    render json: @trip
  end

  def create
    binding.pry
    @trip = Trip.create(decoded_params['trip'])
    render json: @trip
  end

  def update
    @trip.update_attributes(decoded_params)
    render json: @trip
  end

  def destroy
    @trip.destroy
    render json: @trip
  end


  private

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def decoded_params
    ActiveSupport::JSON.decode(request.body.read)
  end

end
