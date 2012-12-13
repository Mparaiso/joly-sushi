ProductListController = ($scope,$rootScope,$http,$filter)->
    ### 
        EN : manage product list display 
        FR : gère l'affichage de la liste de produits 
    ###
    $rootScope.title = "Joly Sushi"
    $scope.orderProp = 'type'
    $rootScope.types = []

    getSelectedTypes = ->
        return $rootScope.types.filter((type)->type.selected == true).map((type)->type.name)

    $scope.inSelectedTypes = (item)->
        if getSelectedTypes().length <= 0 
            return true
        else
            if (item.type in getSelectedTypes())
                return true
            else
                return false

    return