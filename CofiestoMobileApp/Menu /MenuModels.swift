//
//  MenuModels.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 07.01.26.
//
import Foundation
// MARK: - Root
struct MenuResponse: Decodable {
    let currency: String
    let categories: [MenuCategory]
}

// MARK: - Category
struct MenuCategory: Decodable {
    let id: String
    let title: String
    let items: [MenuItem]
}

// MARK: - Item
struct MenuItem: Decodable {
    let id: String?
    let name: String
    let price: Double?
    let sizes: [String: Double]?
    let description: String?
}
