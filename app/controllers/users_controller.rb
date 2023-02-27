class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:edit]

  def show
    @user = User.find(params[:id])
    @book = Book.new
    to  = Time.current.at_end_of_day
    from  = (to - 6.day).at_beginning_of_day
    @books = @user.books.includes(:favorites).sort_by {|x| x.favorites.where(created_at: from...to).size}.reverse

    current_user_entry = Entry.where(user_id: current_user.id)
    user_entry = Entry.where(user_id: @user.id)
    if @user.id != current_user.id
      current_user_entry.each do |cu|
        user_entry.each do |u|
          if cu.room_id == u.room_id then
            @is_room = true
            @room_number = cu.room_id
          end
        end
      end

      if @is_room != true
        @room = Room.new
        @entry = Entry.new
      end

    end
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
