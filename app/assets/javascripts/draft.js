// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
	if(!("WebSocket" in window)){
		$('<p>Oh no, you need a browser that supports WebSockets. How about <a href="http://www.google.com/chrome">Google Chrome</a>?</p>').appendTo('#container');		
	}else{
		//this user has websockets
		var highestbidder
		var highestbid
		var funds
		var channel = location.pathname
		channel = channel.substr(channel.lastIndexOf("/")+1);
		console.log("channel: " + channel);

		var dispatcher = new WebSocketRails('localhost:3000/websocket')

		dispatcher.on_open = function(data){
			console.log('connection has been established: ' + data);
		}

	}

});