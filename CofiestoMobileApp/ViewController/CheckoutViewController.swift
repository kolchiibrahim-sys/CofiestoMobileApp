//
//  CheckoutViewController.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 10.01.26.
//
import UIKit

class CheckoutViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var confirmButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Checkout"
        setupUI()
        loadData()
    }

    private func setupUI() {
        confirmButton.layer.cornerRadius = 12
        confirmButton.backgroundColor = UIColor(red: 63/255, green: 174/255, blue: 90/255, alpha: 1)
        confirmButton.setTitleColor(.white, for: .normal)
    }

    private func loadData() {
        totalLabel.text = String(format: "%.2f AZN", CartManager.shared.total)
    }

    @IBAction func confirmTapped(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "OrderSuccessViewController") as! OrderSuccessViewController
        present(vc, animated: true)
        CartManager.shared.clear()
    }
}
