//
//  CoffeeDetailViewController.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 02.01.26.
//

import UIKit

class CoffeeDetailViewController: UIViewController {

    var coffee: Coffee?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = coffee?.name
    }
}
