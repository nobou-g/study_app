class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :event_messages

  def event_messages
    event_messages=[]
    event_ids=[]
    current_user.messages.each do |message|
      unless event_ids.include?(message.event_id)
        event_ids << message.event_id
        event_messages << message
      end
    end
    return event_messages.reverse()
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :affiliation, :introduction])
  end
end