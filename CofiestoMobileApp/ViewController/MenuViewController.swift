//
//  MenuViewController.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 09.01.26.
import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    private var allSections: [(title: String, items: [MenuItem])] = []
    private var filteredSections: [(title: String, items: [MenuItem])] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Menu"
        view.backgroundColor = .white

        configureCollectionView()
        configureSearchController()
        loadMenu()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumInteritemSpacing = 10
            layout.minimumLineSpacing = 14
            layout.sectionInset = UIEdgeInsets(top: 10, left: 12, bottom: 10, right: 12)

            let width = (view.frame.width - 12 - 12 - 10) / 2
            layout.itemSize = CGSize(width: width, height: width * 1.45)
        }
    }
}

extension MenuViewController {

    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self

        let nib = UINib(nibName: "MenuCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "MenuCell")
    }

    private func configureSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search drinks..."
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
    }

    private func loadMenu() {
        guard let items = MenuLoader.loadMenu() else {
            print("Menu Load Failed")
            return
        }

        // Section OFF (2-ci şəkil stili)
        allSections = [("All", items)]
        filteredSections = allSections

        collectionView.reloadData()
    }
}

extension MenuViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return filteredSections.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return filteredSections[section].items.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "MenuCell",
            for: indexPath
        ) as! MenuCollectionViewCell

        let item = filteredSections[indexPath.section].items[indexPath.row]

        cell.nameLabel.text = item.name
        cell.priceLabel.text = String(format: "%.2f AZN", item.price)
        cell.ingredientsLabel.text = item.ingredients.joined(separator: ", ")
        cell.productImageView.image = UIImage(named: item.image) ?? UIImage(named: "placeholder")

        return cell
    }
}

extension MenuViewController: UISearchResultsUpdating, UICollectionViewDelegate {

    func updateSearchResults(for searchController: UISearchController) {
        let query = searchController.searchBar.text?.lowercased() ?? ""

        if query.isEmpty {
            filteredSections = allSections
        } else {
            filteredSections = allSections.compactMap { title, items in
                let filtered = items.filter { $0.name.lowercased().contains(query) }
                return filtered.isEmpty ? nil : (title, filtered)
            }
        }

        collectionView.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = filteredSections[indexPath.section].items[indexPath.item]

        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.item = item
        navigationController?.pushViewController(vc, animated: true)
    }
}
