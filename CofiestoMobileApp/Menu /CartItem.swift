//
//  CartItem.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 10.01.26.
//

import Foundation
struct CartItem {
    let item: MenuItem
    var quantity: Int
    
    var totalPrice: Double {
        return Double(quantity) * item.price
    }
}
