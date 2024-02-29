class Rails::UserProfile::FeedbacksController < ApplicationController
    before_action :set_user, only: [:create]
    def create 
        if @user.present?
          if @user.feedback.present?
            @user.feedback.update(feedback_params)
            render json: @user.feedback, status: :ok
          else
            @user_feedback = @user.build_feedback(feedback_params)
            if @user_feedback.save 
              render json: @user_feedback, status: :ok 
            else
              render json: { message: "Failed to create the feedback" }, status: :unprocessable_entity
            end
          end
        else 
          render json: { message: "User not found" }, status: :unprocessable_entity
        end
      end
      
    private
  
    def set_user
      @user = User.find_by(id: params[:user_id])
    end
  
    def feedback_params
      params.permit(:feedback, :rating)
    end
  end
  