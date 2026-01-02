//
//  BranchManager.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 02.01.26.
//

import Foundation
class BranchManager {
    static let shared = BranchManager()
    private init() {}

    var branches: [Branch] = []
}
