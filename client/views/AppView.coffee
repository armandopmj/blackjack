class window.AppView extends Backbone.View

  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '
  events:
    "click .hit-button": -> @model.get('playerHand').hit()
    "click .stand-button": -> @model.get('playerHand').stand(@)

  initialize: ->
    @render()
    @model.get('playerHand').on( 'playerLost', => alert("YOU LOST... Loser!!") )
    @model.get('playerHand').on( 'playerWon', => alert("YOU WON!!") )
    @model.on( 'playerLost', => alert("YOU LOST... Loser!!") )
    @model.on( 'playerWon', => alert("YOU WON!!") )
    # @model.listenTo( @model.get 'playerHand', 'playerLost', => alert("YOU LOST... Loser!!") )

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
