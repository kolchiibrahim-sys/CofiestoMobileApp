//
//  MenuModels.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 07.01.26.
//
import Foundation

struct MenuResponse: Decodable {
    let currency: String
    let categories: [MenuCategory]
}


struct MenuCategory: Decodable {
    let id: String
    let title: String
    let items: [MenuItem]
}


struct MenuItem: Decodable {
    let id: String?
    let name: String
    let price: Double?
    let sizes: [String: Double]?
    let description: String?
}
