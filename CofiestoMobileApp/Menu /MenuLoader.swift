//
//  MenuLoader.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 07.01.26.
//


import Foundation

class MenuLoader {
    static func loadMenu() -> [MenuItem]? {
        guard let url = Bundle.main.url(forResource: "menu", withExtension: "json") else {
            print("menu.json not found")
            return nil
        }

        do {
            let data = try Data(contentsOf: url)
            let items = try JSONDecoder().decode([MenuItem].self, from: data)
            return items
        } catch {
            print("JSON decode error:", error)
            return nil
        }
    }
}
extension Array where Element == MenuItem {
    func groupedByCategory() -> [(title: String, items: [MenuItem])] {
        let grouped = Dictionary(grouping: self, by: { $0.category })
        
        return grouped
            .sorted { $0.key < $1.key }
            .map { (title: $0.key, items: $0.value) }
    }
}
