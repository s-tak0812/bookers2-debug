class RoomsController < ApplicationController
  before_action :authenticate_user!

  def create
    @room = Room.create
    entry1 = Entry.create(room_id: @room_id, user_id: current_user.id)
    entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id))
    redirect_to '/rooms/#{@room.id}'
  end

  def show
    @room = Room.find(params[:id])
    if Entry.where(user_id: current_user.id).present?
      @messages = @room.messages.all
      @message = Message.new
      @entries = @room.entries
    else
      redirect_to '/rooms/index'
    end
  end

  def index
    @rooms = Room.all
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to '/rooms/index'
  end


end
