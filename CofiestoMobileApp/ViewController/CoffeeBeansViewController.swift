//
//  BeansViewController.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 07.01.26.
//
import UIKit

class CoffeeBeansViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    let beans: [CoffeeBean] = [
        .init(name: "Ethiopia", flavors: "Floral · Citrus", region: "Africa", image: "images"),
        .init(name: "Kenya", flavors: "Berry · Blackcurrant", region: "Africa",image: "images-1"),
        .init(name: "Rwanda", flavors: "Tea-like · Sweet", region: "Africa",image: "images-2"),
        .init(name: "Burundi", flavors: "Pear · Floral", region: "Africa",image: "images-3"),
        .init(name: "Tanzania", flavors: "Citrus · Bright", region: "Africa",image: "images-4"),

        .init(name: "Brazil", flavors: "Chocolate · Nutty", region: "South America",image: "images-5"),
        .init(name: "Colombia", flavors: "Balanced · Sweet", region: "South America",image: "images-6"),
        .init(name: "Peru", flavors: "Clean · Smooth", region: "South America",image: "images-7"),
        .init(name: "Bolivia", flavors: "Sweet · Delicate", region: "South America",image: "images-8"),

        .init(name: "Guatemala", flavors: "Nutty · Cocoa", region: "Central America",image: "images-9"),
        .init(name: "Costa Rica", flavors: "Honey · Bright", region: "Central America",image: "images-10"),
        .init(name: "El Salvador", flavors: "Chocolate · Sweet", region: "Central America",image: "images-11"),
        .init(name: "Honduras", flavors: "Sweet · Mild", region: "Central America",image: "images-12"),
        .init(name: "Nicaragua", flavors: "Mild · Nutty", region: "Central America",image: "images-13"),

        .init(name: "Indonesia", flavors: "Earthy · Spicy", region: "Asia-Pacific",image: "images-14"),
        .init(name: "Papua New Guinea", flavors: "Tropical · Sweet", region: "Asia-Pacific",image: "images-15"),
        .init(name: "Vietnam", flavors: "Chocolate · Heavy", region: "Asia-Pacific",image: "images-16"),
        .init(name: "Yemen", flavors: "Winey · Raisin", region: "Arabia",image: "images-17")
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Coffee Beans"

        setupCollectionView()
    }

    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.register(
            UINib(nibName: "CoffeeBeanCell", bundle: nil),
            forCellWithReuseIdentifier: "CoffeeBeanCell"
        )

        collectionView.backgroundColor = .systemGroupedBackground
    }
}

extension CoffeeBeansViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return beans.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CoffeeBeanCell", for: indexPath) as! CoffeeBeanCell
        let item = beans[indexPath.item]

        cell.titleLabel.text = item.name
        // Attempt to use an image asset named after the bean; fall back to a placeholder
        if let image = UIImage(named: item.name) {
            cell.logoImageView.image = image
        } else {
            cell.logoImageView.image = UIImage(systemName: "cup.and.saucer")
        }
        cell.flavorLabel.text = item.flavors

        return cell
    }
}

extension CoffeeBeansViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let spacing: CGFloat = 12
        let width = (collectionView.bounds.width - spacing * 3) / 2
        return CGSize(width: width, height: 140)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
    }
}


extension CoffeeBeansViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let bean = beans[indexPath.item]

        let vc = storyboard?.instantiateViewController(withIdentifier: "RegionViewController") as! RegionViewController
        vc.bean = bean
        navigationController?.pushViewController(vc, animated: true)
    }
}

