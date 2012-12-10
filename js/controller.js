// Generated by CoffeeScript 1.3.3
/*
    coffee/controller.coffee
*/

var ProductCardController, ProductDetailController, ProductListController,
  __hasProp = {}.hasOwnProperty;

ProductListController = function($scope, $rootScope, $http, $filter) {
  /* 
      EN : manage product list display 
      FR : gère l'affichage de la liste de produits
  */
  $rootScope.title = "Joly Sushi";
  $scope.orderProp = 'price';
};

ProductDetailController = function($rootScope, $scope, $routeParams, $http) {
  /* 
      EN : manage detailed product view display
      FR : gère l'affichage de vue de détail
  */
  $scope.sushiId = $routeParams["sushiId"];
  /* 
      EN : holds current sushi model
  */

  $scope.sushi = $rootScope.sushis.filter(function(data) {
    return data.id === parseInt($scope.sushiId, 10);
  })[0];
};

/* ProductDetailController.$inject = ['$scope',"$routeParams"]
*/


ProductCardController = function($scope, $rootScope, $routeParams, $http) {
  /*
          EN : manage customer card
          FR : gère la commande du client
  */

  /* 
      EN : initialize sushis model
  */

  var getCard;
  $http.get('data/data.json').success(function(data) {
    return $rootScope.sushis = data;
  });
  /*
          EN : current card , hold articles and quantity for each article
  */

  $rootScope.card = {};
  /* 
      EN : helper to calculate quantity for each article , hold article ids
  */

  $rootScope.cardIdList = [];
  /*
          EN : alert object model to display messages
  */

  $rootScope.alert = {
    type: 'info',
    message: null,
    show: false
  };
  $rootScope.hideAlert = function() {
    /* 
        EN : hide alert
        FR : fermer le popup d'alerte
    */
    $rootScope.alert.show = false;
  };
  $rootScope.getSushiById = function(id) {
    /* 
        EN : get sushi object by id
        FR : obtenir un sushi par son id
    */

    var sushi, _i, _len, _ref;
    _ref = $rootScope.sushis;
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      sushi = _ref[_i];
      if (sushi.id === id) {
        return sushi;
      }
    }
  };
  getCard = function() {
    /*
                EN : get current card 
                FR : obtenir la carte courante
    */
    return $rootScope.cardIdList.reduce((function(a, b) {
      if (b in a) {
        a[b].quantity += 1;
      } else {
        a[b] = {
          quantity: 1,
          sushi: $rootScope.getSushiById(b)
        };
      }
      return a;
    }), {});
  };
  $rootScope.deleteFromCard = function(sushiId) {
    var item, nameProp, _ref, _results;
    _ref = $rootScope.card;
    _results = [];
    for (nameProp in _ref) {
      item = _ref[nameProp];
      if (item.sushi.id === sushiId) {
        delete $rootScope.card[nameProp];
        $rootScope.alert.message = "Article " + ($rootScope.getFullNameById(sushiId)) + " removed from card";
        _results.push($rootScope.alert.show = true);
      } else {
        _results.push(void 0);
      }
    }
    return _results;
  };
  $rootScope.addToCard = function(sushiId) {
    /* EN : Add an article to the card
    */

    /* FR : ajouter un article à la carte
    */
    $rootScope.cardIdList.push(sushiId);
    /* 
        EN : recompute  the card 
        FR : recalculer la carte
    */

    $rootScope.card = getCard();
    $rootScope.alert.message = "Article  " + ($rootScope.getFullNameById(sushiId)) + " added to your card";
    return $rootScope.alert.show = true;
  };
  $rootScope.getFullNameById = function(id) {
    /* 
        EN : get sushi type + name by sushi's id
    */
    return $rootScope.getFullName($rootScope.getSushiById(id));
  };
  $rootScope.getFullName = function(sushi) {
    /*
                EN : get full name of sushi's object
    */
    return "" + sushi.type + " " + sushi.name;
  };
  $scope.getTotalPrice = function() {
    /* 
        EN : get total amount of the current card
    */

    var article, card, prop, total;
    total = 0;
    card = $rootScope.card;
    for (prop in card) {
      if (!__hasProp.call(card, prop)) continue;
      article = card[prop];
      total += article.quantity * article.sushi.price;
    }
    return total;
  };
};
