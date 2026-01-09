//
//  DetailViewController.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 09.01.26.
import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
    var item: MenuItem?
    var quantity = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
    }
    
    private func setupUI() {
        addButton.backgroundColor = UIColor(red: 63/255, green: 174/255, blue: 90/255, alpha: 1)
        addButton.layer.cornerRadius = 12
        addButton.setTitle("Add to Cart", for: .normal)
        addButton.setTitleColor(.white, for: .normal)
        quantityLabel.text = "\(quantity)"
    }
    
    private func loadData() {
        guard let item = item else { return }
        nameLabel.text = item.name
        priceLabel.text = String(format: "%.2f AZN", item.price)
        productImageView.image = UIImage(named: item.image) ?? UIImage(named: "placeholder")
    }
}
