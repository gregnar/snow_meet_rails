class Api::V1::UsersController < ApplicationController
  before_action :set_user, except: [:index]
  def show
    render json: @user
  end

  def update
    @user.update_attributes(user_params)
  end

  def delete
    @user.destroy
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name,
                                 :last_name,
                                 :twitter_name,
                                 :insta_name,
                                 :email
                                )
  end

end
