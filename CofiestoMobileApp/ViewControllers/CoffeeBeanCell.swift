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

        [logoImageView, titleLabel, flavorLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        setupConstraints()
        setupStyling()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 60),
            logoImageView.heightAnchor.constraint(equalToConstant: 60),

            titleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),

            flavorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            flavorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            flavorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            flavorLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }

    private func setupStyling() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 12
        contentView.layer.masksToBounds = false
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 0.08
        contentView.layer.shadowRadius = 6
        contentView.layer.shadowOffset = CGSize(width: 0, height: 3)

        titleLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        titleLabel.textAlignment = .center

        flavorLabel.font = .systemFont(ofSize: 13, weight: .regular)
        flavorLabel.textColor = .gray
        flavorLabel.textAlignment = .center

        logoImageView.contentMode = .scaleAspectFit
    }
}
