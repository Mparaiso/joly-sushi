module("ProductListController",{
    setup:function(){
        //@note @angular effectuer des tests unitaires avec angular
        this.scope= {};
        this.productListController = new ProductListController(this.scope);
        // browser().navigateTo("../index.htm");
    }
});

test("ProductListController",function(){
    equal(this.scope.sushis.length,6,"sushis list has 6 elements");
    equal(this.scope.sushis[0].type,"sushi","the first element is a sushi");
});

