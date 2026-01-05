//
//  CoffeeManager.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 02.01.26.
//

import Foundation

class CoffeeManager {

    static let shared = CoffeeManager()

    private init() {}

    func loadMenu() {
        // Hələlik mock data
        MenuData.menu = [
            MenuCategory(
                title: "Basic Coffee",
                items: CoffeeData.coffees
            )
        ]
    }
}
