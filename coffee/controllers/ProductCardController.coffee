

### ProductDetailController.$inject = ['$scope',"$routeParams"] ###

ProductCardController = ($scope,$rootScope,$routeParams,$http)->
    ###
        EN : manage customer card
        FR : gère la commande du client
    ###
    $http.get('data/data.json').success((data)->
        $rootScope.sushis = data
    )

    ###
        EN : current card , hold articles and quantity for each article
    ###
    $rootScope.card = {}

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


    $rootScope.deleteFromCard = (sushiId)->
        ###
            EN : delete items by article id 
            We cannot delete directly items from $rootScope.card ,
            instead , we need to delete all sushiId in $rootScope.cardIdList
            then reconstruct the $rootScope.card object
        ###
        removed = false
        removed = _removeFromCard(sushiId)
        if removed
            $rootScope.alert.type= "block"
            $rootScope.alert.message = "Article #{$rootScope.getFullNameById(sushiId)} removed from card"
            $rootScope.alert.show = true
        return

    _addToCard=(productId)->
        if $rootScope.card[productId]
            $rootScope.card[productId].quantity  = parseInt($rootScope.card[productId].quantity,10)+1
        else
            $rootScope.card[productId] = {
                quantity:1,
                sushi:$rootScope.getSushiById(productId)
            }
        return

    _removeFromCard=(productId)->
        ### EN : delete product from card ###
        copy = false
        if $rootScope.card[productId]
            copy = JSON.parse(JSON.stringify($rootScope.card[productId]))
            delete $rootScope.card[productId]
        return copy


    $rootScope.addToCard = (sushiId)->
        ### EN : Add an article to the card ###
        ### FR : ajouter un article à la carte ###
        _addToCard(sushiId)
        ###
            EN : recompute  the card 
            FR : recalculer la carte 
        ###
        $rootScope.alert.type= "success"
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
    



