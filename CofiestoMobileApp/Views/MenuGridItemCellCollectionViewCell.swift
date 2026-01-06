//
//  MenuGridItemCellCollectionViewCell.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 02.01.26.
//
import UIKit

class MenuGridItemCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

    func configure(with item: CoffeeItem) {
        nameLabel.text = item.name
        priceLabel.text = item.price.description
        imageView.image = UIImage(named: item.imageName)
    }
}
