json.content @message.content
json.date @message.created_at
json.user_name @message.user.nickname
json.user @message.user.id
json.event_host @event.user.id