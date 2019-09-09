//
//  HelpScreen.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 30/08/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import UIKit

class HelpScreenViewController: UIViewController, HelpSectionSelectedDelegate {
    
    fileprivate var helpScreenFlowController: HelpScreenFlowController!
    fileprivate var helpScreenViewModel: HelpScreenViewModel!
    fileprivate var helpScreenModel = HelpScreenModel()
    
    var firstNumber = Int()
    var secondNumber = Int ()

    @IBOutlet weak var customTable: CustomTable!
    

    func assignDependancies(helpScreenFlowController: HelpScreenFlowController, helpScreenViewModel: HelpScreenViewModel) {
    self.helpScreenViewModel = helpScreenViewModel
    self.helpScreenFlowController = helpScreenFlowController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        customTable.cellDelegate = self

        firstNumber = helpScreenViewModel.firstNumber
        secondNumber = helpScreenViewModel.secondNumber
        
    }
    
    func setUp() {
        
        self.title = "How to..."
        self.view.backgroundColor = UIColor.Shades.standardBlack
        
        tableSetUp()
    }
    
    func tableSetUp() {
        customTable.customCellsData = ["cell1", "cell2", "qsfeewqf"]
    }

    func cellWasSelected(id: Int) {
        
        //switch using cell idex to goto next screen
        switch id {
        case 0:
            helpScreenFlowController.showUsingPlaceValues(firstNumber: firstNumber, secondNumber: secondNumber)
        case 1:
            helpScreenFlowController.showMain()
        default:
            break
        }
        

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
