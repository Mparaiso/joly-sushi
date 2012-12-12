// Generated by CoffeeScript 1.3.3
/* ProductDetailController.$inject = ['$scope',"$routeParams"]
*/

var ProductCardController, ProductDetailController, ProductListController, ProductTypeController, SushiFilters, sushi,
  __hasProp = {}.hasOwnProperty,
  __indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

ProductCardController = function($scope, $rootScope, $routeParams, $http) {
  /*
          EN : manage customer card
          FR : gère la commande du client
  */

  /*
          EN : initialize sushis model
  */

  var _addToCard, _removeFromCard;
  $http.get('data/data.json').success(function(data) {
    return $rootScope.sushis = data;
  });
  /*
          EN : current card , hold articles and quantity for each article
  */

  $rootScope.card = {};
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
  $rootScope.deleteFromCard = function(sushiId) {
    /*
                EN : delete items by article id 
                We cannot delete directly items from $rootScope.card ,
                instead , we need to delete all sushiId in $rootScope.cardIdList
                then reconstruct the $rootScope.card object
    */

    var removed;
    removed = false;
    removed = _removeFromCard(sushiId);
    if (removed) {
      $rootScope.alert.type = "block";
      $rootScope.alert.message = "Article " + ($rootScope.getFullNameById(sushiId)) + " removed from card";
      $rootScope.alert.show = true;
    }
  };
  _addToCard = function(productId) {
    if ($rootScope.card[productId]) {
      $rootScope.card[productId].quantity = parseInt($rootScope.card[productId].quantity, 10) + 1;
    } else {
      $rootScope.card[productId] = {
        quantity: 1,
        sushi: $rootScope.getSushiById(productId)
      };
    }
  };
  _removeFromCard = function(productId) {
    /* EN : delete product from card
    */

    var copy;
    copy = false;
    if ($rootScope.card[productId]) {
      copy = JSON.parse(JSON.stringify($rootScope.card[productId]));
      delete $rootScope.card[productId];
    }
    return copy;
  };
  $rootScope.addToCard = function(sushiId) {
    /* EN : Add an article to the card
    */

    /* FR : ajouter un article à la carte
    */
    _addToCard(sushiId);
    /*
                EN : recompute  the card 
                FR : recalculer la carte
    */

    $rootScope.alert.type = "success";
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

ProductListController = function($scope, $rootScope, $http, $filter) {
  /* 
      EN : manage product list display 
      FR : gère l'affichage de la liste de produits
  */

  var getSelectedTypes;
  $rootScope.title = "Joly Sushi";
  $scope.orderProp = 'price';
  $rootScope.types = [];
  getSelectedTypes = function() {
    return $rootScope.types.filter(function(type) {
      return type.selected === true;
    }).map(function(type) {
      return type.name;
    });
  };
  $scope.inSelectedTypes = function(item) {
    var _ref;
    if (getSelectedTypes().length <= 0) {
      return true;
    } else {
      if ((_ref = item.type, __indexOf.call(getSelectedTypes(), _ref) >= 0)) {
        return true;
      } else {
        return false;
      }
    }
  };
};

ProductTypeController = function($scope, $rootScope, $http) {
  $http.get("data/types.json").success(function(data) {
    return $rootScope.types = data;
  });
  $scope.getSelectedClass = function(predicate) {
    if (predicate === true) {
      return "label-info";
    } else {

    }
  };
  $scope.clearSelected = function() {
    $rootScope.types.forEach(function(type) {
      return type.selected = false;
    });
  };
  return $scope.addToSelectedTypes = function(typeId) {
    var id, type;
    id = parseInt(typeId, 10);
    type = $rootScope.types.filter(function(type) {
      return type.id === typeId;
    })[0];
    type.selected = type.selected ? false : true;
  };
};

/*
    créer un filter personalisé
*/


SushiFilters = angular.module("SushiFilters", []);

SushiFilters.filter('totalprice', function() {
  return function(sushis) {
    if (sushis == null) {
      sushis = [
        {
          price: 0
        }
      ];
    }
    return sushis.reduce((function(a, b) {
      return a + b.price;
    }), 0);
  };
});

SushiFilters.filter('capitalize', function() {
  return function(word) {
    return word.split(" ").map(function(word) {
      return word[0].toUpperCase() + word.substr(1);
    }).join(" ");
  };
});

/*
 App module
*/


sushi = angular.module('sushi', ['SushiFilters']);

sushi.config([
  '$routeProvider', function($routeProvider) {
    $routeProvider.when("/sushi", {
      templateUrl: 'templates/partials/sushi-list.html',
      controller: ProductListController
    }).when("/sushi/:sushiId", {
      templateUrl: 'templates/partials/sushi-detail.html',
      controller: ProductDetailController
    }).otherwise({
      redirectTo: "sushi"
    });
  }
]);

/*
    @note @angular déclarer un controller dans 
    la définition du module
*/

