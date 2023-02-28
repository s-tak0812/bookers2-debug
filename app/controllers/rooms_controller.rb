class RoomsController < ApplicationController
  def destroy
    redirect_to entries_path
  end

end
