//
//  SubtractionsHelp+extensions.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 24/09/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
   
    func subtractByBorrowing(firstNumber: Int, secondNumber: Int) -> [String] {
        
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
        var fnUnit = firstNumberArray[3]
        var fnTen = firstNumberArray[2]
        var fnHund = firstNumberArray[1]
        var fnThou = firstNumberArray[0]
        let snUnit = secondNumberArray[3]
        let snTen = secondNumberArray[2]
        let snHund = secondNumberArray[1]
        let snThou = secondNumberArray[0]
        
        
        
        var exampleText = ["Using the eqaution\n\(firstNumber) - \(secondNumber)\nyou can do the following :\n",
            "T | H | T | U",
            "-------------",
            "\(fnThou) | \(fnHund) | \(fnTen) | \(fnUnit)",
            "\(snThou) | \(snHund) | \(snTen) | \(snUnit)\n"]
        
        if fnUnit > 0 || snUnit > 0 {
            
            if fnUnit < snUnit {
                fnUnit += 10
                fnTen -= 1
                exampleText.append("The first number unit is smaller than the second number unit, so lets borrow a 1 from the tens")
            } else {
                exampleText.append("The second number unit can easily be subtracted from the first number unit. So lets do that.")
            }
            exampleText.append(contentsOf: ["T | H | T | U",
                                            "-------------",
                                            "\(fnThou) | \(fnHund) | \(fnTen) | \(fnUnit)",
                "\(snThou) | \(snHund) | \(snTen) | \(snUnit)",
                "-------------",
                "\(fnUnit) - \(snUnit) = \(fnUnit - snUnit)",
                "-------------",
                "0 | 0 | 0 | \(fnUnit - snUnit)\n",])
        }
        
        if fnTen > 0 || snTen > 0 {
            
            if fnTen < snTen {
                fnTen += 10
                fnHund -= 1
                exampleText.append("The first number tens is smaller than the second number tens, so lets borrow a 1 from the hundreds")
                
            } else {
                exampleText.append("The second number tens can easily be subtracted from the first number tens. So lets do that.")
            }
            exampleText.append(contentsOf: ["T | H | T | U",
                                            "-------------",
                                            "\(fnThou) | \(fnHund) | \(fnTen) | \(fnUnit)",
                "\(snThou) | \(snHund) | \(snTen) | \(snUnit)",
                "-------------",
                "\(fnTen) - \(snTen) = \(fnTen - snTen)",
                "-------------",
                "0 | 0 | \(fnTen - snTen) | 0\n",])
            
        }
        
        if fnHund > 0 || snHund > 0 {
            
            if fnHund < snHund {
                fnHund += 10
                fnThou -= 1
                exampleText.append("The first number hundreds is smaller than the second number hundreds, so lets borrow a 1 from the hundreds")
            } else {
                exampleText.append("The second number hundres can easily be subtracted from the first number hundreds. So lets do that.")
            }
            exampleText.append(contentsOf: ["T | H | T | U",
                                            "-------------",
                                            "\(fnThou) | \(fnHund) | \(fnTen) | \(fnUnit)",
                "\(snThou) | \(snHund) | \(snTen) | \(snUnit)",
                "-------------",
                "\(fnHund) - \(snHund) = \(fnHund - snHund)",
                "-------------",
                "0 | \(fnHund - snHund) | 0 | 0\n"])
            
        }
        
        if fnThou > 0 || snThou > 0 {
            exampleText.append("The second number thousands can easily be subtracted from the first number thousands. So lets do that.")
            
            exampleText.append(contentsOf: ["T | H | T | U",
                                            "-------------",
                                            "\(fnThou) | \(fnHund) | \(fnTen) | \(fnUnit)",
                "\(snThou) | \(snHund) | \(snTen) | \(snUnit)",
                "-------------",
                "\(fnThou) - \(snThou) = \(fnThou - snThou)",
                "-------------",
                "\(fnThou - snThou) | 0 | 0 | 0\n"])
            
        }
        
        exampleText.append(contentsOf: ["Now you should have something like this",
                                        "T | H | T | U",
                                        "-------------",
                                        "\(fnThou) | \(fnHund) | \(fnTen) | \(fnUnit)",
            "\(snThou) | \(snHund) | \(snTen) | \(snUnit)",
            "-------------",
            "0 | 0 | 0 | \(fnUnit - snUnit)",
            "0 | 0| \(fnTen - snTen) | 0",
            "0 | \(fnHund - snHund) | 0 | 0",
            "\(fnThou - snThou) | 0 | 0 | 0",
            "-------------",
            "\(fnThou - snThou) | \(fnHund - snHund) | \(fnTen - snTen) | \(fnUnit - snUnit)",
            "-------------",
            "\(firstNumber) - \(secondNumber) = \(firstNumber - secondNumber)"])
        
        exampleText = [exampleText.joined(separator: "\n")]
        
        return exampleText
    }
    
}


