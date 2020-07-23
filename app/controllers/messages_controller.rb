class MessagesController < ApplicationController
  before_action :set_event
  def index
    @message= Message.new
    @messages= @event.messages.includes(:user)
  end

  def create
    @message= @event.messages.new(message_params)
    if @message.save!
      redirect_to event_messages_path(@event)
    else
      render :index
      
    end
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end

  def set_event
    @event= Event.find(params[:event_id])
  end
end
