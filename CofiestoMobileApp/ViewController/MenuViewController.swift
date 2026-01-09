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
}

extension MenuViewController {
    
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nib = UINib(nibName: "MenuCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "MenuCell")
        
        collectionView.register(
            UICollectionReusableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "HeaderView"
        )
    }
    
    private func configureSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search drinks..."
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
    }
    
    private func loadMenu() {
        guard let response = MenuLoader.loadMenu() else {
            print("Menu Load Failed")
            return
        }
        
        allSections = response.categories.map { ($0.title, $0.items) }
        filteredSections = allSections
        
        print("Sections Loaded:", filteredSections.count)
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
        
        if let id = item.id {
            cell.drinkImageView.image = UIImage(named: id.toImageName()) ?? UIImage(named: "placeholder")
        } else {
            cell.drinkImageView.image = UIImage(named: "placeholder")
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: "HeaderView",
            for: indexPath
        )
        
        header.subviews.forEach { $0.removeFromSuperview() }
        
        let label = UILabel(frame: CGRect(x: 12, y: 0, width: collectionView.frame.width, height: 30))
        label.text = filteredSections[indexPath.section].title
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        
        header.addSubview(label)
        return header
    }
}

extension MenuViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (collectionView.frame.width - 24) / 2
        return CGSize(width: width, height: 170)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: 32)
    }
}

extension MenuViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let query = searchController.searchBar.text?.lowercased() ?? ""
        
        if query.isEmpty {
            filteredSections = allSections
        } else {
            filteredSections = allSections.compactMap { (title, items) in
                let filtered = items.filter { $0.name.lowercased().contains(query) }
                return filtered.isEmpty ? nil : (title, filtered)
            }
        }
        
        collectionView.reloadData()
    }
}
func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
}
func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    let section = filteredSections[indexPath.section]
    let item = section.items[indexPath.item]

    let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
    vc.item = item
    navigationController?.pushViewController(vc, animated: true)
}
