ProductListController = ($scope,$rootScope,$http,$filter)->
    ### gère l'affichage de la liste de produits ###
    $rootScope.title = "Joly Sushi"
    $scope.orderProp = 'price'

ProductDetailController = ($rootScope,$scope,$routeParams,$http)->
    ### gère l'affichage de vue de détail ###
    $scope.sushiId = $routeParams["sushiId"]
    $scope.sushi = $rootScope.sushis.filter((data)->data.id==parseInt($scope.sushiId,10))[0]
    return

### ProductDetailController.$inject = ['$scope',"$routeParams"] ###

ProductCardController = ($scope,$rootScope,$routeParams,$http)->

    $rootScope.card = {}

    $rootScope.cardIdList = []


    $http.get('data/data.json').success((data)->
        $rootScope.sushis = data
    )

    $rootScope.getSushiById = (id)->
        ### obtenir un sushi par son id ###
        for sushi in $rootScope.sushis
            return sushi if sushi.id == id


    getCard =  ->
        ### obtenir la carte courante ###
        return $rootScope.cardIdList.reduce(((a,b)->
            if b of a
                a[b].quantity +=1
            else
                a[b] = {quantity:1,sushi:$rootScope.getSushiById(b)}
            return a
        ),{})

    $rootScope.addToCard = (sushiId)->
        ### ajouter un article à la carte ###
        $rootScope.cardIdList.push(sushiId)
        $rootScope.card = getCard()

    $rootScope.getFullName = (sushi)->
        return "#{sushi.type} #{sushi.name}"

    $scope.getTotalPrice = ->
        total = 0
        card = $rootScope.card
        for own prop of card
            article = card[prop]
            total+= article.quantity * article.sushi.price
        return total

    return
    



