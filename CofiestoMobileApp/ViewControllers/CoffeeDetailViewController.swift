//
//  CoffeeDetailViewController.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 02.01.26.
//

import UIKit

class CoffeeDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var addToCartButton: UIButton!

    var item: CoffeeItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = item.name
        configureUI()
    }

    private func configureUI() {
        imageView.image = UIImage(named: item.imageName)
        nameLabel.text = item.name
        priceLabel.text = item.price.first
        addToCartButton.layer.cornerRadius = 12
    }

    @IBAction func addToCartTapped(_ sender: UIButton) {
        CartManager.shared.add(coffee: item)
        navigationController?.popViewController(animated: true)
    }
}
