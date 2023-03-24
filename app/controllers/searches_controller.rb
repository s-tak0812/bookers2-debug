class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @model = params[:model]
    @word = params[:word]
    @seach_part = params[:seach_part]

    if @model == "user"
      @results = User.search_for(@word, @seach_part)
    elsif @model == "book"
      @results = Book.search_for(@word, @seach_part)
    elsif @model == "tag"
      @results = Tag.search_books_for(@word, @seach_part)
    end
  end

end
