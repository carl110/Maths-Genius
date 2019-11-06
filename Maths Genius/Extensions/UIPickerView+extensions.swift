//
//  UIPickerView+extensions.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 06/11/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

extension UIPickerView {
    
    func pickerViewSetUp() {
        
        self.backgroundColor = UIColor.Yellows.gryffindorYellow
        self.roundCorners(for: .allCorners, cornerRadius: SingletonClass.sharedInstance.cornerRoundingNumber)
    
    }
    
}


//func numberTextSetUp() {
//    DispatchQueue.main.async { [weak self] in
//        self?.backgroundColor = UIColor.Yellows.gryffindorYellow
//        self?.textColor = UIColor.Reds.gryffindorRed
//        //roundedcorners
//        self?.layer.cornerRadius = 8
//        self?.layer.masksToBounds = true
//        //Auto adjust size of text as you type
//        self?.font = .boldSystemFont(ofSize: (self?.frame.height)!)
//        self?.textAlignment = .center
//    }
//
