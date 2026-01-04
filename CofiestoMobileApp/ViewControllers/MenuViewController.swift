//
//  MenuViewController.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 02.01.26.
//
import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Menu"

        collectionView.delegate = self
        collectionView.dataSource = self

        let nib = UINib(nibName: "MenuGridItemCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "MenuGridItemCell")
    }
}
extension MenuViewController:
    UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return CoffeeData.coffees.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "MenuGridItemCell",
            for: indexPath
        ) as! MenuGridItemCell

        let item = CoffeeData.coffees[indexPath.item]
        cell.configure(with: item)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = (collectionView.frame.width - 48) / 2
        return CGSize(width: width, height: 240)
    }

    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {

        let selectedCoffee = CoffeeData.coffees[indexPath.item]

        let detailVC = storyboard?.instantiateViewController(
            withIdentifier: "CoffeeDetailViewController"
        ) as! CoffeeDetailViewController

        detailVC.coffee = selectedCoffee
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
