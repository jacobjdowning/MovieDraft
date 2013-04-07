// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
	if(!("WebSocket" in window)){
		$('<p>Oh no, you need a browser that supports WebSockets. How about <a href="http://www.google.com/chrome">Google Chrome</a>?</p>').appendTo('#container');		
	}else{
		//this user has websockets

		connect();

		function connect(){
			try{
				var socket;
				var host = "ws://" +  window.location.host + "/drafts/" + league_id + "/socket";
				socket = new WebSocket(host);

				socket.onopen = function(){
					message('Socket Status: ' + socket.readyState);
				}

				socket.onmessage = function(){
					message('bid happend');
				}

				socket.onclose = function(){
					message('Socket Status: ' + socket.readyState);
				}
	

			}catch(exception){
				console.log('Error: ' + exception);
			}
			
			function message(msg){
				$('#bidder').innerHTML(msg);
			}
		}
	}

});