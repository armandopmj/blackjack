class window.AppView extends Backbone.View

  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '
  events:
    "click .hit-button": -> @model.get('playerHand').hit()
    "click .stand-button": -> @model.get('playerHand').stand(@)

  playerLost: -> setTimeout( (-> alert("YOU LOST... Loser!!")), 200)
  playerWon: -> setTimeout( (-> alert("YOU WON!!")), 200)

  initialize: ->
    @render()
    @model.get('playerHand').on( 'playerLost', @playerLost )
    @model.get('playerHand').on( 'playerWon', @playerWon )
    @model.on( 'playerLost', @playerLost )
    @model.on( 'playerWon', @playerWon )
    # @model.listenTo( @model.get 'playerHand', 'playerLost', => alert("YOU LOST... Loser!!") )

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
