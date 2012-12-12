###
 App module
###

sushi = angular.module('sushi',['SushiFilters'])


sushi.config(['$routeProvider',($routeProvider)->
    $routeProvider
    .when("/sushi",{
        templateUrl:'templates/partials/sushi-list.html',
        controller:ProductListController

    })
    .when("/sushi/:sushiId",{
        templateUrl:'templates/partials/sushi-detail.html',
        controller:ProductDetailController
    })
    .otherwise({
        redirectTo:"sushi"
    })
    return
])

###
    @note @angular déclarer un controller dans 
    la définition du module
###
# sushi.controller "ProductCardController",($rootScope,$scope,$routeParams,$http)-> #definition du controller
    