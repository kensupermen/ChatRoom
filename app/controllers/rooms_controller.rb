class RoomsController < ApplicationController

  def create
    @room = Room.new room_params
    if @room.save
      redirect_to @room
    else
      redirect_back fallback_location: root_path
    end
  end

  def show
    @room = Room.find_by(id: params[:id])
    @messages = @room.messages
  end

  private 

  def room_params
    params.require(:room).permit(:name, :messages_attributes => [:username, :body])
  end

end
