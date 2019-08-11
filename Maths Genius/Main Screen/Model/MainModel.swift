//
//  MainModel.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 09/08/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

class MainModel {
    
    let courseTitles = ["Addition", "Subtraction", "Multiplication", "Division"]
    
}

public enum Subject: String {
    
    case Additions
    case Subtractions
    case Multiplications
    case Divisions
    
    func name() -> String {
        return self.rawValue.titlecased()
    }
    
}
