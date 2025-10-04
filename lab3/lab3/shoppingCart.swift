//
//  shoppingCart.swift
// lab3

import Foundation
enum DiscountType {
    case percentage(Double)
    case fixedAmount(Double)
    case buyXGetY(buy: Int, get: Int)
}

class ShoppingCart {
    private(set) var items: [CartItem] = []
    var discountCode: String?
    var discount: DiscountType?
    
    init() {
        self.items = []
        self.discountCode = nil
    }
    
    func addItem(product: Product, quantity: Int = 1) {
        if let index = items.firstIndex(where: { $0.product.id == product.id }) {
            items[index].increaseQuantity(by: quantity)
        } else {
            let newItem = CartItem(product: product, quantity: quantity)
            items.append(newItem)
        }
    }

    
    func removeItem(productID: String){
        items.removeAll() { $0.product.id == productID }
    }
    
    func updateItemQuantity(productID: String, quantity: Int){
        guard let index = items.firstIndex(where: {$0.product.id == productID}) else{
            print("Item not found")
            return
        }
        if quantity == 0 {
            removeItem(productID: productID)
        }else{
            items[index].updateQuantity(quantity)
        }
    }
    
    func clearCart(){
        items.removeAll()
    }
    
    var subtotal: Double {
        return items.reduce(0) { $0 + $1.subtotal}
    }
    
//    var discountAmount: Double {
//        guard let code = discountCode else{
//            print("no such discount code")
//            return 0
//        }
//        switch code.uppercased(){
//        case "SAVE10": return subtotal * 0.1
//        case "SAVE20": return subtotal * 0.2
//        default : return 0
//        }
//    }

    //bonus task 2
    var discountAmount: Double {
            guard let discount = discount else { return 0 }
            
            switch discount {
            case .percentage(let percent):
                return subtotal * percent
                
            case .fixedAmount(let amount):
                return min(amount, subtotal)
                
            case .buyXGetY(let buy, let get):
                let totalItems = items.reduce(0) { $0 + $1.quantity }
                guard totalItems > 0 else { return 0 }
                let freeItems = totalItems / (buy + get) * get
                let averagePrice = subtotal / Double(totalItems)
                return averagePrice * Double(freeItems)
            }
        }
    
    var total: Double {
        subtotal - discountAmount
    }
    
    var itemQuantity: Int {
        items.reduce(0) { $0 + $1.quantity}
    }
    
    var isEmpty: Bool {
        items.isEmpty
    }
    
    private func applyDiscountCode() {
            guard let code = discountCode?.uppercased() else {
                discount = nil
                return
            }
            
            switch code {
            case "SAVE10":
                discount = .percentage(0.10)
            case "SAVE20":
                discount = .percentage(0.20)
            case "MINUS5":
                discount = .fixedAmount(5)
            case "BUY2GET1":
                discount = .buyXGetY(buy: 2, get: 1)
            default:
                discount = nil
                print("Unknown discount code: \(code)")
            }
        }
}

