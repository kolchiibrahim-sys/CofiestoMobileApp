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

    @IBAction func loginTapped(_ sender: UIButton) {
        // user login oldu kimi qeyd edirik
        UserDefaults.standard.set(true, forKey: "isLoggedIn")
        goToMainApp()
    }

    func goToMainApp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tabBar = storyboard.instantiateViewController(
            withIdentifier: "MainTabBarController"
        )
        tabBar.modalPresentationStyle = .fullScreen
        present(tabBar, animated: true)
    }
}

