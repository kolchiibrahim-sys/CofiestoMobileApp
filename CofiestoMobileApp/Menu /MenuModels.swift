//
//  MenuModels.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 07.01.26.
//
struct MenuItem: Codable {
    let name: String
    let category: String
    let ingredients: [String]
    let image: String
    let price: Double
}

