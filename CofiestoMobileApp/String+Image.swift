//
//  String+Image.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 07.01.26.
//
import Foundation

extension String {
   func toImageName() -> String {
       return self
           .split(separator: "_")
            .map { $0.capitalized }
            .joined()
    }
}
