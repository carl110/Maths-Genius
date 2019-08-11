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
        self.font.withSize(16)
    }
    
    func subTitleLabelSetUp() {
        self.textColor = UIColor.Shades.standardWhite
        self.textAlignment = .left
        self.numberOfLines = 0
        self.font.withSize(10)
    }
}
