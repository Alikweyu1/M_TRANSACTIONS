//
//  textWidget.swift
//  M_TRANSACTIONS
//
//  Created by SOFTWARE on 05/04/2023.
//

import Foundation
import UIKit
class LineColor{
   var lineColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
}
struct Colors{
    var lineColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
    var color:LineColor
}
extension  UIView {
    
    func addBottomBorderLinewithColor(Color:UIColor,width:CGFloat){
        let borderline = CALayer()
        borderline.backgroundColor = Color.cgColor
        borderline.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
        borderline.shadowOffset = CGSize(width: 0, height: 3)
        borderline.shadowOpacity = 0.1
        borderline.shadowColor = UIColor.black.cgColor
        self.layer.addSublayer(borderline)
    }
    func verticalBorderLinewithColor(color: UIColor, width: CGFloat) {
            let border = CALayer()
            border.backgroundColor = color.cgColor
            border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
            self.layer.addSublayer(border)
        }
    func verticalBorderLineRightwithColor(color: UIColor, width: CGFloat) {
            let border = CALayer()
            border.backgroundColor = color.cgColor
        border.frame = CGRect(x: self.frame.size.width - width, y: 0, width: width, height: self.frame.size.height)
            self.layer.addSublayer(border)
        }
}
