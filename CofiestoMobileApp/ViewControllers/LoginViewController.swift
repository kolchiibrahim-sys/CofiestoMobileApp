//
//  LoginViewController.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 03.01.26.
//

import UIKit

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginButtonTapped(_ sender: UIButton) {
        let menuVC = storyboard?.instantiateViewController(
            withIdentifier: "MenuViewController"
        ) as! MenuViewController

        let nav = UINavigationController(rootViewController: menuVC)
        nav.modalPresentationStyle = .fullScreen

        present(nav, animated: true)
    }
}
