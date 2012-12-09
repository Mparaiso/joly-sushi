ProductListController = ($scope,$http,$filter)->
    ### gère l'affichage de la liste de produits ###
    $scope.title = "Joly Sushi"

    $http.get('data/data.json').success((data)->
        $scope.sushis = data
        $scope.totalPrice = ->
            sushis = $filter('filter')($scope.sushis,$scope.query)
            console.log( sushis)
            return sushis.reduce(((a,b)->return a+b.price),0)
    )

    $scope.orderProp = 'price'

    return

ProductDetailController = ($scope,$routeParams,$http)->
    ### gère l'affichage de vue de détail ###
    $scope.sushiId = $routeParams["sushiId"]
    $http.get('data/data.json').success((datas)->
        ### si success , récuperer le produit dans la liste des produits 
        selon l'id du produit ###
        $scope.sushi = datas.filter((data)->data.id==parseInt($scope.sushiId,10))[0]
        return
    )
    return

### ProductDetailController.$inject = ['$scope',"$routeParams"] ###