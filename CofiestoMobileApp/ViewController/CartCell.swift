//
//  CartCell.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 10.01.26.
//
import UIKit

class CartCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

    func configure(with cartItem: CartItem) {
        nameLabel.text = cartItem.item.name
        quantityLabel.text = "x\(cartItem.quantity)"
        priceLabel.text = String(format: "%.2f AZN", cartItem.totalPrice)
        productImageView.image = UIImage(named: cartItem.item.image) ?? UIImage(named: "placeholder")
    }
}
