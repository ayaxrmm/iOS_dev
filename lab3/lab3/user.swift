//
//  user.swift
//  lab3

class User{
    let userID: String
    let name: String
    let email: String
    private(set) var orderHistory: [Order]=[]
    
    init(userID: String, name: String, email: String) {
        self.userID = userID
        self.name = name
        self.email = email
    }
    
    func placeOrder(_ order: Order){
        orderHistory.append(order)
//        print("order placed successfully")
    }
    
    var totalSpent: Double{
        return orderHistory.reduce(0.0) { $0 + $1.total }
    }
    
}
