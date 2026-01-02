//
//  HomeViewController.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 02.01.26.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }

    private func setupCollectionView() {

        let nib = UINib(nibName: "CoffeeCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "CoffeeCell")

        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// ⚠️ BAX BU HİSSƏ CLASS-DAN KƏNARDA OLMALIDIR
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "CoffeeCell",
            for: indexPath
        )

        cell.backgroundColor = .systemBrown
        cell.layer.cornerRadius = 12
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let padding: CGFloat = 16
        let width = (collectionView.bounds.width - padding * 3) / 2
        return CGSize(width: width, height: width * 1.3)
    }
}
