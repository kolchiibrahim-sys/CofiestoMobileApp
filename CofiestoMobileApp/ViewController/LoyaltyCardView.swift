//
//  LoyaltyCardView.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 17.01.26.
//

import UIKit

class LoyaltyCardView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Cofiesto"
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textColor = .white
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Coffee Company"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white.withAlphaComponent(0.9)
        return label
    }()
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Ad: Kolchi Ibrahim        Balans: 3.69 bon"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .black
        return label
    }()
    
    private let barcodeView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemGray5
        view.layer.cornerRadius = 8
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        layer.cornerRadius = 14
        layer.masksToBounds = true
        backgroundColor = .white
        
        let topSection = UIView()
        topSection.backgroundColor = UIColor(red: 21/255, green: 95/255, blue: 47/255, alpha: 1)
        
        addSubview(topSection)
        topSection.addSubview(titleLabel)
        topSection.addSubview(subtitleLabel)
        
        addSubview(infoLabel)
        addSubview(barcodeView)
        
        topSection.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        barcodeView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topSection.topAnchor.constraint(equalTo: topAnchor),
            topSection.leadingAnchor.constraint(equalTo: leadingAnchor),
            topSection.trailingAnchor.constraint(equalTo: trailingAnchor),
            topSection.heightAnchor.constraint(equalToConstant: 100),
            
            titleLabel.leadingAnchor.constraint(equalTo: topSection.leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: topSection.topAnchor, constant: 16),
            
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            
            infoLabel.topAnchor.constraint(equalTo: topSection.bottomAnchor, constant: 16),
            infoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            barcodeView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 16),
            barcodeView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            barcodeView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            barcodeView.heightAnchor.constraint(equalToConstant: 80),
            barcodeView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
}
