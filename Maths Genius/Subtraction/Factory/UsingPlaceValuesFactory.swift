//
//  UsingPlaceValuesFactory.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 05/09/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

class UsingPlaceValuesFactory {
    
    static func PushIn(navigationController: UINavigationController, firstNumber: Int, secondNumber: Int) {
        
        let usingPlaceValues = UIStoryboard(name: "UsingPlaceValues", bundle: nil).instantiateInitialViewController() as! UsingPlaceValuesViewController
        let usingPlaceValuesFlowController = UsingPlaceValuesFlowController(navigationController: navigationController)
        let usingPlaceValuesViewModel = UsingPlaceValuesViewModel(firstNumber: firstNumber, secondNumber: secondNumber)
        
        usingPlaceValues.assignDependancies(usingPlaceValuesFlowController: usingPlaceValuesFlowController, usingPlaceValuesViewModel: usingPlaceValuesViewModel)
        
        
        navigationController.pushViewController(usingPlaceValues, animated: true)
        
    }
    
}
