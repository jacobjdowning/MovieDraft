// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
	if(!("WebSocket" in window)){
		$('<p>Oh no, you need a browser that supports WebSockets. How about <a href="http://www.google.com/chrome">Google Chrome</a>?</p>').appendTo('#container');		
	}else{
		var highestbidder
		var highname;
		var highestbid = 0;
		var funds = 100;
		var channel = location.pathname
		channel = channel.substr(channel.lastIndexOf("/")+1);
		var kind = $('#draft').data('kind');
		var user = $('#draft').data('user');
		var id = $('#draft').data('userid');
		console.log(user);
		var dispatcher = new WebSocketRails($('#draft').data('uri'));
		var subscription = dispatcher.subscribe(channel);
		var alert = $('#bidder');

		dispatcher.on_open = function(data){
			console.log('connection has been established: ' + data);
		}


		//when someone bids on the current movie
		function bidding(data){
			if(data.bid > highestbid || data.bid == undefined){
				highestbid = data.bid;
				highestbidder = data.id;
				console.log("highestbidder: " + highestbidder);
			}
			var alertStr = "The highest bidder is " + data.sender;
			if(data.bid != undefined){
				alertStr = alertStr.concat(" with $" + data.bid);
			}
			alert.html(alertStr);
		}

		//when a movie is sold
		function sold(data){
			var bought = $('#availMov li:last');
			if(data.winner == id){
				funds = funds - data.bid;
				$('#funds h2').text("$"+funds);
				$('#owned ul').append(
					$('<li/>', {
						html: bought.html()
					})
				)
			}

			//bought.fadeOut();
			bought.remove();
		}


		//bindings for event calls
		subscription.bind('bid', bidding);
		subscription.bind('sold', sold);


		//click events

		$('#sell a').on('click', function(event){
			if (kind != 'FULL'){
				var bid = $('#sell input').val();
				$('#sell input').val('');
			} 
			var bought = $('#availMov li:last');
			
			highestbidder = "";
			highestbid = 0;


			var data = {
				winner: highestbidder,
				winnername: highname,
				movie: bought.data('id'),
				bid: bid,
				league: channel
			}


			subscription.trigger('sold', data);

			return false;
		});

		if (kind != 'INPERSON'){
			$('#bid a').on('click', function(event){
				if(kind == 'Full'){
					var bid=$('#bid input').val();
					console.log ('bid assigned: ' + bid);
				}

				console.log('clicked and bid: ' + bid);
				
				var data = {
					sender: user,
					id: id
				}
				if (kind == 'FUll' && bid>highestbid){
					data.bid = bid;
				}
				else if (bid == undefined){
					subscription.trigger('bid', data);
				}
				else{
					window.alert("Bid was not higher than current bid");
				}
				return false;
			});
		}

	}

});