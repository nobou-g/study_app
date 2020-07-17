class EventsController < ApplicationController
  before_action :event_params, only: :create
  before_action :set_params, only: [:show, :edit, :destroy]
  def index
    @events= Event.includes(:user)
  end

  def new
    @event= Event.new
  end

  def create
    @event= Event.new(event_params)
    if @event.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

  private
  def event_params
    params.require(:event).permit(:title, :discription, :image, :place, :date).merge(user_id: current_user.id)
  end

  def set_params
    @event= Event.find(params[:id])
  end
end
