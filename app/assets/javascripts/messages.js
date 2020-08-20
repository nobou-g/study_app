$(function(){

  function buildHTML(message){
    if (message.user === message.event_host) {
      var html= 
      `<div class="message">
        <div class="message_top">
          <div class="user_name">
          ${message.user_name}
          </div>
          <div class="host_mark">
            主催者
          </div>
          <div class="send_time">
            ${message.date}
          </div>
        </div>
        <div class="message_bottom">
          <div class="content">
            ${message.content}
          </div>
        </div>
      </div>`
      return html;
    } else {
      var html= 
      `<div class="message">
        <div class="message_top">
          <div class="user_name">
          ${message.user_name}
          </div>
          <div class="send_time">
            ${message.date}
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
  }


  $('#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url= $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(message){
      console.log(buildHTML(message));
      $('.chat-main').append(buildHTML(message));
      $('.text_form').val('');
      $('.send_btn').prop('disabled', true)
      $('.chat-main').animate({ scrollTop: $('.chat-main')[0].scrollHeight});
    })
    .fail(function(){
      alert('エラー');
    })
  })
});

// $(function(){

//   function buildHTML(message){
//     var html= 
//     `<div class="message">
//       <div class="message_top">
//         <div class="user_name">
//         ${message.user_name}
//         </div>
//         <div class="send_time">
//           ${message.created_at}
//         </div>
//       </div>
//       <div class="message_bottom">
//         <div class="content">
//           ${message.content}
//         </div>
//       </div>
//     </div>`
//     return html;
//   }
  
//   $('#new_message').on('submit', function(e){
//     e.preventDefault();
//     var formData= new FormData(this);
//     var url= $(this).attr('action');
//     console.log(this);
//     $.ajax({
//       url: url,
//       type: "POST",
//       data: formData,
//       dataType: 'json',
//       processData: false,
//       contentType: false
//     })
//       .done(function(data){
//         var html= buildHTML(data);
//         $('.chat_main').append(html);
//         $('.text_form').reset();
//       })
//   })
// });