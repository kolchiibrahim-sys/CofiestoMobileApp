//
//  CartViewController.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 10.01.26.
//
import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private let bottomContainer = UIView()
    private let totalLabel = UILabel()
    private let checkoutButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Cart"
        setupBottomBar()  
        setupTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        updateTotal()
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(UINib(nibName: "CartCell", bundle: nil),
                           forCellReuseIdentifier: "CartCell")

        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomContainer.topAnchor)
        ])
    }

    private func setupBottomBar() {
        bottomContainer.translatesAutoresizingMaskIntoConstraints = false
        totalLabel.translatesAutoresizingMaskIntoConstraints = false
        checkoutButton.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(bottomContainer)
        bottomContainer.addSubview(totalLabel)
        bottomContainer.addSubview(checkoutButton)

        bottomContainer.backgroundColor = .white

        NSLayoutConstraint.activate([
            bottomContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomContainer.heightAnchor.constraint(equalToConstant: 80)
        ])

        totalLabel.font = .systemFont(ofSize: 18, weight: .medium)
        totalLabel.textColor = .black

        NSLayoutConstraint.activate([
            totalLabel.leadingAnchor.constraint(equalTo: bottomContainer.leadingAnchor, constant: 16),
            totalLabel.centerYAnchor.constraint(equalTo: bottomContainer.centerYAnchor)
        ])

        checkoutButton.backgroundColor = UIColor(red: 63/255, green: 174/255, blue: 90/255, alpha: 1)
        checkoutButton.layer.cornerRadius = 12
        checkoutButton.setTitle("Checkout", for: .normal)
        checkoutButton.setTitleColor(.white, for: .normal)
        checkoutButton.addTarget(self, action: #selector(checkoutTapped), for: .touchUpInside)

        NSLayoutConstraint.activate([
            checkoutButton.trailingAnchor.constraint(equalTo: bottomContainer.trailingAnchor, constant: -16),
            checkoutButton.centerYAnchor.constraint(equalTo: bottomContainer.centerYAnchor),
            checkoutButton.heightAnchor.constraint(equalToConstant: 44),
            checkoutButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 120)
        ])
    }

    private func updateTotal() {
        totalLabel.text = String(format: "%.2f AZN", CartManager.shared.total)
    }

    @objc private func checkoutTapped() {
        let checkoutVC = CheckoutViewController()
        checkoutVC.total = CartManager.shared.total
        navigationController?.pushViewController(checkoutVC, animated: true)
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

