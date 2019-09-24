//
//  AdditionsHelpModel.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 24/09/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

class AdditionsHelpModel {
    
    let roundingNumberStepText = ["It can be much easier to add numbers that are multiples of ten.\nTo do this first you need to round up your number to the nearest 10. And write down how much you rounded the number by.\nIf you have larger numbers you can also round to the nearest hundred, or even thousand\nStart by rounding the numbers to the nearest 10 to make an easier equation.\nRemeber to write down how much you added to each number.",
                                  "Now add those extra numbers together and take them away from the rounded calculation you have made",
                                  "Round the numbers to the closest 10, 100, 1000 you feel comfortable with."]
    
    let roundingNumberStepImage: [UIImage] = [UIImage(named: "roundingNumberStep1")!,
                                              UIImage(named: "roundingNumberStep2")!,
                                              UIImage(named: "roundingNumberStep3")!]
    
    let usingPlaceValuesStepText = ["Understand what the place values are: \n*The number furtherst to the right is the 'Units' \n*The next number to the left is called the 'Tens' \n*The number to the left of the tens is the 'Hundreds' \n*The number to the left of the hundreds is the 'Thousands'",
                                    "Write your numbers so one is on top of the other, as shown below. Ensuring the place values are lined up correctly.",
                                    "If one number contains less digits than the other number you can place a 0 where the number is missing, or leave as is.",
                                    "Start by adding up the unit numbers. Write the new number below the line.",
                                    "Next add the tens digits together. Remembering to include any tens digits that came from the previouse sum",
                                    "Carry on adding the next number to the left as before until you have your final answer."]
    
    let usingPlaceValuesStepImage: [UIImage] = [UIImage(named: "usingPlaceValuesStep1")!,
                                                UIImage(named: "usingPlaceValuesStep2")!,
                                                UIImage(named: "usingPlaceValuesStep3")!,
                                                UIImage(named: "usingPlaceValuesStep4")!,
                                                UIImage(named: "usingPlaceValuesStep5")!]
    
}
