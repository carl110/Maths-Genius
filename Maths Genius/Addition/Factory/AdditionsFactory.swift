//
//  AdditionsFactory.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 09/08/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

class AdditionsFactory {
    
    static func PushIn(navigationController: UINavigationController, firstNumber: Int, secondNumber: Int, subject: String) {
        
        let additions = UIStoryboard(name: "Additions", bundle: nil).instantiateInitialViewController() as! AdditionsViewController
        let additionsFlowController = AdditionsFlowController(navigationController: navigationController)
        let additionsViewModel = AdditionsViewModel(firstNumber: firstNumber, secondNumber: secondNumber, subject: subject)
        
        additions.assignDependancies(additionsFlowController: additionsFlowController, additionsViewModel: additionsViewModel)
        
        navigationController.pushViewController(additions, animated: true)
        
    }
    
}
