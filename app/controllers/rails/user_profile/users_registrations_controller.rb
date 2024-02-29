class Rails::UserProfile::UsersRegistrationsController < ApplicationController
    before_action :set_user, only: [:update,:show]

    def create 
      @user=User.new(user_params)
      if @user.save 
        render json: { message: "User created successfully", user: @user }, status: :ok
      else  
        render json: {error: "user is not created"}, status: :unprocessable_entity
      end
    end
  
    def index
       @users=User.all
       render json: @users
    end    
   
    def update
      if @user.present?
        if @user.update(user_params)
          render json: @user
        else
          render json: { error: "User could not be updated" }, status: :unprocessable_entity
        end
      else
        render json: { error: "User not found" }, status: :not_found
      end
    end
  
    def show
      if @user.present? 
        render json: user: @user
      else 
        render json: {error: "user not found"},status: :not_found
      end
    end
  
    private 
  
    def set_user
      @user=User.find(params[:id])
    end
  
    def user_params
      params.permit(:name,:address,:contactNo,:dateOfJoining)
    end
end
