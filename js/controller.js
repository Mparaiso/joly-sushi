// Generated by CoffeeScript 1.3.3
var ProductListController;

ProductListController = function($scope, $http) {
  $scope.title = "Joly Sushi";
  $http.get('data/data.json').success(function(data) {
    $scope.sushis = data;
    $scope.totalPrice = function() {};
    return $scope.sushis.reduce((function(a, b) {
      return a + b.price;
    }), 0);
  });
  $scope.orderProp = 'price';
};
