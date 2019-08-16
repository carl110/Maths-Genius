//
//  AdditionsViewController.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 11/08/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import UIKit

class AdditionsViewController: UIViewController {
    
    fileprivate var additionsViewModel: AdditionsViewModel!
    fileprivate var additionsFlowController: AdditionsFlowController!
    
    var firstNumber = Int()
    var secondNumber = Int ()
    
    @IBOutlet weak var firstNumberLabel: UILabel!
    @IBOutlet weak var secondNumberLabel: UILabel!
    @IBOutlet weak var operation: UILabel!
    
    func assignDependancies(additionsFlowController: AdditionsFlowController, additionsViewModel: AdditionsViewModel){
        self.additionsFlowController = additionsFlowController
        self.additionsViewModel = additionsViewModel
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        firstNumber = additionsViewModel.firstNumber
        secondNumber = additionsViewModel.secondNumber
        
        setup()
        // Do any additional setup after loading the view.
    }
    
    func setup() {
        self.view.backgroundColor = UIColor.Shades.standardBlack
        self.title = "Additions"
        labelSetup()
    }
    
    func labelSetup() {
        //set up numbers and operation labels
//        operation.adjustsFontSizeToFitWidth = true
//        firstNumberLabel.adjustsFontSizeToFitWidth = true
//        secondNumberLabel.adjustsFontForContentSizeCategory = true
        operation.text = "+"
        operation.numberLabelSetup()
        firstNumberLabel.numberLabelSetup()
        firstNumberLabel.text = String(firstNumber)
        secondNumberLabel.numberLabelSetup()
        secondNumberLabel.text = String(secondNumber)
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
