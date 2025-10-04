//
//  main.swift
//  lab3

import Foundation

// 1. Create sample products
let laptop = Product(id:"001",
                     name:"MacBook Air",
                     price: 999.99,
                     category: .electronics,
                     description:"MacBook Air 13, 8GB RAM, 512GB SSD" )!

let book = Product(id:"002",
                   name:"Rich Dad Poor Dad",
                   price: 12.99,
                   category: .books,
                   description: "A classic read on wealth and family")!

let headphones = Product(id:"003",
                         name:"Bose QuietComfort 35",
                         price: 89.99,
                         category: .audio,
                         description: "Noise-cancelling headphones")!

// 2. Test adding items to cart
let cart = ShoppingCart()
cart.addItem(product: laptop, quantity: 1)
cart.addItem(product: book, quantity: 2)

// 3. Test adding same product twice (should update quantity)
cart.addItem(product: laptop, quantity: 1)
print("Laptop quantity should now be 2")

// 4. Test cart calculations
print("Subtotal: \(cart.subtotal)")
print("Item count: \(cart.itemQuantity)")

// 5. Test discount code
cart.discountCode = "SAVE10"
print("Total with discount: \(cart.total)")

// 6. Test removing items
cart.removeItem(productID: book.id)

// 7. Demonstrate REFERENCE TYPE behavior
func modifyCart(_ cart: ShoppingCart) {
    cart.addItem(product: headphones, quantity: 1)
}
modifyCart(cart)

print("After modifyCart(), item count: \(cart.itemQuantity)")

// 8. Demonstrate VALUE TYPE behavior
let item1 = CartItem(product: laptop, quantity: 1)
var item2 = item1
item2.updateQuantity(5)



// 9. Create order from cart

//let user = User(userID: "U001", name: "Aya", email: "aya@mail.com")

let address = Address(street: "Main Street 123",
                      city: "Almaty",
                      zipCode: "050000",
                      country: "Kazakhstan")

let order = Order(from: cart, shippingAddress: address)

print("Order created with \(order.itemCount) items at \(order.timestamp)")


// 10. Modify cart after order creation
cart.clearCart()
// Verify order still contains original items (immutable snapshot)

print("Order items count: \(order.itemCount)") // Should not be 0
print("Cart items count: \(cart.itemQuantity)")   // Should be 0


//bonus 1
print("\nbonus task 1")
let user = User(userID: "U001", name: "Aya", email: "aya@mail.com")
user.placeOrder(order)

print("Total spent by \(user.name): $\(user.totalSpent)")

//bonus task 2
print("\nbonus task 2")
cart.addItem(product: book, quantity: 2)

cart.discountCode = "SAVE10"
print("Subtotal: \(cart.subtotal)")
print("Discount: \(cart.discountAmount)")
print("Total: \(cart.total)")

