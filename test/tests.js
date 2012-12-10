module("ProductListController",{
    setup:function(){
        //@note @angular effectuer des tests unitaires avec angular
        this.scope= {};
        this.rootScope={};
        this.routrParams={};
        this.http = {
            get:function(){
                return {

                };
            }
        };
        this.productListController = new ProductListController(this.scope);
        this.productCardController = new ProductCardController(this.scope,
            this.rootScope,this.routeParams,this.http);
        // browser().navigateTo("../index.htm");
    }
});

test("ProductListController",function(){
    equal(this.scope.sushis.length,6,"sushis list has 6 elements");
    equal(this.scope.sushis[0].type,"sushi","the first element is a sushi");
});

test('ProductCardController',function(){
    ok(true,'fake test');
});