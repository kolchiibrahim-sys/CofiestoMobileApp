//
//  MenuViewController.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 02.01.26.
//
import UIKit

class MenuViewController: UIViewController,
                          UICollectionViewDelegate,
                          UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Menu"

        collectionView.delegate = self
        collectionView.dataSource = self

        let nib = UINib(nibName: "MenuGridItemCell", bundle: nil)
        collectionView.register(nib,
                                forCellWithReuseIdentifier: "MenuGridItemCell")
    }
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return CoffeeData.coffees.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath)
    -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "MenuGridItemCell",
            for: indexPath
        ) as! MenuGridItemCell

        let item = CoffeeData.coffees[indexPath.item]
        cell.configure(with: item)

        return cell
    }
}
