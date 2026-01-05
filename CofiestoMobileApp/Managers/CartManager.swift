//
//  CartManager.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 02.01.26.
//

import Foundation

class CartManager {

    static let shared = CartManager()
    private init() {}

    private(set) var items: [CartItem] = []

    func add(coffee: CoffeeItem) {
        
        if let index = items.firstIndex(where: { $0.coffee.name == coffee.name }) {
            items[index].quantity += 1
        } else {
            
            let newItem = CartItem(coffee: coffee, quantity: 1)
            items.append(newItem)
        }
    }

    func totalItemsCount() -> Int {
        return items.reduce(0) { $0 + $1.quantity
        }
    }
}
extension CartManager {

    var totalItemsCount: Int {
        items.reduce(0) { $0 + $1.quantity }
    }
}
