//
//  CustomButton.swift
//  Team_UP
//
//  Created by Николай Вольников on 05.06.2021.
//

import Foundation
import UIKit
import SnapKit

enum ImageType {
    case add, library, data, arrow
}

protocol CustomButtonDelegate: class {
    func didTapButton(_ title: String)
}

final class CustomButton: UIButton {
    @IBOutlet private weak var imgView: UIImageView!
    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var actionButtonOutlet: UIButton!
    
    weak var delegate: CustomButtonDelegate?

    // MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame)
        awakeFromNib()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        let bundle = Bundle(for: type(of: self))

        guard let buttonView = bundle.loadNibNamed(Constants.name, owner: self, options: nil)?.first as? UIView else {
            return
        }

        buttonView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(buttonView)
        
        buttonView.snp.makeConstraints {
            $0.centerY.equalTo(self)
        }
        
        actionButtonOutlet.snp.makeConstraints {
            $0.height.width.equalTo(buttonView)
        }
        title.textColor = Constants.textColor
        backgroundColor = .clear
        actionButtonOutlet.setCornerRadius(amount: 16, withBorderAmount: 1, andColor: Constants.buttonBorderColor)
    }
    
    func configureButton(_ title: String, imageType: ImageType) {
        self.title.text = title
        switch imageType {
        case .add:
            imgView.image = Constants.addCoverImage
        case .arrow:
            imgView.image = Constants.arrowImage
        case .data:
            imgView.image = Constants.dataImage
        case .library:
            imgView.image = Constants.libraryImage
        }
    }
    
    @IBAction func tapActionButton(_ sender: Any) {
        guard let text = title.text else {
            return
        }
        
        delegate?.didTapButton(text)
    }
    
    private enum Constants {
        static let name = "CustomButton"
        
        // Color
        static let textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        static let buttonBorderColor = UIColor(red: 0.918, green: 0.337, blue: 0.086, alpha: 1)
        
        // Image
        static let addCoverImage = UIImage(named: "ic_add")
        static let arrowImage = UIImage(named: "ic_arrow")
        static let dataImage = UIImage(named: "ic_data")
        static let libraryImage = UIImage(named: "ic_library")
    }
}
