//
//  CartViewController.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 10.01.26.
//
import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var checkoutButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Cart"
        setupUI()
        setupTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        updateTotal()
    }

    private func setupUI() {
        checkoutButton.layer.cornerRadius = 12
        checkoutButton.backgroundColor = UIColor(red: 63/255, green: 174/255, blue: 90/255, alpha: 1)
        checkoutButton.setTitleColor(.white, for: .normal)
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self

        // XIB qeydiyyatı (Vacib!)
        tableView.register(UINib(nibName: "CartCell", bundle: nil),
                           forCellReuseIdentifier: "CartCell")
    }

    private func updateTotal() {
        totalLabel.text = String(format: "%.2f AZN", CartManager.shared.total)
    }

    @IBAction func checkoutTapped(_ sender: UIButton) {
        print("Checkout tapped")
    }
}

extension CartViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CartManager.shared.items.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell",
                                                 for: indexPath) as! CartCell

        let cartItem = CartManager.shared.items[indexPath.row]
        cell.configure(with: cartItem)

        return cell
    }
}
