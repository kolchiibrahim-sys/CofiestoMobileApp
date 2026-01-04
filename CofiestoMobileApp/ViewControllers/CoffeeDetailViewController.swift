//
//  CoffeeDetailViewController.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 02.01.26.
//

import UIKit
var coffee: CoffeeItem!
class CoffeeDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var addToCartButton: UIButton!
    var coffee: CoffeeItem!
    @IBAction func addToCartTapped(_ sender: UIButton) {
        CartManager.shared.add(coffee: coffee)
        showAddedAlert()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        title = coffee.name
        nameLabel.text = coffee.name
        priceLabel.text = coffee.price.first
        imageView.image = UIImage(named: coffee.imageName)
    }
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
