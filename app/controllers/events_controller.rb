class EventsController < ApplicationController
  before_action :set_params, only: [:show, :edit, :update, :destroy]
  
  def index
    events= Event.includes(:user)
    @events= events.reverse()
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
    if @event.update(event_params)
      redirect_to @event
    else
      render :edit
      alert('失敗しました')
    end
  end

  def show
  end

  def destroy
    if @event.destroy
      redirect_to root_path
    else
      render @event
    end
  end

  def timeline
    followings= current_user.followings
    following_events= []
    followings.each do |following|
      events =following.events
      events.each do |event|
        following_events << event
      end
    end
    @following_events= following_events.reverse()
  end

  private
  def event_params
    params.require(:event).permit(:title, :discription, :image, :place, :date).merge(user_id: current_user.id)
  end

  def set_params
    @event= Event.find(params[:id])
  end
end
