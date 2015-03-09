class Api::V1::GroupsUsersController < ApplicationController

  def create
    GroupsUser.create(decoded_params["groups_user"])
  end

  private

  def decoded_params
    ActiveSupport::JSON.decode(request.body.read)
  end

end