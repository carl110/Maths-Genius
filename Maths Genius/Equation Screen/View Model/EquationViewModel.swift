//
//  EquationViewModel.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 20/09/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

class EquationViewModel {
    
    let firstNumber: Int
    let secondNumber: Int
    let subject: String
    
    init (firstNumber: Int, secondNumber: Int, subject: String) {
        self.firstNumber = firstNumber
        self.secondNumber = secondNumber
        self.subject = subject
    }
    
}
