//
//  CartViewController.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 02.01.26.
//
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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        updateTotal()
    }

    private func updateTotal() {
        let total = CartManager.shared.items.reduce(0.0) {
            $0 + Double($1.quantity) * $1.coffee.price
        }
        totalLabel.text = "Total: $\(String(format: "%.2f", total))"
    }
}

// MARK: - UITableViewDataSource
extension CartViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
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
            CartManager.shared.decrease(coffee: item.coffee)
            tableView.reloadData()
            self?.updateTotal()
        }

        return cell
    }
}

// MARK: - UITableViewDelegate
extension CartViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
}
