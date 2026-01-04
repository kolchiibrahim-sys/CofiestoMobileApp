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

    var coffee: CoffeeItem!

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
