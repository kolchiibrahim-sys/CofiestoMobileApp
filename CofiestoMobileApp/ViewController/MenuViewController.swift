import UIKit

class MenuViewController: UIViewController {

    // MARK: - UI
    private let searchBar = UISearchBar()
    private var collectionView: UICollectionView!

    // MARK: - Data
    private var allItems: [MenuItem] = []
    private var filteredItems: [MenuItem] = []

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Menu"
        view.backgroundColor = .white

        setupSearchBar()
        setupCollectionView()
        loadMenu()
    }

    // MARK: - UI Setup
    private func setupSearchBar() {
        searchBar.placeholder = "Axtar (Latte, Raf...)"
        searchBar.delegate = self
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchBar)

        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 56)
        ])
    }

    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 16

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        collectionView.register(MenuCollectionViewCell.self,
                                forCellWithReuseIdentifier: "MenuCell")

        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    // MARK: - Data
    private func loadMenu() {
        guard let response = MenuLoader.loadMenu() else {
            print("❌ Menu load failed")
            return
        }

        allItems = response.categories.flatMap { $0.items }
        filteredItems = allItems

        print("✅ Menu items:", allItems.count)
        collectionView.reloadData()
    }
}
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

        return cell
    }
}
extension MenuViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = (collectionView.frame.width - 16) / 2
        return CGSize(width: width, height: 110)
    }
}
extension MenuViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
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

