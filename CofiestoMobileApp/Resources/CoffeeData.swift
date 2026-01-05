//
//  CoffeeData.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 02.01.26.
//

import Foundation

struct CoffeeData {
    static let coffees: [CoffeeItem] = [

        CoffeeItem(
            name: "Latte",
            price: ["6.50", "6.90", "7.90"],
            imageName: "Latte", id:UUID()
        ),

        CoffeeItem(
            name: "Americano",
            price: ["4.50"],
            imageName: "Americano", id:UUID()
        ),

        CoffeeItem(
            name: "Cappuccino",
            price: ["6.00", "6.50", "7.20"],
            imageName: "Cappucino", id:UUID()
        )
    ]
}
