//
//  product.swift
// lab3

import Foundation

struct Product {
    let id: String
    let name: String
    var price: Double
    let category: Category
    let description: String
    
    enum Category{
        case electronics
        case clothing
        case food
        case books
        case audio
    }
    
    var displayPrice: String{
        return String(format: "$%.2f", price)
    }
    
    init?(id:String, name: String, price: Double, category: Category, description: String){
        guard price > 0 else {
            print("inviled price")
            return nil
        }
        self.id = id
        self.name = name
        self.price = price
        self.category = category
        self.description = description
    }
}
