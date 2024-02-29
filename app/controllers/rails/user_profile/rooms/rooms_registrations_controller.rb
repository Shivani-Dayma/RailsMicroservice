class Rails::UserProfile::Rooms::RoomsRegistrationsController < ApplicationController
  before_action :find_user,only: [:show]

  def index
    @rooms = Room.all
  end

  def show
    @room = @user.room
    if @room.present?
      render json: @room,status: :ok
    else  
      render json: {message: "room not found"}, status: :unprocessable_entity
    end
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      render json: @room, status: :created
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    head :no_content
  end

  private

  def room_params
    params.require(:room).permit(:roomType, :category, :fees,:description,:user_id)
  end

  def find_user
    @user=User.find(params[:user_id])
  end
end
