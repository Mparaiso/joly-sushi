ProductListController = ($scope)->
    $scope.sushis = 
        [
            {
                "src": "avocat.jpg",
                "name": "avocat",
                "price": 1,
                "type": "sushi"
            },
            {
                "src": "concombre.jpg",
                "name": "concombre",
                "price": 3,
                "type": "sushi"
            },
            {
                "src": "crevette.jpg",
                "name": "crevette",
                "price": 2,
                "type": "sushi"
            },
            {
                "src": "jambon_serano.jpg",
                "name": "jambon serano",
                "price": 4,
                "type": "sushi"
            },
            {
                "type": "maki",
                "price": 2,
                "src": "maki_thon.jpg",
                "name": "thon"
            },
            {
                "type": "maki",
                "price": 4,
                "src": "maki_thon_cuit.jpg",
                "name": "thon cuit"
            }
        ]
    return