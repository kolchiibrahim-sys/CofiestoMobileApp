//
//  LoginViewController.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 03.01.26.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginButtonTapped(_ sender: UIButton) {

        guard let storyboard = self.storyboard else {
            print("Storyboard is nil")
            return
        }

        guard let menuVC = storyboard.instantiateViewController(
            withIdentifier: "MenuViewController"
        ) as? MenuViewController else {
            print("MenuViewController ID tapılmadı")
            return
        }

        let nav = UINavigationController(rootViewController: menuVC)
        nav.modalPresentationStyle = .fullScreen

        present(nav, animated: true)
    }
}
