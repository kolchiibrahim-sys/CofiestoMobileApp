//
//  CoffeeDetailViewController.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 02.01.26.
//

import UIKit

class CoffeeDetailViewController: UIViewController {

    var item: CoffeeItem?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var addToCartButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    private func configureUI() {
        guard let item = item else {
            print("CoffeeDetailViewController: item is nil")
            return
        }

        nameLabel.text = item.name
        priceLabel.text = "$\(String(format: "%.2f", item.price))"
        imageView.image = UIImage(named: item.imageName)

        addToCartButton.layer.cornerRadius = 14
    }

    @IBAction func addToCartTapped(_ sender: UIButton) {
        guard let item = item else { return }

        CartManager.shared.add(coffee: item)

        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()

        navigationController?.popViewController(animated: true)
    }
}
