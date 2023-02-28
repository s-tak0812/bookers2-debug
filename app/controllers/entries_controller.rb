class EntriesController < ApplicationController
  def index
    @entries = Entry.all
  end

  def destroy
    redirect_to entries_path
  end
end
