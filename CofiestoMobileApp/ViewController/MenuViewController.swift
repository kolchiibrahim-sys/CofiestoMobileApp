//
//  MenuViewController.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 07.01.26.
//
import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    // Fake data (JSON gələnə qədər)
    private let drinks = [
        ("Latte", "5 AZN"),
        ("Cappuccino", "4.5 AZN"),
        ("Americano", "4 AZN"),
        ("Mocha", "6 AZN")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }

    // CollectionView bütün ayarları burada
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self

        let nib = UINib(
            nibName: "MenuCollectionViewCell",
            bundle: nil
        )
        collectionView.register(
            nib,
            forCellWithReuseIdentifier: "MenuCell"
        )
    }
}

// MARK: - UICollectionViewDataSource
extension MenuViewController: UICollectionViewDataSource {

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return drinks.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "MenuCell",
            for: indexPath
        ) as! MenuCollectionViewCell

        let drink = drinks[indexPath.item]
        cell.nameLabel.text = drink.0
        cell.priceLabel.text = drink.1
        cell.drinkImageView.image = UIImage(named: "placeholder")

        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension MenuViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {

        let width = (collectionView.frame.width - 24) / 2
        return CGSize(width: width, height: 170)
    }
}
