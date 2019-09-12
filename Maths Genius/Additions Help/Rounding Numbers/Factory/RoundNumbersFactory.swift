//
//  RoundNumbersFactory.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 12/09/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

class RoundNumbersFactory {
    
    static func PushIn(navigationController: UINavigationController, firstNumber: Int, secondNumber: Int) {
        
        let storyBoard = UIStoryboard(name: "RoundNumbers", bundle: nil).instantiateInitialViewController() as! RoundNumbersViewController
        let flowController = RoundNumbersFlowController(navigationController: navigationController)
        let viewModel = AdditionsHelpViewModel(firstNumber: firstNumber, secondNumber: secondNumber)
        
        storyBoard.assignDependancies(roundNumbersFlowController: flowController, additionsHelpViewModel: viewModel)
        
        
        navigationController.pushViewController(storyBoard, animated: true)
        
    }
    
}


//class HelpScreenFactory {
//
//static func PushIn(navigationController: UINavigationController, firstNumber: Int, secondNumber: Int) {
//
//    let helpScreen = UIStoryboard(name: "HelpScreen", bundle: nil).instantiateInitialViewController() as! HelpScreenViewController
//    let helpScreenFlowController = HelpScreenFlowController(navigationController: navigationController)
//    let helpScreenViewModel = HelpScreenViewModel(firstNumber: firstNumber, secondNumber: secondNumber)
//
//    helpScreen.assignDependancies(helpScreenFlowController: helpScreenFlowController, helpScreenViewModel: helpScreenViewModel)
//
//
//    navigationController.pushViewController(helpScreen, animated: true)
//
//}
//
//}
