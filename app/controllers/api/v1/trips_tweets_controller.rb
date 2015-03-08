class Api::V1::TripTweetsController < ApplicationController
  def index
    trip = Trip.find(params[:id])
    trip.update_tweets
    @tweets = trip.tweets
    render json: @tweets
  end
end
