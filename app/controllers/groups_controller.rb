class GroupsController < ApplicationController
  def index
    @group = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
  end

  def update
    @group = Group.save
    redirect_to 'groups/index'
  end

  def edit
    @group = Group.find(params[:id])
  end

  def destroy
  end
end
