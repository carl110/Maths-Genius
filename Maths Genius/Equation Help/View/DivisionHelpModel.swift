//
//  DivisionHelpModel.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 23/10/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

class DivisionHelpModel {
    
    let longDivisionStepText = ["First lest change the way this equations looks to make it easier.\nLets use a Long Division Braket. Put the dividend (the number to be divided) inside of the Long Division Bracket and the divisor (the number used to divide the dividend) in fron t of the Long Division Bracket",
                                "Now we have the equations written in a Long Division Bracket, lets start by looking at the largest place value on the dividend.\nHere we will multiply the divisor until it equals the largest place value number in the dividend, or you have multiplied as many times as you can before the divisor is larger than the largest place value number in the dividend.",
                                "If the Now the number you used to multiply the divisor by can be placed above the Long Division Bracket in the same plave value location as the place value of the dividend you were working with.\nTake the largest number you were able to multiply the divisor to and minus that from the place value number in the dividend you were working with. Place this number in the place value position below the Long Division Bracket and plce the next place value number to the right in the Dividend nest to it to create a new equation.",
                                "You now complete the above steps with the new equation, first see how many times can you multiple the divisor to either equal the new number, or the largest number before the multiplication is larger than the new equation",
                                "Now place the number used to multiply the divisor above the original equation in the next place value position",
                                "This can all be written in one column, as per below. ",
                                "This method can be used on larger equations, as shown below.\nRemeber to start with the larget place value of the dividend and multiply the divisor, then use the outcome to work out the next part of the equation."]
    
    let longDivisionStepImage: [UIImage] = [UIImage(named: "longDivisionStep1")!,
                                            UIImage(named: "longDivisionStep2")!,
                                            UIImage(named: "longDivisionStep3")!,
                                            UIImage(named: "longDivisionStep4")!,
                                            UIImage(named: "longDivisionStep5")!,
                                            UIImage(named: "longDivisionStep6")!,
                                            UIImage(named: "longDivisionStep7")!]
    
}
