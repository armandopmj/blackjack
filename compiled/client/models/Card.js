// Generated by CoffeeScript 1.7.1
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.Card = (function(_super) {
    __extends(Card, _super);

    function Card() {
      return Card.__super__.constructor.apply(this, arguments);
    }

    Card.prototype.initialize = function(params) {
      var rankName, suitName;
      suitName = ['spades', 'diamonds', 'clubs', 'hearts'][params.suit];
      rankName = (function() {
        switch (params.rank) {
          case 0:
            return 'king';
          case 1:
            return 'ace';
          case 11:
            return 'jack';
          case 12:
            return 'queen';
          default:
            return params.rank;
        }
      })();
      return this.set({
        revealed: true,
        value: !params.rank || 10 < params.rank ? 10 : params.rank,
        suitName: suitName,
        rankName: rankName,
        image: "" + rankName + "-" + suitName + ".png"
      });
    };

    Card.prototype.flip = function() {
      this.set('revealed', !this.get('revealed'));
      return this;
    };

    return Card;

  })(Backbone.Model);

}).call(this);

//# sourceMappingURL=Card.map