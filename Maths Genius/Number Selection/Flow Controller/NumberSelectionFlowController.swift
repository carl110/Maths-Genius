//
//  TutorialFlowController.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 09/08/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

class NumberSelectionFlowController {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showMain() {
        MainFactory.PushIn(navigationController: navigationController)
    }
    
    func showAdditions() {
        AdditionsFactory.PushIn(navigationController: navigationController)
    }
    
//    func showSubtractions() {
//        SubtractionsFactory.PushIn(navigationController: navigationController)
//    }
//    
//    func showMultiplications() {
//        MultiplicationsFactory.PushIn(navigationController: navigationController)
//    }
//    
//    func showDivisions() {
//        DivisionsFactory.PushIn(navigationController: navigationController)
//    }
}
