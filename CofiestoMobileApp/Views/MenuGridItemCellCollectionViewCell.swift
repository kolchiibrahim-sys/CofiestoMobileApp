//
//  MenuGridItemCellCollectionViewCell.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 02.01.26.
//
import UIKit
import UIKit

class MenuGridItemCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var coffeeImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    private func setupUI() {
        containerView.layer.cornerRadius = 16
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.08
        containerView.layer.shadowOffset = CGSize(width: 0, height: 4)
        containerView.layer.shadowRadius = 10
        containerView.layer.masksToBounds = false

        coffeeImageView.layer.cornerRadius = 16
        coffeeImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        coffeeImageView.clipsToBounds = true
    }

    func configure(with item: CoffeeItem) {
        nameLabel.text = item.name
        priceLabel.text = "$\(String(format: "%.2f", item.price))"
        coffeeImageView.image = UIImage(named: item.imageName)
    }
}
