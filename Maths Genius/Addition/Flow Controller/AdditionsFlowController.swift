//
//  AdditionsFlowController.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 09/08/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

class AdditionsFlowController {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showMain() {
        MainFactory.PushIn(navigationController: navigationController)
    }
    
    func showHelpScreen(firstNumber: Int, secondNumber: Int, subject: String) {
        HelpScreenFactory.PushIn(navigationController: navigationController, firstNumber: firstNumber, secondNumber: secondNumber, subject: subject)
    }
}
