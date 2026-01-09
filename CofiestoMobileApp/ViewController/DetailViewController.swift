//
//  DetailViewController.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 09.01.26.
import UIKit

class DetailViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var addButton: UIButton!

    // MARK: - Data
    var item: MenuItem?
    var quantity: Int = 1

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
    }

    // MARK: - UI config
    private func setupUI() {
        // Button Style
        addButton.backgroundColor = UIColor(red: 63/255, green: 174/255, blue: 90/255, alpha: 1)
        addButton.layer.cornerRadius = 12
        addButton.setTitle("Add to Cart", for: .normal)
        addButton.setTitleColor(.white, for: .normal)

        quantityLabel.text = "\(quantity)"
    }

    // MARK: - Data binding
    private func loadData() {
        guard let item = item else { return }

        nameLabel.text = item.name

        // Image
        if let id = item.id {
            let imageName = id.toImageName()
            productImageView.image = UIImage(named: imageName) ?? UIImage(named: "placeholder")
        }

        // Price
        if let price = item.price {
            priceLabel.text = String(format: "%.2f AZN", price)
        } else if let sizes = item.sizes {
            priceLabel.text = "S/M/L Available"
        }
    }

    // MARK: - Actions
    @IBAction func minusTapped(_ sender: UIButton) {
        if quantity > 1 {
            quantity -= 1
            quantityLabel.text = "\(quantity)"
        }
    }

    @IBAction func plusTapped(_ sender: UIButton) {
        quantity += 1
        quantityLabel.text = "\(quantity)"
    }

    @IBAction func addToCartTapped(_ sender: UIButton) {
        print("Added \(quantity) x \(item?.name ?? "") to cart")
    }
}
