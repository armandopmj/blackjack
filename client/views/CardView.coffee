class window.CardView extends Backbone.View

  className: 'card'

  # template: _.template '<%= rankName %> of <%= suitName %>'
  template: _.template '<img src=img/cards/<%= image %> width="100%" >'
  # <img src="smiley.gif" alt="Smiley face">
  # _.template('<td>(<%= artist %>)</td><td><%= title %></td>')

  initialize: ->
    @model.on 'change', => @render
    @render()

  render: ->
    @$el.children().detach().end().html
    @$el.html @template @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'
