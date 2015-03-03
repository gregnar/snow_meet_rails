class Api::V1::UsersController < ApplicationController
  before_action :set_user, except: [:index]

  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user
  end

  def create
    @user = User.create(decoded_params)
    render json: @user
  end

  def update
    @user.update_attributes(decoded_params)
    render json: @user
  end

  def destroy
    @user.destroy
    render json: @user
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def decoded_params
    ActiveSupport::JSON.decode(request.body.read)
  end
end
