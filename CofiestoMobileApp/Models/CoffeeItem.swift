//
//  CoffeeItem.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 02.01.26.
//
import Foundation

struct CoffeeItem {
    let id: UUID
    let name: String
    let price: Double
    let imageName: String

    init(name: String, price: Double, imageName: String) {
        self.id = UUID()
        self.name = name
        self.price = price
        self.imageName = imageName
    }
}
