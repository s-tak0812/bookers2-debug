class BookCommentsController < ApplicationController
  def create

  end

  def destroy

  end


  private

  def comment_params
    params.require(:book_comments).permit(:comment)
  end

end
