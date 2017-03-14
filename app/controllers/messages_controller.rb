class MessagesController < ApplicationController

  def create
    set_room
    @message = @room.messages.build message_params
    if @message.save
      redirect_to @room
    end
  end

  private
  def set_room
    @room = Room.find params[:room_id]
  end

  def message_params
    params.require(:message).permit(:body, :username)
  end

end
