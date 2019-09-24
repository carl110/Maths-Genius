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

public enum SubjectType: String {
    
    case Additions
    case Subtractions
    case Multiplications
    case Divisions
    
    func name() -> String {
        return self.rawValue.titlecased()
    }
    
}

public enum HelpSubject {

    enum Additions: String {
        case RoundingNumbers
        case UsingPlaceValues
        
        func name() -> String {
            return self.rawValue.titlecased()
        }
    }
    enum Subtractions: String {
        case SubtractByBorrowing
    
        func name() -> String {
            return self.rawValue.titlecased()
        }
    }
    enum Multiplication: String {
        case PlaceHolder
    
        func name() -> String {
            return self.rawValue.titlecased()
        }
    }
    enum Division: String {
        case PlaceHolder
    
        func name() -> String {
            return self.rawValue.titlecased()
        }
    }



}


