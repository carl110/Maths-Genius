//
//  TutorialFactory.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 09/08/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

class TutorialFactory {
    
    static func PushIn(navigationController: UINavigationController) {
        
        let tutorial = UIStoryboard(name: "Tutorial", bundle: nil).instantiateInitialViewController() as! TutorialViewController
        let tutorialFlowController = TutorialFlowController(navigationController: navigationController)
        let tutorialViewModel = TutorialViewModel()
        
        tutorial.assignDependancies(tutorialFlowController: tutorialFlowController, tutorialViewModel: tutorialViewModel)
        
        navigationController.pushViewController(tutorial, animated: true)
        
    }
    
}
