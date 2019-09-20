//
//  SubtractByBorrowingFactory.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 17/09/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

class SubtractByBorrowingFactory {
    
    static func PushIn(navigationController: UINavigationController, firstNumber: Int, secondNumber: Int) {
        
        let storyBoard = UIStoryboard(name: "SubtractByBorrowing", bundle: nil).instantiateInitialViewController() as! SubtractByBorrowingViewController
        let flowController = SubtractByBorrowingFlowController(navigationController: navigationController)
        let viewModel = SubtractionsHelpViewModel(firstNumber: firstNumber, secondNumber: secondNumber)
        
        storyBoard.assignDependancies(subtractByBorrowingFlowController: flowController, subtractionsHelpViewModel: viewModel)
        
        
        navigationController.pushViewController(storyBoard, animated: true)
        
    }

}

//class RoundNumbersFactory {
//
//    static func PushIn(navigationController: UINavigationController, firstNumber: Int, secondNumber: Int) {
//
//        let storyBoard = UIStoryboard(name: "RoundNumbers", bundle: nil).instantiateInitialViewController() as! RoundNumbersViewController
//        let flowController = RoundNumbersFlowController(navigationController: navigationController)
//        let viewModel = AdditionsHelpViewModel(firstNumber: firstNumber, secondNumber: secondNumber)
//
//        storyBoard.assignDependancies(roundNumbersFlowController: flowController, additionsHelpViewModel: viewModel)
//
//
//        navigationController.pushViewController(storyBoard, animated: true)
//
//    }
//
//}
