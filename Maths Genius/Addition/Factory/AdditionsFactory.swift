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
    
    static func PushIn(navigationController: UINavigationController) {
        
        let additions = UIStoryboard(name: "Additions", bundle: nil).instantiateInitialViewController() as! AdditionsViewController
        let additionsFlowController = AdditionsFlowController(navigationController: navigationController)
        let additionsViewModel = AdditionsViewModel()
        
        additions.assignDependancies(additionsFlowController: additionsFlowController, additionsViewModel: additionsViewModel)
        
        navigationController.pushViewController(additions, animated: true)
        
    }
    
}
