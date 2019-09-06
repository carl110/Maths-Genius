//
//  UITextFields+extensions.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 29/08/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
    func numberTextSetUp() {
        self.backgroundColor = UIColor.Yellows.gryffindorYellow
        self.textColor = UIColor.Reds.gryffindorRed
        //roundedcorners
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
        self.font = .boldSystemFont(ofSize: self.frame.height)
        self.textAlignment = .center
    }
    

}
