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
    @IBOutlet private weak var bottomView: UIView!
    @IBOutlet private weak var logoImageView: UIImageView!
    @IBOutlet private weak var gradientView: UIView!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setGradientView()
    }
    
    // MARK: - Private methods
    private func initUI() {
        bottomView.layer.backgroundColor = Constants.bottomViewColor
        passwordTextField.backgroundColor = Constants.spaceBlue
        loginTextField.backgroundColor = Constants.spaceBlue
        configurePlaceHolder(passwordTextField, placeHolderText: Constants.passwordTextFieldPlaceHolder)
        configurePlaceHolder(loginTextField, placeHolderText: Constants.loginTextFieldPlaceHolder)
        view.sendSubviewToBack(gradientView)
        view.sendSubviewToBack(logoImageView)
    }
    
    private func setGradientView() {
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 88)
        gradient.startPoint = Constants.gradientStartPoint
        gradient.endPoint = Constants.gradientEndPoint
        gradient.colors = [UIColor.clear.cgColor, Constants.bottomViewColor]
        gradient.locations = Constants.gradientLocations
        gradientView.layer.addSublayer(gradient)
    }
    
    private func configurePlaceHolder(_ textField: UITextField, placeHolderText: String) {
        textField.attributedPlaceholder = NSAttributedString(string: placeHolderText,
                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
    // MARK: - Constants
    private enum Constants {
//        Strings
        static let passwordTextFieldPlaceHolder = "Табельный номер"
        static let loginTextFieldPlaceHolder = "Логин"
        
//        Color
        static let bottomViewColor = UIColor(red: 0.035, green: 0.035, blue: 0.188, alpha: 1).cgColor
        static let spaceBlue = UIColor(red: 0.173, green: 0.176, blue: 0.518, alpha: 1)
        
//        Gradient
        static let gradientStartPoint = CGPoint(x: 0.0, y: 0.5)
        static let gradientEndPoint = CGPoint(x: 0.0, y: 1)
        static let gradientLocations: [NSNumber]? = [0.0, 1.0]
    }
}
