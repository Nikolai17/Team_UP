//
//  ViewController.swift
//  Team_UP
//
//  Created by Николай Вольников on 04.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var psbLabel: UILabel!
    @IBOutlet private weak var logoImageView: UIImageView!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginTextField: UITextField!
    @IBOutlet private weak var continueButton: UIButton!
    @IBOutlet private weak var eyeImageView: UIImageView!
    
    @IBAction func tapOnEyeInSecureTextField(_ sender: Any) {
        passwordTextField.isSecureTextEntry.toggle()
        resetEyeImageView()
    }
    
    @IBAction func tapOnContinueButton(_ sender: Any) {
        present(MainTabBarViewController(), animated: true)
    }
    
    private func resetEyeImageView() {
        passwordTextField.isSecureTextEntry
            ? (eyeImageView.image = UIImage(named: Constants.hideEyeImage))
            : (eyeImageView.image = UIImage(named: Constants.openEyeImage))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    // MARK: - Private methods
    private func initUI() {
        passwordTextField.backgroundColor = Constants.spaceBlue
        loginTextField.backgroundColor = Constants.spaceBlue
        passwordTextField.setCornerRadius(amount: 16, withBorderAmount: 0, andColor: Constants.spaceBlue)
        loginTextField.setCornerRadius(amount: 16, withBorderAmount: 0, andColor: Constants.spaceBlue)
        configurePlaceHolder(passwordTextField, placeHolderText: Constants.passwordTextFieldPlaceHolder)
        configurePlaceHolder(loginTextField, placeHolderText: Constants.loginTextFieldPlaceHolder)
        continueButton.backgroundColor = Constants.continueButtonColor
        continueButton.setTitleColor(.white, for: .normal)
        continueButton.setCornerRadius(amount: 16, withBorderAmount: 0, andColor: Constants.continueButtonColor)
    }
    
    private func configurePlaceHolder(_ textField: UITextField, placeHolderText: String) {
        textField.attributedPlaceholder = NSAttributedString(string: placeHolderText,
                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
    // MARK: - Constants
    private enum Constants {
//        Strings
        static let passwordTextFieldPlaceHolder = "Табельный номер"
        static let loginTextFieldPlaceHolder = "Пароль"
        static let openEyeImage = "ic_open_eye"
        static let hideEyeImage = "ic_hide_eye"
        
//        Color
        static let bottomViewColor = UIColor(red: 0.035, green: 0.035, blue: 0.188, alpha: 1).cgColor
        static let spaceBlue = UIColor(red: 0.173, green: 0.176, blue: 0.518, alpha: 1)
        static let continueButtonColor = UIColor(red: 0.918, green: 0.337, blue: 0.086, alpha: 1)
    }
}
