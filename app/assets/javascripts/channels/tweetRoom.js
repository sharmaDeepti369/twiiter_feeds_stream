//= require cable
//= require_self
//= require_tree .

(function() {
  this.App || (this.App = {});

  App.cable = ActionCable.createConsumer();

}).call(this);

App.messages = App.cable.subscriptions.create('TweetsChannel', {  
  received: function(data) {
  	$("#alert").show();
  	data.tweets.forEach(function(item){
  		$("#content").append('<a href="'+item['source']+'"><div class="tweet"><div class="profile-img"><img src="'+item['profile_image']+'"/></div><div class = "text">'+item['text']+'</div></div></a>');
	});
	$("#alert").hide();
  }
});

$(document).ready(function(){
	$("#alert").hide();
})