//
//  CartManager.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 10.01.26.
//

import Foundation
class CartManager {
    static let shared = CartManager()
    private init() {}

    private(set) var items: [CartItem] = []

    func add(item: MenuItem, quantity: Int) {
        if let index = items.firstIndex(where: { $0.item.name == item.name }) {
            items[index].quantity += quantity
        } else {
            items.append(CartItem(item: item, quantity: quantity))
        }
    }

    func remove(item: MenuItem) {
        items.removeAll { $0.item.name == item.name }
    }

    func clear() {
        items.removeAll()
    }

    var total: Double {
        items.reduce(0) { $0 + $1.totalPrice }
    }
}
