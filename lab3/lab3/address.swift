//
//  address.swift
// lab3

struct Address{
    var street: String
    var city: String
    var zipCode: String
    var country: String
    
    var formattedAddress: String {
        """
        \(street),
        \(city), \(zipCode),
        \(country)
        """
    }
    
}
