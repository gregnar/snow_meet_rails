class Api::V1::GroupsController < ApplicationController

    before_action :set_group, except: [:index]

    def index
      @groups = Group.all
      render json: @groups
    end

    def show
      render json: @group
    end

    def create
      @group = Group.create(decoded_params)
      render json: @group
    end

    def update
      @group.update_attributes(decoded_params)
      render json: @group
    end

    def destroy
      @group.destroy
      render json: @group
    end


    private

    def set_group
      @group = Group.find(params[:id])
    end

    def decoded_params
      ActiveSupport::JSON.decode(request.body.read)
    end

end
