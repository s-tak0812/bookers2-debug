class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def join
    @group = Group.find(params[:group_id])
    @group.users << current_user
    redirect_to  groups_path
  end

  def leave
    @group = Group.find(params[:group_id])
    @group.users.destroy(current_user)
    redirect_to  groups_path
  end


  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    if @group.save
      @group.users << current_user
      redirect_to '/groups/index'
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to '/groups/index'
    else
      render :edit
    end
  end

  def destroy
    @group = Group.find(params[:id])
    if @group.owner_id == current_user.id
      @group.destroy
      redirect_to '/groups/index'
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :introduction, :image)
  end

  def ensure_correct_user
    @group = Group.find(params[:id])
    unless @group.owner_id == current_user.id
      redirect_to groups_path
    end
  end

end
