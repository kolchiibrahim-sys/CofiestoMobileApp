//
//  MenuLoader.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 07.01.26.
//
import Foundation

final class MenuLoader {

    static func loadMenu() -> MenuResponse? {
        guard let url = Bundle.main.url(forResource: "menu", withExtension: "json") else {
            print("menu.json tapilmadi")
            return nil
        }

        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode(MenuResponse.self, from: data)
            return decoded
        } catch {
            print("JSON error:", error)
            return nil
        }
    }
}
