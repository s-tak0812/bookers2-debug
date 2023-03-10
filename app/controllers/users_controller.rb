class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:edit]

  def show
    @user = User.find(params[:id])
    @book = Book.new
    
    to  = Time.current.at_end_of_day
    from  = (to - 6.day).at_beginning_of_day
    @books = @user.books.includes(:favorites).sort_by {|x| x.favorites.where(created_at: from...to).size}.reverse
    
    @today = (@user.books.created_today.count).to_i
    @yesterday = (@user.books.created_yesterday.count).to_i
    @last_7_days = (@user.books.created_last_7_days.count).to_i
    @before_last_week = (@user.books.created_before_last_week.count).to_i

    @books_shown = @user.books.page(params[:page])

  end

  def index
    @users = User.all
    @book = Book.new
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end


  def search
    user = User.find(params[:user_id])
    books = user.books
    @results = books.where(created_at: params[:created_at].to_date.all_day).count
    render :search
  end


  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

end
