//
//  CartViewController.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 02.01.26.
//

import UIKit

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Cart"

        tableView.dataSource = self
        tableView.delegate = self

        tableView.register(
            UINib(nibName: "CartCell", bundle: nil),
            forCellReuseIdentifier: "CartCell"
        )

        updateTotal()
    }

    private func updateTotal() {
        let total = CartManager.shared.items.reduce(0) {
            $0 + (Double($1.quantity) * $1.coffee.price)
        }
        totalLabel.text = "Total: $\(String(format: "%.2f", total))"
    }
}

extension CartViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        CartManager.shared.items.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(
            withIdentifier: "CartCell",
            for: indexPath
        ) as! CartCell

        let item = CartManager.shared.items[indexPath.row]
        cell.configure(with: item)

        cell.onPlusTapped = { [weak self] in
            CartManager.shared.add(coffee: item.coffee)
            tableView.reloadData()
            self?.updateTotal()
        }

        cell.onMinusTapped = { [weak self] in
            CartManager.shared.items[indexPath.row].quantity -= 1
            if CartManager.shared.items[indexPath.row].quantity <= 0 {
                CartManager.shared.remove(at: indexPath.row)
            }
            tableView.reloadData()
            self?.updateTotal()
        }

        return cell
    }
}

extension CartViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
}
