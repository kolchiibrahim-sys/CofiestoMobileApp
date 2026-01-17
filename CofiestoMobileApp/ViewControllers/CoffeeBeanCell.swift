//
//  CoffeeBeanCell.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 16.01.26.
//
import UIKit

class CoffeeBeanCell: UICollectionViewCell {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var flavorLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        flavorLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            logoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            logoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor),

            titleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 6),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -6),

            flavorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            flavorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
            flavorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -6),
            flavorLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])

        backgroundColor = .clear

        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 12
        contentView.layer.masksToBounds = true

        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.08
        layer.shadowRadius = 6
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.masksToBounds = false

        titleLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 1

        flavorLabel.font = .systemFont(ofSize: 13, weight: .regular)
        flavorLabel.textColor = .gray
        flavorLabel.textAlignment = .center
        flavorLabel.numberOfLines = 1
        flavorLabel.adjustsFontSizeToFitWidth = true
        flavorLabel.minimumScaleFactor = 0.85
        flavorLabel.lineBreakMode = .byTruncatingTail

        logoImageView.contentMode = .scaleAspectFill
        logoImageView.clipsToBounds = true
    }
}
