//
//  CartViewController.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 02.01.26.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Cart"

        tableView.dataSource = self
        tableView.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
}
extension CartViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return CartManager.shared.items.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath)
    -> UITableViewCell {

        let cell = UITableViewCell(style: .subtitle,
                                   reuseIdentifier: "cell")

        let item = CartManager.shared.items[indexPath.row]

        cell.textLabel?.text = item.coffee.name
        cell.detailTextLabel?.text = "Quantity: \(item.quantity)"

        return cell
    }
}
extension CartViewController: UITableViewDelegate {
}
