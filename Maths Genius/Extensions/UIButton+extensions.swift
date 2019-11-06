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
        //adds spacing/padding to the left and right
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
        DispatchQueue.main.async { [weak self] in
            self?.backgroundColor = UIColor.Reds.gryffindorRed
            self?.setTitleColor(UIColor.Yellows.gryffindorYellow, for: .normal)
            self?.titleLabel?.font = UIFont.boldSystemFont(ofSize: (self?.frame.height)! / 1.2)
            self?.titleLabel?.adjustsFontSizeToFitWidth = true
            self?.centerTextHorizontally(spacing: 8)
            self?.contentVerticalAlignment = .center
            self?.roundCorners(for: .allCorners, cornerRadius: SingletonClass.sharedInstance.cornerRoundingNumber)
        }
        
    }
    
    func subTitleButtonSetup() {
        DispatchQueue.main.async { [weak self] in
            self?.backgroundColor = UIColor.Yellows.gryffindorYellow
            self?.setTitleColor(UIColor.Reds.gryffindorRed, for: .normal)
            self?.titleLabel?.font = UIFont.boldSystemFont(ofSize: (self?.frame.height)! / 2.5)
            self?.centerTextHorizontally(spacing: 8)
            self?.roundCorners(for: .allCorners, cornerRadius: SingletonClass.sharedInstance.cornerRoundingNumber)
            self?.titleLabel?.numberOfLines = 0
            self?.contentVerticalAlignment = .center
        }
        
        
    }
}
