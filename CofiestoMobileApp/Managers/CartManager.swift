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

    var items: [CartItem] = []
}
