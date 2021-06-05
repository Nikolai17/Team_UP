//
//  ViewController.swift
//  Team_UP
//
//  Created by Николай Вольников on 04.06.2021.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var psbLabel: UILabel!
    @IBOutlet private weak var logoImageView: UIImageView!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginTextField: UITextField!
    @IBOutlet private weak var continueButton: UIButton!
    @IBOutlet private weak var eyeImageView: UIImageView!
    
    // MARK: - Property
    private var keyboardDismissTapGesture: UIGestureRecognizer?
    
    
    @IBAction func tapOnEyeInSecureTextField(_ sender: Any) {
        passwordTextField.isSecureTextEntry.toggle()
        resetEyeImageView()
    }
    
    @IBAction func tapOnContinueButton(_ sender: Any) {
        guard let login = loginTextField.text, let pass = passwordTextField.text else {
            showAlert(Constants.alertMessage)
            return
        }

        Auth.auth().signIn(withEmail: login, password: pass) { (response, error) in
            if error == nil {
                let defaults = UserDefaults.standard
                if login == "admin@admin.ru" {
                    defaults.set(true, forKey: "isAdmin")
                } else {
                    defaults.set(false, forKey: "isAdmin")
                }
                self.present(MainTabBarViewController(), animated: true)
            } else {
                self.showAlert(Constants.failureAuthAlert)
            }
        }
    }
    
    private func resetEyeImageView() {
        passwordTextField.isSecureTextEntry
            ? (eyeImageView.image = UIImage(named: Constants.hideEyeImage))
            : (eyeImageView.image = UIImage(named: Constants.openEyeImage))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        registerForKeyboardNotification()
    }
    
    // MARK: - Private methods
    private func initUI() {
        loginTextField.delegate = self
        passwordTextField.delegate = self
        
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
    
    private func showAlert(_ message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Constants.titleAlertAction, style:  .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Helpers
    
    //  Обработка появления клавиатуры
    private func registerForKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: - Selectors
    @objc private func keyboardWillShow(_ notification: Notification) {
        if keyboardDismissTapGesture == nil {
            keyboardDismissTapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard(sender:)))
            keyboardDismissTapGesture?.cancelsTouchesInView = false
            view.addGestureRecognizer(keyboardDismissTapGesture!)
        }
        
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height - (view.frame.maxY - continueButton.frame.maxY)
            }
        }
    }
    
    @objc func dismissKeyboard(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc private func keyboardWillHide() {
        if keyboardDismissTapGesture != nil {
            view.removeGestureRecognizer(keyboardDismissTapGesture!)
            keyboardDismissTapGesture = nil
        }
        
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    
    // MARK: - Constants
    private enum Constants {
        //        Strings
        static let passwordTextFieldPlaceHolder = "Пароль"
        static let loginTextFieldPlaceHolder = "Табельный номер"
        static let openEyeImage = "ic_open_eye"
        static let hideEyeImage = "ic_hide_eye"
        static let alertMessage = "Извините, произошла ошибка"
        static let successAuthAlert = "Успешная авторизация!"
        static let failureAuthAlert = "Неверные данные"
        static let titleAlertAction = "OK"
        static let dataBaseGroup = "users"
        static let login = "login"
        static let password = "password"
        
        //        Color
        static let bottomViewColor = UIColor(red: 0.035, green: 0.035, blue: 0.188, alpha: 1).cgColor
        static let spaceBlue = UIColor(red: 0.173, green: 0.176, blue: 0.518, alpha: 1)
        static let continueButtonColor = UIColor(red: 0.918, green: 0.337, blue: 0.086, alpha: 1)
    }
}

extension ViewController: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let login = loginTextField.text, let pass = passwordTextField.text else {
            showAlert(Constants.alertMessage)
            return true
        }

        Auth.auth().signIn(withEmail: login, password: pass) { (response, error) in
            if error == nil {
                let defaults = UserDefaults.standard
                if login == "admin@admin.ru" {
                    defaults.set(true, forKey: "isAdmin")
                } else {
                    defaults.set(false, forKey: "isAdmin")
                }
                self.present(MainTabBarViewController(), animated: true)
            } else {
                self.showAlert(Constants.failureAuthAlert)
            }
        }

        return true
    }
}
