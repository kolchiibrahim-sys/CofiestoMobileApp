//
//  MenuListItemCell.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 02.01.26.
//

import UIKit

import UIKit

class MenuListItemCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

    func configure(with item: CoffeeItem) {
        nameLabel.text = item.name
        priceLabel.text = item.price.first
    }
}
