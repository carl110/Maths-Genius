//
//  MySumFactory.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 05/11/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

class MySumFactory {
    
    static func PushIn(navigationController: UINavigationController) {
        
        let storyBoard = UIStoryboard(name: "MySum", bundle: nil).instantiateInitialViewController() as! MySumViewController
        let flowController = MySumFlowController(navigationController: navigationController)
        let viewModel = MySumViewModel()
        
        storyBoard.assignDependancies(mySumFlowController: flowController, mySumViewModel: viewModel)
        
        
        navigationController.pushViewController(storyBoard, animated: true)
        
    }

}
