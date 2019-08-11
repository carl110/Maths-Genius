//
//  UIButton+extensions.swift
//  Popcorn Swirl
//
//  Created by Carl Wainwright on 03/06/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    func centerTextHorizontally(spacing: CGFloat) {
        //adds spacing/padding to thew left and right
        titleEdgeInsets = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: spacing)
        //centers text
        self.titleLabel?.textAlignment = NSTextAlignment.center
    }
    
    func enableButton() {
        alpha = 1.0
        isEnabled = true
    }
    
    func disableButton() {
        alpha = 0.0
        isEnabled = false
    }
    
    func titleButtonSetup() {
        self.backgroundColor = UIColor.Reds.gryffindorRed
        self.setTitleColor(UIColor.Yellows.gryffindorYellow, for: .normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        self.centerTextHorizontally(spacing: 8)
        self.roundCorners(for: .allCorners, cornerRadius: 8)
    }
    
    func subTitleButtonSetup() {
        self.backgroundColor = UIColor.Yellows.gryffindorYellow
        self.setTitleColor(UIColor.Reds.gryffindorRed, for: .normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.centerTextHorizontally(spacing: 8)
        self.roundCorners(for: .allCorners, cornerRadius: 8)
        
    }
}
