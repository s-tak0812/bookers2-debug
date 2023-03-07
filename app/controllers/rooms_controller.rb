class RoomsController < ApplicationController
  def destroy
    room = Room.find(params[:ld])
    redirect_to entries_path
  end

end
