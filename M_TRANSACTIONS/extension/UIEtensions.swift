//
//  UIEtensions.swift
//  M_TRANSACTIONS
//
//  Created by SOFTWARE on 09/04/2023.
//

import Foundation
import UIKit
extension UIView{
    func round(_ radius:CGFloat = 10){
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    func addBordre(color:UIColor,with:CGFloat){
        self.layer.borderWidth = with
        self.layer.borderColor = color.cgColor
    }
}
