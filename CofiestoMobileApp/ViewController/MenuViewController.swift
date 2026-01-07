//
//  MenuViewController.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 07.01.26.
import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    private var allItems: [MenuItem] = []
    private var filteredItems: [MenuItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Menu"
        view.backgroundColor = .white
        configureCollectionView()
        loadMenu()
    }

    // MARK: - CollectionView setup
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self

        let nib = UINib(nibName: "MenuCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "MenuCell")
    }

    // MARK: - Load JSON
    private func loadMenu() {
        guard let response = MenuLoader.loadMenu() else {
            print("❌ menu load failed")
            return
        }

        allItems = response.categories.flatMap { $0.items }
        filteredItems = allItems

        print("✅ Items loaded:", filteredItems.count)
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource
extension MenuViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return filteredItems.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "MenuCell",
            for: indexPath
        ) as! MenuCollectionViewCell

        let item = filteredItems[indexPath.item]

        // 🔹 Name
        cell.nameLabel.text = item.name

        // 🔹 Price
        if let price = item.price {
            cell.priceLabel.text = String(format: "%.2f AZN", price)
        } else if let sizes = item.sizes {
            let s = sizes["S"] ?? 0
            let m = sizes["M"] ?? 0
            let l = sizes["L"] ?? 0
            cell.priceLabel.text = "S \(s) / M \(m) / L \(l) AZN"
        } else {
            cell.priceLabel.text = ""
        }

        // 🔹 Image (JSON id → Assets image)
        if let id = item.id {
            let imageName = id.toImageName()   // affogato_pistachio → AffogatoPistachio
            cell.drinkImageView.image = UIImage(named: imageName)
                ?? UIImage(named: "placeholder")
        } else {
            cell.drinkImageView.image = UIImage(named: "placeholder")
        }

        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension MenuViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = (collectionView.frame.width - 24) / 2
        return CGSize(width: width, height: 160)
    }
}
