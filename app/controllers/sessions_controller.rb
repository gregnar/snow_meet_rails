class SessionsController < Devise::SessionsController
  before_filter :fix_params
  def fix_params
    params[:user] = params[:account]
    params[:account][:email] = params[:account][:user_email]
    warden.params[:user] = warden.params[:account]
    warden.params[:account][:email] = warden.params[:account][:user_email]
  end
  skip_before_filter :verify_authenticity_token

  def create
    super do |user|
      if request.format.json?
        data = {
          token: user.authentication_token,
          email: user.email
        }
        render json: data, status: 201 and return
      end
    end
  end


end
