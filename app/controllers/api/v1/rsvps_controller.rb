class Api::V1::RsvpsController < ApplicationController

  before_action :set_rsvp, except: [:index]

  def index
    @rsvps = Rsvp.all
    render json: @rsvps
  end

  def show
    render json: @rsvp
  end

  def create
    @rsvp = Rsvp.create(decoded_params)
    render json: @rsvp
  end

  def update
    @rsvp.update_attributes(decoded_params)
    render json: @rsvp
  end

  def destroy
    @rsvp.destroy
    render json: @rsvp
  end


  private

  def set_rsvp
    @rsvp = Rsvp.find(params[:id])
  end

  def decoded_params
    ActiveSupport::JSON.decode(request.body.read)
  end
end
