class SessionsController < Devise::SessionsController

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
