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

public enum SubjectType: String, CaseIterable {
    
    case Additions = "+"
    case Subtractions = "−"
    case Multiplications = "×"
    case Divisions = "÷"
    
    func name() -> String {
        return self.rawValue.titlecased()
    }
    
}

public enum HelpSubject {

    enum Additions: String, CaseIterable {
        case RoundingNumbers = "Rounding Numbers"
        case UsingPlaceValues = "Using Place Values"
        case HundredsSquare = "Hundreds Square"

    }
    enum Subtractions: String, CaseIterable {
        case SubtractByBorrowing = "Subtract by Borrowing"
    
 
    }
    enum Multiplications: String, CaseIterable {
        case PeopleAndSweets = "People and Sweets"
    

    }
    enum Divisions: String,CaseIterable {
        case LongDivision = "Long Division"
    

    }



}


