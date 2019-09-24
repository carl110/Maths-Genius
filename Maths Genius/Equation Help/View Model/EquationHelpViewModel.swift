//
//  EquationHelpViewModel.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 20/09/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

class EquationHelpViewModel {
    
    let firstNumber: Int
    let secondNumber: Int
    let helpTitle: String
    
    init (firstNumber: Int, secondNumber: Int, helpTitle: String) {
        self.firstNumber = firstNumber
        self.secondNumber = secondNumber
        self.helpTitle = helpTitle
    }
    
    
}
