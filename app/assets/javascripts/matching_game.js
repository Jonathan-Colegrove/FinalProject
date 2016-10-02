$(document).ready(function() {
  Array.prototype.shuffle = function() {
    var i = this.length, j, temp;
    while(--i > 0){
      j = Math.floor(Math.random() * (i+1));
      temp = this[j];
      this[j] = this[i];
      this[i] = temp;
    }
  }

  function play() {
    // Get the possible cards
    var possible_cards = $('#invisible').data('rubyvar');

    // matching array = each card twice, & then shuffled
    var matching_array = [].concat(possible_cards).concat(possible_cards);
    matching_array.shuffle();

    // Initialize counters
    var flipped_values = [];
    var flipped_cards  = [];
    var cards_flipped  = 0;

    // Append the cards to the board
    matching_array.forEach(function(card_value, index) {
      $("#board").append('<div class="card" data-card-value="' + card_value + '"></div>');
    })

    // Handle the clicks
    $('.card').on('click', function() {
      var card = $(this)

      // This card is already flipped, so don't process it
      if (card.hasClass("card-flipped")) {
        return;
      }

      // get the card's value
      var card_value = card.data("card-value")

      // Flip it over & set the card's HTML to it's 'value' attribute
      card.addClass("card-flipped");
      card.html(card_value)

      // Save away the card and it's value
      flipped_values.push(card_value);
      flipped_cards.push(card);

      // We don't have two cards flipped yet, so we are done with
      // this click
      if (flipped_cards.length < 2) {
        return;
      }

      // If the two cards are the same
      if (flipped_values[0] == flipped_values[1]) {
        // Increment our counters
        cards_flipped += 2;

        // Clear the flipped arrays indicating
        // we are starting a new guess
        flipped_values = [];
        flipped_cards = [];

        // Is the board cleared?
        if (cards_flipped == matching_array.length) {
          alert("Great job!");
          $("#board").html("")
        }
      } else {
        // This wasn't a match
        setTimeout(function() {
          // Iterate the cards and reset them
          flipped_cards.forEach(function(card) {
            $(card).removeClass("card-flipped")
            $(card).html("")
          })

          // Clear the flipped arrays indicating
          // we are starting a new guess
          flipped_values = [];
          flipped_cards = [];
        }, 500);
      }
    })
  }

  play()
})
