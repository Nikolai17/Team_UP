//
//  UIView.swift
//  Team_UP
//
//  Created by Николай Вольников on 05.06.2021.
//

import Foundation
import UIKit

extension UIView {

   func setCornerRadius(amount: CGFloat, withBorderAmount borderWidthAmount: CGFloat, andColor borderColor: UIColor) {
        self.layer.cornerRadius = amount
        self.layer.borderWidth = borderWidthAmount
        self.layer.borderColor = borderColor.cgColor
        self.layer.masksToBounds = true
    }
}
