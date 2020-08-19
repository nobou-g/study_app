// $(document).on('turbolinks:load', function(){
  $(function(){

    function buildHTML(message){
      var html= 
      `<div class="message">
        <div class="message_top">
          <div class="user_name">
          ${message.user_name}
          </div>
          <div class="send_time">
            ${message.created_at}
          </div>
        </div>
        <div class="message_bottom">
          <div class="content">
            ${message.content}
          </div>
        </div>
      </div>`
      return html;
    }
    
    $('#new_message').on('submit', function(e){
      e.preventDefault();
      var formData= new FormData(this);
      var url= $(this).attr('action');
      $.ajax({
        url: url,
        type: "POST",
        data: formData,
        dataType: 'json',
        processData: false,
        contentType: false
      })
        .done(function(data){
          var html= buildHTML(data);
          console.log('a');
          $('.chat_main').append(html);
          $('.text_form').reset();
        })
    })
  });
// });