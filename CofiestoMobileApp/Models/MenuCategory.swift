//
//  MenuCategory.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 02.01.26.
//

import Foundation
import Foundation

enum MenuLayout {
    case grid
    case list
}

struct MenuCategory {
    let title: String
    let items: [CoffeeItem]
    let layout: MenuLayout

    init(title: String, items: [CoffeeItem], layout: MenuLayout = .grid) {
        self.title = title
        self.items = items
        self.layout = layout
    }
}
