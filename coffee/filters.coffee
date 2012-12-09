###
    créer un filter personalisé
###
angular.module("sushiFilters",[]).filter(
    'totalprice',->
        return (sushis=[{price:0}])->
            sushis.reduce(((a,b)->a+b.price),0)
        
)