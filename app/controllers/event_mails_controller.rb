class EventMailsController < ApplicationController
  before_action :authenticate_user!


  def new
    @event_mail = EventMail.new
  end

  def create
    @event_mail = EventMail.new(event_mail_params)
    if @event_mail.save
      redirect_to :show
    else
      render :new
    end
  end

  def show
    @event_mail = EventMail.find(params[:id])
  end

  def destroy
    @event_mail = EventMail.find(params[:id])
    @event_mail.destroy
    redirect_to groups_path
  end

  private

  def event_mail_params
    params.require(:event_mail).permit(:title, :body)
  end

end
