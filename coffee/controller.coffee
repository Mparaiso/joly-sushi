ProductListController = ($scope,$http)->

    $scope.title = "Joly Sushi"

    $http.get('data/data.json').success((data)->
        $scope.sushis = data
        $scope.totalPrice = ->
            $scope.sushis.reduce(((a,b)->return a+b.price),0)
    )

    $scope.orderProp = 'price'

    return

ProductDetailController = ($scope,$routeParams,$http)->
    $scope.sushiId = $routeParams["sushiId"]
    $http.get('data/data.json').success((datas)->
        for data in datas
            if data.id is parseInt($scope.sushiId,10)
                $scope.sushi = data
                return
        return
    )
    return

### ProductDetailController.$inject = ['$scope',"$routeParams"] ###