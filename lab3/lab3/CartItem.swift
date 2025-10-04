//
//  CartItem.swift
//  lab3

struct CartItem{
    var product: Product
    var quantity: Int
    
    var subtotal: Double{
        return product.price * Double(quantity)
    }
    
    mutating func updateQuantity(_ newQuantity: Int){
        guard newQuantity>0 else{
            print("inviled quantity")
            return
        }
        quantity = newQuantity
    }
    
    mutating func increaseQuantity(by amount: Int){
        guard amount>0 else{
            print("inviled quantity")
            return
        }
        quantity += amount
    }
    
    init(product: Product, quantity: Int){
        guard quantity>0 else{
            print("Invalid quantity")
                    self.product = product
                    self.quantity = 1
                    return
        }
        self.product = product
        self.quantity = quantity
    }
}
