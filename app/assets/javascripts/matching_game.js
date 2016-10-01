var matching_array = ['A','A','B','B','C','C','D','D','E','E','F','F','G','G','H','H','I','I','J','J','K','K','L','L'];
var matching_values = [];
var matching_card_ids = [];
var cards_flipped = 0;

Array.prototype.matching_card_shuffle = function(){
    var i = this.length, j, temp;
    while(--i > 0){
        j = Math.floor(Math.random() * (i+1));
        temp = this[j];
        this[j] = this[i];
        this[i] = temp;
    }
}
function newBoard(){
	cards_flipped = 0;
	var output = '';
    matching_array.matching_card_shuffle();
	for(var i = 0; i < matching_array.length; i++){
		output += '<div id="card_'+i+'" onclick="matchingFlipcard(this,\''+matching_array[i]+'\')"></div>';
	}
	document.getElementById('board').innerHTML = output;
}
function matchingFlipcard(card,val){
	if(card.innerHTML == "" && matching_values.length < 2){
		card.style.background = 'lightblue';
		card.innerHTML = val;
		if(matching_values.length == 0){
			matching_values.push(val);
			matching_card_ids.push(card.id);
		} else if(matching_values.length == 1){
			matching_values.push(val);
			matching_card_ids.push(card.id);
			if(matching_values[0] == matching_values[1]){
				cards_flipped += 2;
				// Clear both arrays
				matching_values = [];
            	matching_card_ids = [];
				// Is the board cleared?
				if(cards_flipped == matching_array.length){
					alert("Great job!");
					document.getElementById('board').innerHTML = "";
					newBoard();
				}
			} else {
				function flipBack(){
				    // Flip the cards back over
				    var card_1 = document.getElementById(matching_card_ids[0]);
				    var card_2 = document.getElementById(matching_card_ids[1]);
				    card_1.style.background = "url('1.jpg') no-repeat";
            	    card_1.innerHTML = "";
				    card_2.style.background = "url('1.jpg') no-repeat";
            	    card_2.innerHTML = "";
				    // Clear both arrays
				    matching_values = [];
            	    matching_card_ids = [];
				}
				setTimeout(flipBack, 500);
			}
		}
	}
}

window.onload = function() {
  newBoard();
};
