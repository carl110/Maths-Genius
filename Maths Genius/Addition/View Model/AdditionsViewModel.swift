//
//  AdditionsViewModel.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 09/08/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

class AdditionsViewModel {
    
    let firstNumber: Int
    let secondNumber: Int
    let subject: String
    
    init (firstNumber: Int, secondNumber: Int, subject: String) {
        self.firstNumber = firstNumber
        self.secondNumber = secondNumber
        self.subject = subject
    }
    
}
