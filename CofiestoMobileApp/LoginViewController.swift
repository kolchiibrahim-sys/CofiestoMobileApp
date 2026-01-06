//
//  LoginViewController.swift
//  CofiestoMobileApp
//
//  Created by Kolchı Ibrahım on 07.01.26.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    private func configureUI() {
        loginButton.layer.cornerRadius = 12
    }

    @IBAction func loginButtonTapped(_ sender: UIButton) {
        goToMainScreen()
    }

    private func goToMainScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBar = storyboard.instantiateViewController(
            withIdentifier: "MainTabBarController"
        )
        mainTabBar.modalPresentationStyle = .fullScreen
        present(mainTabBar, animated: true)
    }
}
