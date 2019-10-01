//
//  GlossaryViewModel.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 25/09/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

class GlossaryViewModel {
    
    var glossaryArray = [GlossaryModel]()
    
    func arrayOfGlossary() {
        
        glossaryArray.append((GlossaryModel(item: "Addition", alsoKnownAs: "Also known as - Add or Plus", deffinition: "ringing two or more numbers together to make a new number")))
        
        glossaryArray.append(GlossaryModel(item: "Subtraction", alsoKnownAs: "Also known as - Subtract, Minus or Take Away", deffinition: "Take one number away from another to make a new number"))
        
        glossaryArray.append(GlossaryModel(item: "Multiply", alsoKnownAs: "Also known as - Multiply or Times", deffinition: "Repeatedly adding a number to another to make a new number"))
        
        glossaryArray.append(GlossaryModel(item: "Divide", alsoKnownAs: "Also known as - Divide", deffinition: "Using a number to split another number into equal parts"))
        
    }
}
