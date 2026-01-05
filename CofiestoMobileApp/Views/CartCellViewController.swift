//
//  CartCellViewController.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 06.01.26.
//

import UIKit

import UIKit

class CartCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!

    var onPlusTapped: (() -> Void)?
    var onMinusTapped: (() -> Void)?

    func configure(with item: CartItem) {
        nameLabel.text = item.coffee.name
        priceLabel.text = "$\(item.coffee.price)"
        quantityLabel.text = "\(item.quantity)"
    }

    @IBAction func plusTapped() {
        onPlusTapped?()
    }

    @IBAction func minusTapped() {
        onMinusTapped?()
    }
}
