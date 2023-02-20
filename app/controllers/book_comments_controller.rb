class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:id])
    @comment = Book_comment.new(comment_params)
    if @comment.save
      redirect_to book_path(@book)
    else
      render book_path(@book)
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @comment = Book_comment.find(params[:id])
    @comment.destroy
    redirect_to book_path(@book)
  end


  private

  def comment_params
    params.require(:book_comments).permit(:comment)
  end

end
