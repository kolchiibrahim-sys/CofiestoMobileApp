//
//  MenuCollectionViewCell.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 07.01.26.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var ingredientsLabel: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 12
        backgroundColor = UIColor(white: 0.97, alpha: 1)
    }
}
