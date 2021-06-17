import consumer from "./consumer"

var chat = consumer.subscriptions.create({channel:"ChatChannel",chat:location.pathname}, {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log('conect');
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.log('disconect');
  },

  // received(data) {
  //   // Called when there's incoming data on the websocket for this channel
  //   console.log(data);
  //   console.log('datadatadatadatadatadatadatadatakkkkkkkkkkkkkkkkkkkkkk');
  //   $("#chats").append(
  //   `<div class=' row my-3' >\
  //   <div class=' col-sm-4 offset-sm-4'>\
  //     <div class='card border border-success rounded'>\
  //       <div class='card-body'>\
  //         <p class='haiku__text'><span>${data.chat1}</span></p>\
  //         <p class='haiku__text'><span>${data.chat2}</span></p>\
  //         <p class='haiku__text'><span>${data.chat3}</span></p>\
  //       </div>\
  //       <div class='card-footer border-success'>\
  //         ${data.user_id}\
  //       </div>\
  //     </div>\
  //   </div>\
  //   </div>`
  //   );
  // },

  // chat_js: function(data){
  //   // console.log(data);
  //   return this.perform('chat_rb',{chat1:data.chat1,chat2:data.chat2,chat3:data.chat3,user_id:data.user_id});
  // }
});
$(document).on("turbolinks:load",function(){
  $("#btn_chat").on('click',function(){
    var x = [];
    x.chat1 = $('input[name="chat_comment[chat1]"]').val();
    x.chat2 = $('input[name="chat_comment[chat2]"]').val();
    x.chat3 = $('input[name="chat_comment[chat3]"]').val();
    x.user_id = $('input[name="chat_comment[user_id]"]').val();
    chat.chat_js(x);
    console.log(location.pathname);
  });

  chat = consumer.subscriptions.create({channel:"ChatChannel",chat:location.pathname},{
    received(data) {
      // Called when there's incoming data on the websocket for this channel
      console.log(data);
      console.log('datadatadatadatadatadatadatadata');
      $("#chats").append(
      `<div class=' row my-3' >\
      <div class=' col-sm-4 offset-sm-4'>\
        <div class='card border border-success rounded'>\
          <div class='card-body'>\
            <p class='haiku__text'><span>${data.chat1}</span></p>\
            <p class='haiku__text'><span>${data.chat2}</span></p>\
            <p class='haiku__text'><span>${data.chat3}</span></p>\
          </div>\
          <div class='card-footer border-success'>\
            ${data.user_id}\
          </div>\
        </div>\
      </div>\
      </div>`
      );
    },
    chat_js: function(data){
      // console.log(data);
      return this.perform('chat_rb',{chat1:data.chat1,chat2:data.chat2,chat3:data.chat3,user_id:data.user_id});
    }
  });
  console.log('consumer');
});

$(document).on("turbolinks:request-start",function(){
  chat.unsubscribe();
  console.log('unsubscribed');

});