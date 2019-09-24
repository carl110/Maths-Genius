//
//  ViewController.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 09/08/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    fileprivate var mainFlowController: MainFlowController!
    
    var subjectSelected = String()

    @IBOutlet weak var viewTutorial: UIButton!
    
    @IBOutlet weak var additionButton: UIButton!
    
    @IBOutlet weak var subtractionButton: UIButton!
    
    @IBOutlet weak var multiplicationButton: UIButton!
    
    @IBOutlet weak var divisionButton: UIButton!
    
    func assignDependancies(mainFlowController: MainFlowController) {
        self.mainFlowController = mainFlowController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    func setUp() {
       
        //Button setups
        viewTutorial.subTitleButtonSetup()
        viewTutorial.setTitle("View Tutorial", for: .normal)
        additionButton.titleButtonSetup()
        additionButton.setTitle("Add", for: .normal)
        subtractionButton.titleButtonSetup()
        subtractionButton.setTitle("Subtract", for: .normal)
        multiplicationButton.titleButtonSetup()
        multiplicationButton.setTitle("Multiply", for: .normal)
        divisionButton.titleButtonSetup()
        divisionButton.setTitle("Divide", for: .normal)
        
        //Mainpage setup
        self.title = "Select you subject"
        self.view.backgroundColor = UIColor.Shades.standardBlack
    }
    
    
    @IBAction func viewTutorial(_ sender: Any) {
        
    }
    
    @IBAction func additionButton(_ sender: Any) {
        subjectSelected = SubjectType.Additions.name()
        mainFlowController.showNumberSelection(with: subjectSelected)
    }
    
    @IBAction func subtractionButton(_ sender: Any) {
        subjectSelected = SubjectType.Subtractions.name()
        mainFlowController.showNumberSelection(with: subjectSelected)
    }
    @IBAction func multiplicationButton(_ sender: Any) {
        subjectSelected = SubjectType.Multiplications.name()
        mainFlowController.showNumberSelection(with: subjectSelected)
    }
    @IBAction func divisionButton(_ sender: Any) {
        subjectSelected = SubjectType.Divisions.name()
        mainFlowController.showNumberSelection(with: subjectSelected)
    }
}

