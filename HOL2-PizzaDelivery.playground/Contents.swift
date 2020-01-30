import UIKit


//make a Pizza structure
struct Pizza {
    
    var size: Int = 8
    var hasExtraCheese: Bool = false
    
}


//define a Bakery class
class Bakery {
    
    //incorporate delegation into Bakery
    var delegate:BakeryDelegate?
    
    func preparePizza(){
        
        var pizza = Pizza()
        pizza.size = 8
        pizza.hasExtraCheese = true
        
        //call pizzaWasBaked function on the delegate
        delegate?.pizzaWasBaked(pizza)
        
    }
}

//define a protocol to encapsulate responsibilities
protocol BakeryDelegate {
    
    func pizzaWasBaked(_ pizza : Pizza)
    
}


//Create delegate class
class PizzaShop: BakeryDelegate {
    
    func pizzaWasBaked(_ pizza: Pizza) {
        print("A size \(pizza.size) pizza has been made!")
    }
    
}



let shop = PizzaShop()
let bakery = Bakery()
bakery.delegate = shop
bakery.preparePizza()






