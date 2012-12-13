ProductTypeController = ($scope,$rootScope,$http)->


    $scope.getSelectedClass = (predicate)->
        if predicate == true
            return "label-info"
        else
            return

    $scope.clearSelected =->
        $rootScope.types.forEach((type)->type.selected = false )
        return

    $scope.addToSelectedTypes = (typeId)->
        id = parseInt(typeId,10)
        type = $rootScope.types.filter((type)->type.id == typeId)[0]
        type.selected = if type.selected then false else true
        return
