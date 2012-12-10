###
    coffee/controller.coffee
###
ProductListController = ($scope,$rootScope,$http,$filter)->
    ### 
        EN : manage product list display 
        FR : gère l'affichage de la liste de produits 
    ###
    $rootScope.title = "Joly Sushi"
    $scope.orderProp = 'price'
    return

ProductDetailController = ($rootScope,$scope,$routeParams,$http)->
    ### 
        EN : manage detailed product view display
        FR : gère l'affichage de vue de détail 
    ###
    $scope.sushiId = $routeParams["sushiId"]
    ### 
        EN : holds current sushi model
    ###
    $scope.sushi = $rootScope.sushis.filter((data)->data.id==parseInt($scope.sushiId,10))[0]
    return

### ProductDetailController.$inject = ['$scope',"$routeParams"] ###

ProductCardController = ($scope,$rootScope,$routeParams,$http)->
    ###
        EN : manage customer card
        FR : gère la commande du client
    ###

    ### 
        EN : initialize sushis model
    ###
    $http.get('data/data.json').success((data)->
        $rootScope.sushis = data
    )

    ###
        EN : current card , hold articles and quantity for each article
    ###
    $rootScope.card = {}

    ### 
        EN : helper to calculate quantity for each article , hold article ids
    ###
    $rootScope.cardIdList = []

    ###
        EN : alert object model to display messages
    ###
    $rootScope.alert = {
        type:'info',
        message:null,
        show:false
    }

    $rootScope.hideAlert = ()->
        ### 
            EN : hide alert
            FR : fermer le popup d'alerte
        ###
        $rootScope.alert.show = false
        return

    $rootScope.getSushiById = (id)->
        ### 
            EN : get sushi object by id
            FR : obtenir un sushi par son id 
        ###
        for sushi in $rootScope.sushis
            return sushi if sushi.id == id
        return


    getCard = ->
        ###
            EN : get current card 
            FR : obtenir la carte courante 
        ###
        return $rootScope.cardIdList.reduce(((a,b)->
            if b of a
                a[b].quantity +=1
            else
                a[b] = {quantity:1,sushi:$rootScope.getSushiById(b)}
            return a
        ),{})

    $rootScope.addToCard = (sushiId)->
        ### EN : Add an article to the card ###
        ### FR : ajouter un article à la carte ###
        $rootScope.cardIdList.push(sushiId)
        ### 
            EN : recompute  the card 
            FR : recalculer la carte 
        ###
        $rootScope.card = getCard()
        $rootScope.alert.message = "Article  #{$rootScope.getFullNameById(sushiId)} added to your card"
        $rootScope.alert.show= true

    $rootScope.getFullNameById=(id)->
        ### 
            EN : get sushi type + name by sushi's id
        ###
        return $rootScope.getFullName($rootScope.getSushiById(id))

    $rootScope.getFullName = (sushi)->
        ###
            EN : get full name of sushi's object
        ###
        return "#{sushi.type} #{sushi.name}"

    $scope.getTotalPrice = ->
        ### 
            EN : get total amount of the current card 
        ###
        total = 0
        card = $rootScope.card
        for own prop of card
            article = card[prop]
            total+= article.quantity * article.sushi.price
        return total

    return
    



