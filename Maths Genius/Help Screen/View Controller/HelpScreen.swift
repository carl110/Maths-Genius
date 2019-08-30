//
//  HelpScreen.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 30/08/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import UIKit

class HelpScreenViewController: UIViewController {
    
    fileprivate var helpScreenFlowController: HelpScreenFlowController!
    fileprivate var helpScreenViewModel: HelpScreenViewModel!
    
    var firstNumber = Int()
    var secondNumber = Int ()
    
    @IBOutlet weak var cascadingTable: CascadingTable!
    func assignDependancies(helpScreenFlowController: HelpScreenFlowController, helpScreenViewModel: HelpScreenViewModel) {
    self.helpScreenViewModel = helpScreenViewModel
    self.helpScreenFlowController = helpScreenFlowController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        firstNumber = helpScreenViewModel.firstNumber
        secondNumber = helpScreenViewModel.secondNumber
    }
    
    func tableSetUp() {
        cascadingTable.tableSectionName.append("Table 1")
        cascadingTable.tableCellData.append([1,2,3,4,5])
        
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
