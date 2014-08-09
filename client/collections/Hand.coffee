class window.Hand extends Backbone.Collection

  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop()).last()
    if @scores()[0] > 21 then @.trigger( 'playerLost', @ )
    if @scores()[0] == 21 then @.trigger( 'playerWon', @ )

  stand: (self)->
    self.model.winner()

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.

    hasAce = @reduce (memo, card) ->
      memo or card.get('value') is 1
    , false

    Aces = @filter ( c ) ->
      if c.get 'revealed' and c.get 'value' == 1 then c
    numAces = Aces.length
    console.log Aces
    score = @reduce (score, card) ->
      score + if card.get 'revealed' then card.get 'rank' else 0
    , 0
    if hasAce and score + 10 <= 21 then [score + 10] else [score]


