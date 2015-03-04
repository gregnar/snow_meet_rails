class SessionsController < ApplicationController
  def index
    if current_user
      render json: current_user.as_json.merge(logged_in: true)
    else
      render json: {logged_in: false}
    end
  end

  def create
    sleep(2)
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to "http://localhost:4200/users/#{user.id}"
    else
      flash[:alert] = "you failed to log in"
      render :new
    end
  end

  def new
  end
end
