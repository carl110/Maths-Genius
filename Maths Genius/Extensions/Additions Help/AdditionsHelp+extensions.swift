//
//  AdditionsHelp+extensions.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 24/09/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func roundNumber(firstNumber: Int, secondNumber: Int) -> [String] {

        
        let firstNumberRound = 10 - firstNumber.digits.last
        let secondNumberRound = 10 - secondNumber.digits.last
        
        let exampleText = "Using the equation \(firstNumber) + \(secondNumber) we can do the following : \n\nAdd \(firstNumberRound) the \(firstNumber)\nAdd \(secondNumberRound) to \(secondNumber)\n\nYour new equation is \(firstNumberRound + firstNumber) + \(secondNumberRound + secondNumber)\n\n\(firstNumberRound + firstNumber) + \(secondNumberRound + secondNumber) = \(firstNumberRound + firstNumber + secondNumberRound + secondNumber)\nThe numbers added to make the round equation are \(firstNumberRound) + \(secondNumberRound) = \(firstNumberRound + secondNumberRound)\n\nNow take the equated round number and minus the added numbers\n\n\(firstNumberRound + firstNumber + secondNumberRound + secondNumber) - \(firstNumberRound + secondNumberRound) = \(firstNumber + secondNumber)"
        
        return [exampleText]
    }
    
    func usingPlaceValues(firstNumber: Int, secondNumber: Int) -> [String] {
        
        //create an array of the numbers
        var firstNumberArray = firstNumber.digits
        var secondNumberArray = secondNumber.digits
        
        //using the arays, if the numbers are less that 1000 add preceeding 0's for readability
        while 4 - firstNumberArray.count > 0 {
            firstNumberArray.insert(0, at: 0)
        }
        while 4 - secondNumberArray.count > 0 {
            secondNumberArray.insert(0, at: 0)
        }
        
        //Split numbers into their place values
        let fnUnit = firstNumberArray[3]
        let fnTen = firstNumberArray[2] * 10
        let fnHund = firstNumberArray[1] * 100
        let fnThou = firstNumberArray[0] * 1000
        let snUnit = secondNumberArray[3]
        let snTen = secondNumberArray[2] * 10
        let snHund = secondNumberArray[1] * 100
        let snThou = secondNumberArray[0] * 1000

        
        //If first and second number is more than 9 or 99 etc then add all values at that point and below together to get figure. Else if number contains numbers at place value just use those 2 digits
        
        //Intor and unit calculations
        var exampleText = ["Using the equation \(firstNumber) + \(secondNumber) we can do the following : \n\n \(String(format: "%04d", firstNumber))\n+\(String(format: "%04d", secondNumber))\n------\n  \(String(format: "%04d", (fnUnit + snUnit).digits.last))"]
        
        //Tens calculation
        if fnUnit + snUnit > 9 {
            exampleText.append("   - Add the 10 to the next row\n  \(String(format: "%04d", ((fnTen + snTen) + (((fnUnit + snUnit).digits[0]) * 10)).digits.secondToLast * 10))")
        } else if firstNumber.digits.count > 1 || secondNumber.digits.count > 1 || (fnUnit + snUnit).digits.count  > 1 {
            exampleText.append("\n  \(String(format: "%04d", (fnTen + snTen).digits.secondToLast * 10))")

        }
        
        //Hundres calculation
        if fnTen + snTen + fnUnit + snUnit > 99 {
            exampleText.append("   - Add the 100 to the next row\n  \(String(format: "%04d", ((fnHund + snHund) + (((fnTen + snTen + fnUnit + snUnit).digits[0]) * 100)).digits.thirdToLast * 100))")
        } else if (firstNumber + secondNumber).digits.count > 2 {
            exampleText.append("\n \(String(format: "%04d", (fnHund + snHund).digits.thirdToLast * 100))")
        }
        
        //Thousdands calculation
        if fnHund + snHund + fnTen + snTen + fnUnit + snUnit > 999 {
            exampleText.append("   - Add the 1000 to the next row\n  \(String(format: "%04d", (((fnThou + snThou) + (((fnHund + snHund + fnTen + snTen + fnUnit + snUnit).digits[0]) * 1000)).digits.fourthToLast * 1000)))")
        } else if (firstNumber + secondNumber).digits.count > 3 {
            exampleText.append("\n  \(String(format: "%04d", (fnThou + snThou).digits.fourthToLast * 1000))")
        }
        
        //Ten thousands calculation
        if fnThou + snThou + fnHund + snHund + fnTen + snTen + fnUnit + snUnit > 9999 {
            exampleText.append("   - Add the 10000 to the next row\n \(String(format: "%04d", ((fnThou + snThou) + (((fnHund + snHund).digits[0]))*1000).digits.fithToLast * 10000)) - This is Ten Thousands")
        }
        
        //Sum of equation
        exampleText.append("\n\nNow add the numbers from the first to last row. And your answer should be : \n\n\(firstNumber + secondNumber)")
        
        return exampleText
    }
    
}
