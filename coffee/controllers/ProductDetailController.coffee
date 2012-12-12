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