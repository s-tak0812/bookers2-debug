class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @model = params[:model]
    @word = params[:word]
    @seach_part = params[:seach_part]

    if @model == "user"
      @results = User.search_for(@word, @seach_part)
    else
      @results = Book.search_for(@word, @seach_part)
    end
  end

  def search_tag
    @vol = params[:vol]
    @results = Book.search_tag_for(@vol)
  end


end
