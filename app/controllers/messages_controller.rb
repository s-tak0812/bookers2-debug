class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    if Entry.where(user_id: current_user.id, room_id: params[:message, :room_id]).present?
      @message = Message.new(message_params)
      if @message.save
        redirect_to 'rooms/#{@message.room_id}'
      end
    else
      redirect_to 'rooms/index'
    end

  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to request.referer
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :body, :room_id).merge(user_id:current_user.id)
  end


end
