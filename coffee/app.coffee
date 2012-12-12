###
 App module
###

sushi = angular.module('sushi',['sushiFilters','ui'])

sushi.value('ui.config',{})

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