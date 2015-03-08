class Api::V1::InstagramsController < ApplicationController

  before_action :set_instagram, only: [:show]

  def index
    @instagrams = trip.instagrams
    render json: @instagrams
  end

  def show
    render json: @instagram
  end

  private

  def set_instagram
    @instagram = Instagram.find(params[:id])
  end

end
