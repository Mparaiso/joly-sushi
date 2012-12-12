ProductTypeController = ($scope,$http)->
    $http.get("data/types.json").success((data)->
        debugger
        console.log(data)
        $scope.types = data;
    )

blop= 5