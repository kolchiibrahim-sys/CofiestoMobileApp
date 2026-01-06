//
//  MenuViewController.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 02.01.26.
//
import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    // 🛒 Cart button
    private var cartButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Menu"

        // 📦 Load menu data
        CoffeeManager.shared.loadMenu()

        collectionView.delegate = self
        collectionView.dataSource = self

        let nib = UINib(nibName: "MenuGridItemCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "MenuGridItemCell")

        // 🛒 Cart button setup
        setupCartButton()
        func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            updateCartBadge()
        }

    }

    // 🔄 Badge refresh
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateCartBadge()
    }
}

// MARK: - Cart Button
extension MenuViewController {

    private func setupCartButton() {
        cartButton = UIButton(type: .custom)
        cartButton.setImage(UIImage(systemName: "cart"), for: .normal)
        cartButton.addTarget(self, action: #selector(cartTapped), for: .touchUpInside)

        let barButton = UIBarButtonItem(customView: cartButton)
        navigationItem.rightBarButtonItem = barButton

        updateCartBadge()
    }

    private func updateCartBadge() {
        let count = CartManager.shared.totalItemsCount

       
        cartButton.subviews
            .filter { $0.tag == 999 }
            .forEach { $0.removeFromSuperview() }

        guard count > 0 else { return }

        let badgeLabel = UILabel()
        badgeLabel.tag = 999
        badgeLabel.text = "\(String(describing: count))"
        badgeLabel.font = .systemFont(ofSize: 12, weight: .bold)
        badgeLabel.textColor = .white
        badgeLabel.backgroundColor = .systemRed
        badgeLabel.textAlignment = .center
        badgeLabel.frame = CGRect(x: 16, y: -6, width: 18, height: 18)
        badgeLabel.layer.cornerRadius = 9
        badgeLabel.clipsToBounds = true

        cartButton.addSubview(badgeLabel)
    }

    @objc private func cartTapped() {
        let vc = CartViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - CollectionView
extension MenuViewController: UICollectionViewDelegate,
                              UICollectionViewDataSource,
                              UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return MenuData.menu.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return MenuData.menu[section].items.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "MenuGridItemCell",
            for: indexPath
        ) as! MenuGridItemCell

        let item = MenuData.menu[indexPath.section].items[indexPath.item]
        cell.configure(with: item)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {

        let item = MenuData.menu[indexPath.section].items[indexPath.item]

        let vc = CoffeeDetailViewController(
            nibName: "CoffeeDetailViewController",
            bundle: nil
        )
        vc.item = item

        // ✅ navigationController burada 100% düzgündür
        navigationController?.pushViewController(vc, animated: true)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = (collectionView.frame.width - 48) / 2
        return CGSize(width: width, height: 220)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}
