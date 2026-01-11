//
//  CartManager.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 10.01.26.
//
class CartManager {

    static let shared = CartManager()

    private(set) var items: [CartItem] = []

    func add(_ item: MenuItem, quantity: Int) {
        if let index = items.firstIndex(where: { $0.item.name == item.name }) {
            items[index].quantity += quantity
        } else {
            items.append(CartItem(item: item, quantity: quantity))
        }
    }

    var total: Double {
        items.reduce(0) { $0 + ($1.item.price * Double($1.quantity)) }
    }
}
