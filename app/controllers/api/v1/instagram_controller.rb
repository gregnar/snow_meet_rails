class Api::V1::InstagramController < ApplicationController

  def index
    @instagrams = Instagram.all
    render json: @instagrams
  end
end