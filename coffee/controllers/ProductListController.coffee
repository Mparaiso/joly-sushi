ProductListController = ($scope,$rootScope,$http,$filter)->
    ### 
        EN : manage product list display 
        FR : gère l'affichage de la liste de produits 
    ###
    $rootScope.title = "Joly Sushi"
    $scope.orderProp = 'price'
    return