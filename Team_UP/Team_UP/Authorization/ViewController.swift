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
        
    }
    @objc func dismissKeyboard(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc private func keyboardWillHide() {
        if keyboardDismissTapGesture != nil {
            view.removeGestureRecognizer(keyboardDismissTapGesture!)
            keyboardDismissTapGesture = nil
        }
    }
    
    
    // MARK: - Constants
    private enum Constants {
        //        Strings
        static let passwordTextFieldPlaceHolder = "Пароль"
        static let loginTextFieldPlaceHolder = "Табельный номер"
        static let openEyeImage = "ic_open_eye"
        static let hideEyeImage = "ic_hide_eye"
        
        //        Color
        static let bottomViewColor = UIColor(red: 0.035, green: 0.035, blue: 0.188, alpha: 1).cgColor
        static let spaceBlue = UIColor(red: 0.173, green: 0.176, blue: 0.518, alpha: 1)
        static let continueButtonColor = UIColor(red: 0.918, green: 0.337, blue: 0.086, alpha: 1)
    }
}
