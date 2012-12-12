###
    créer un filter personalisé
###
SushiFilters = angular.module("SushiFilters",[])
SushiFilters.filter(
    'totalprice',->
        return (sushis=[{price:0}])->
            sushis.reduce(((a,b)->a+b.price),0)      
)
SushiFilters.filter(
    'capitalize',->
        return (word)->
            word.split(" ").map((word)->word[0].toUpperCase()+word.substr(1)).join(" ")
)