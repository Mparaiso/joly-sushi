ProductListController = ($scope,$http)->

    $scope.title = "Joly Sushi"

    $http.get('data/data.json').success((data)->
        $scope.sushis = data
        $scope.totalPrice = ->
        $scope.sushis.reduce(((a,b)->return a+b.price),0)
    )

    $scope.orderProp = 'price'

    return