class Rails::UserProfile::UploadDocumentsController < ApplicationController
  before_action :find_user
  def create
    if params[:image].present?
      if @user.present?
        @user_files=[]
        params[:image].each do |image|
          @user_file = @user.user_files.new
          @user_file.image.attach(image)
          if @user_file.save
            @user_files << rails_blob_url(@user_file.image)
          end
        end
      render json: { success: true, message: "Documents uploaded succesfully",user_file: @user_files },status: :created
    else
      render json: { message: "Invalid user id" }, status: :unprocessable_entity   
    end
    else
      render json: { image: [] }, status: :ok
    end
  end

  private
  def find_user
    @user = User.find_by(id: params[:user_id])
  end

  def user_file_params
    params.permit(:user_id, image: [])
  end
end