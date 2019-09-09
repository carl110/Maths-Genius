//
//  UILabels+extensions.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 11/08/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    func titleLabelSetUp() {
        self.textColor = UIColor.Shades.standardWhite
        self.textAlignment = .center
        self.numberOfLines = 0
        self.font.withSize(40)
    }
    
    func subTitleLabelSetUp() {
        self.textColor = UIColor.Shades.standardWhite
        self.textAlignment = .left
        self.numberOfLines = 0
        self.lineBreakMode = .byWordWrapping
        self.font.withSize(10)
    }
    
    func numberLabelSetup() {
        self.backgroundColor = UIColor.Reds.gryffindorRed
        self.textColor = UIColor.Yellows.gryffindorYellow
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
        self.setSizeFont(sizeFont: self.frame.height)
//        self.textAlignment = .center
//        self.roundCorners(for: .allCorners, cornerRadius: 8)
//        self.roundCorners(for:[.topLeft, .topRight], cornerRadius: 8)
    }
    
    func setSizeFont (sizeFont: CGFloat) {
        self.font =  UIFont(name: self.font.fontName, size: sizeFont)!
        self.sizeToFit()
    }
}
