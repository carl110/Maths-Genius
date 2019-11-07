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
        DispatchQueue.main.async { [weak self] in
            self?.backgroundColor = UIColor.Yellows.gryffindorYellow
            self?.textColor = UIColor.Reds.gryffindorRed
            //roundedcorners
            self?.layer.cornerRadius = SingletonClass.sharedInstance.cornerRoundingNumber
            self?.layer.masksToBounds = true
            //Auto adjust size of text as you type
            self?.font = .boldSystemFont(ofSize: (self?.frame.height)!)
            self?.textAlignment = .center
        }
        
    }
    
    func mySumNumberTextSetUp() {
        DispatchQueue.main.async { [weak self] in
            self?.backgroundColor = UIColor.Yellows.gryffindorYellow
            self?.textColor = UIColor.Reds.gryffindorRed
            //roundedcorners
            self?.roundCorners(for: [.bottomLeft, .bottomRight], cornerRadius: SingletonClass.sharedInstance.cornerRoundingNumber)
 
            //Auto adjust size of text as you type
            self?.font = .boldSystemFont(ofSize: (self?.frame.height)!)
            self?.textAlignment = .center
        }
        
    }
    
    //Check if UITextField is empty
    var isEmpty: Bool {
        return text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
    }
    
}
