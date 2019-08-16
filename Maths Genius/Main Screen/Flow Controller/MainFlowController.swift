//
//  MainFlowController.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 09/08/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

class MainFlowController {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
//    func showTutorial() {
//        TutorialFactory.PushIn(navigationController: navigationController)
//        
//    }
    
    func showNumberSelection(with subject: String) {
        NumberSelectionFactory.PushIn(navigationController: navigationController, subject: subject)
    }
    
}
