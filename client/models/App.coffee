#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

  winner: ->
    playerFinalScore = (@get 'playerHand').scores()
    (@get 'dealerHand').models[0].flip()

    (@get 'dealerHand').hit() while (@get 'dealerHand').scores() < 17

    houseFinalScore = (@get 'dealerHand').scores()

    if houseFinalScore > 21 then @.trigger( 'playerWon', @ )
    else if playerFinalScore > houseFinalScore then @.trigger( 'playerWon', @ )
    else @.trigger( 'playerLost', @ )

