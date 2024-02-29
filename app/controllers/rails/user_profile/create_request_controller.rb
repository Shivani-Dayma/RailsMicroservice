class Rails::UserProfile::CreateRequestController < ApplicationController
  before_action :set_user, only: [:create]
  before_action :set_request,only: [:update]

  def create 
      if @user.present?
        @request=@user.requests.new(create_request_params)
        if @request.save 
           render json: { message: "request created succesfully", request: @request}, status: :ok
        end 
      end
  end

  def update 
      if @request.update(create_request_params)
        render json: { message: "Request updated successfully", request: @request}, status: :ok
      else
        render json: { error: "Failed to update request", errors: @request.errors.full_messages }, status: :unprocessable_entity
      end 
  end

    private
    def set_user 
      @user=User.find(params[:user_id])
    end

    def set_request 
      @request = Request.find_by(id: params[:request_id])
      render json: { error: "Request not found" }, status: :not_found unless @request
    end

    def create_request_params
        params.permit(:reason,:description)
    end
end
