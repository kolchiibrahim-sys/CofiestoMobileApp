//
//  CheckoutViewController.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 10.01.26.
//
import UIKit

class CheckoutViewController: UIViewController {
    
    var total: Double = 0
    
    private let cardView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.layer.cornerRadius = 12
        v.layer.shadowColor = UIColor.black.cgColor
        v.layer.shadowOpacity = 0.05
        v.layer.shadowRadius = 8
        v.layer.shadowOffset = CGSize(width: 0, height: 3)
        return v
    }()
    
    private let orderSummaryLabel: UILabel = {
        let label = UILabel()
        label.text = "Order Summary"
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    
    private let subtotalLabel: UILabel = {
        let label = UILabel()
        label.text = "Subtotal: 0 AZN"
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    private let totalLabel: UILabel = {
        let label = UILabel()
        label.text = "Total: 0 AZN"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let divider: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(white: 0.9, alpha: 1)
        return v
    }()
    
    private let paymentLabel: UILabel = {
        let label = UILabel()
        label.text = "Payment: Cash"
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    private let confirmButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Confirm Order", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = UIColor(red: 63/255, green: 174/255, blue: 90/255, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemGroupedBackground
        
        subtotalLabel.text = String(format: "Subtotal: %.2f AZN", total)
        totalLabel.text = String(format: "Total: %.2f AZN", total)
        
        [cardView, confirmButton].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        [orderSummaryLabel, subtotalLabel, totalLabel, divider, paymentLabel].forEach {
            cardView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        setupConstraints()
        confirmButton.addTarget(self, action: #selector(confirmOrder), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            orderSummaryLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 20),
            orderSummaryLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            
            subtotalLabel.topAnchor.constraint(equalTo: orderSummaryLabel.bottomAnchor, constant: 16),
            subtotalLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            
            totalLabel.topAnchor.constraint(equalTo: subtotalLabel.bottomAnchor, constant: 10),
            totalLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            
            divider.topAnchor.constraint(equalTo: totalLabel.bottomAnchor, constant: 16),
            divider.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            divider.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            divider.heightAnchor.constraint(equalToConstant: 1),
            
            paymentLabel.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 16),
            paymentLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            paymentLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            confirmButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            confirmButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            confirmButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            confirmButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
    
    @objc private func confirmOrder() {
        let alert = UIAlertController(title: "Order Confirmed", message: "Thank you!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
