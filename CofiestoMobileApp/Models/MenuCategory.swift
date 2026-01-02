//
//  MenuCategory.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 02.01.26.
//

import Foundation
struct MenuCategory {
    let title: String
    let items: [CoffeeItem]
    let layout: MenuLayout
}

enum MenuLayout {
    case list
    case grid
}
