//
//  CoffeeDetailViewController.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 02.01.26.
//

import UIKit

class CoffeeDetailViewController: UIViewController {

    @IBOutlet weak var coffeeImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var addToCartButton: UIButton!

    var coffee: CoffeeItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        title = coffee.name
        nameLabel.text = coffee.name
        priceLabel.text = coffee.price.first
        coffeeImageView.image = UIImage(named: coffee.imageName)
    }

    @IBAction func addToCartTapped(_ sender: UIButton) {
        CartManager.shared.add(coffee: coffee)
        showAddedAlert()
    }

    private func showAddedAlert() {
        let alert = UIAlertController(
            title: "Added to Cart",
            message: "\(coffee.name) added successfully",
            preferredStyle: .alert
        )

        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
