//
//  MenuViewController.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 07.01.26.
//
import UIKit
import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!

    private var allItems: [MenuItem] = []
    private var filteredItems: [MenuItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Menu"
        configureCollectionView()
        searchBar.delegate = self
        loadMenu()
    }

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

    private func loadMenu() {
        guard let response = MenuLoader.loadMenu() else {
            print("❌ response nil")
            return
        }

        // 🔥 ƏN VACİB SƏTİR
        allItems = response.categories.flatMap { $0.items }
        filteredItems = allItems

        print("✅ Items loaded:", allItems.count)
        collectionView.reloadData()
    }
}
extension MenuViewController: UICollectionViewDataSource {

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return filteredItems.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "MenuCell",
            for: indexPath
        ) as! MenuCollectionViewCell

        let item = filteredItems[indexPath.item]
        cell.nameLabel.text = item.name

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

        cell.drinkImageView.image = UIImage(named: "placeholder")
        return cell
    }
}
extension MenuViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {

        let width = (collectionView.frame.width - 24) / 2
        return CGSize(width: width, height: 180)
    }
}
extension MenuViewController: UISearchBarDelegate {

    func searchBar(
        _ searchBar: UISearchBar,
        textDidChange searchText: String
    ) {

        if searchText.isEmpty {
            filteredItems = allItems
        } else {
            filteredItems = allItems.filter {
                $0.name.lowercased().contains(searchText.lowercased())
            }
        }

        collectionView.reloadData()
    }
}
