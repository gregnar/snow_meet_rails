class Api::V1::SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def create
    respond_to do |format|
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        user.generate_token! unless user.authentication_token
        format.json do
          Rails.logger.info("got user #{user}, send json #{user.to_json}")
          render json: user.as_json(:only => [:id, :first_name, :email, :authentication_token])
        end
      end
    end
  end

  def index
    if user = User.find_by(authentication_token: params[:token])
      render json: user.as_json(:only => [:id, :first_name, :email, :authentication_token])
    else
      render json: {error: "not logged in"}, status: :unauthorized
    end
  end
end
