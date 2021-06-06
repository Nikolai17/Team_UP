//
//  CreatingCompetitionViewController.swift
//  Team_UP
//
//  Created by Николай Вольников on 05.06.2021.
//

import Foundation
import UIKit
import GrowingTextView

final class CreatingCompetitionViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var nameEventTextView: GrowingTextView!
    @IBOutlet private weak var descriptionTextView: GrowingTextView!
    @IBOutlet private weak var detailsTextView: GrowingTextView!
    @IBOutlet private weak var addressTextView: GrowingTextView!
    
    @IBOutlet private weak var sportsTypeButton: CustomButton!
    @IBOutlet private weak var addCoverButton: CustomButton!
    @IBOutlet private weak var dateButton: CustomButton!
    @IBOutlet private weak var photoLibrary: CustomButton!
    @IBOutlet private weak var continueButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(
                title: nil, style: .plain, target: nil, action: nil)
    }
    
    @IBAction func didTapOnContinueButton(_ sender: Any) {
        navigationController?.pushViewController(DetailCompetitionViewController(state: .create), animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    // MARK: - Private Methods
    private func initUI() {
        nameEventTextView.delegate = self
        descriptionTextView.delegate = self
        detailsTextView.delegate = self
        addressTextView.delegate = self
        automaticallyAdjustsScrollViewInsets = false
        
        nameEventTextView.setCornerRadius(amount: 16, withBorderAmount: 0, andColor: .clear)
        descriptionTextView.setCornerRadius(amount: 16, withBorderAmount: 0, andColor: .clear)
        detailsTextView.setCornerRadius(amount: 16, withBorderAmount: 0, andColor: .clear)
        addressTextView.setCornerRadius(amount: 16, withBorderAmount: 0, andColor: .clear)
        
        nameEventTextView.backgroundColor = Constants.spaceBlue
        descriptionTextView.backgroundColor = Constants.spaceBlue
        detailsTextView.backgroundColor = Constants.spaceBlue
        addressTextView.backgroundColor = Constants.spaceBlue
        
        nameEventTextView.textColor = .white
        descriptionTextView.textColor = .white
        detailsTextView.textColor = .white
        addressTextView.textColor = .white
        
        let insets = UIEdgeInsets(top: 15, left: 10, bottom: 0, right: 10)
        nameEventTextView.textContainerInset = insets
        descriptionTextView.textContainerInset = insets
        detailsTextView.textContainerInset = insets
        addressTextView.textContainerInset = insets
        
        nameEventTextView.placeholderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        nameEventTextView.minHeight = Constants.minHeight
        
        descriptionTextView.placeholderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        descriptionTextView.minHeight = Constants.minHeightV2
        
        detailsTextView.placeholderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        detailsTextView.minHeight = Constants.minHeightV2
        
        addressTextView.placeholderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        addressTextView.minHeight = Constants.minHeight
        
        navigationItem.title = Constants.navigationTitle
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 22),
            NSAttributedString.Key.foregroundColor : UIColor.white
        ]

        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.tintColor = .white
        
        photoLibrary.delegate = self
        sportsTypeButton.delegate = self
        addCoverButton.delegate = self
        dateButton.delegate = self
        
        photoLibrary.configureButton(Constants.library, imageType: .library)
        sportsTypeButton.configureButton(Constants.sportsType, imageType: .arrow)
        addCoverButton.configureButton(Constants.addCover, imageType: .add)
        dateButton.configureButton(Constants.date, imageType: .data)
        
        continueButton.setCornerRadius(amount: 16, withBorderAmount: 0, andColor: .clear)
        continueButton.backgroundColor = Constants.continueButtonColor
    }
    
    // MARK: - Constants
    private enum Constants {
        static let spaceBlue = UIColor(red: 0.173, green: 0.176, blue: 0.518, alpha: 1)
        static let continueButtonColor = UIColor(red: 0.918, green: 0.337, blue: 0.086, alpha: 1)
        static let navigationTitle = "Создание соревнования"
        static let minHeight: CGFloat = 45.0
        static let minHeightV2: CGFloat = 62.0
        static let library = "Фотогалерея"
        static let sportsType = "Вид спорта"
        static let addCover = "Добавить обложку"
        static let date = "Дата"
    }
}

extension CreatingCompetitionViewController: GrowingTextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        
    }
}

extension CreatingCompetitionViewController: CustomButtonDelegate {
    func didTapButton(_ title: String) {
    // Открытие элементов, смотрим по названию кнопки
    }
}
