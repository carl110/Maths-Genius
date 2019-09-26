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
    
    private var subjectSelected = String()

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
        screenSetUp()
        buttonSetup()
    }
    
    func screenSetUp() {
        self.title = "Select you subject"
        self.view.backgroundColor = UIColor.Shades.standardBlack
    }
    
    func buttonSetup() {
        viewTutorial.subTitleButtonSetup()
        viewTutorial.setTitle("Glossary", for: .normal)
        
        additionButton.titleButtonSetup()
        additionButton.setTitle("Add", for: .normal)
        
        subtractionButton.titleButtonSetup()
        subtractionButton.setTitle("Subtract", for: .normal)
        
        multiplicationButton.titleButtonSetup()
        multiplicationButton.setTitle("Multiply", for: .normal)
        
        divisionButton.titleButtonSetup()
        divisionButton.setTitle("Divide", for: .normal)
    }
    
    
    @IBAction func viewTutorial(_ sender: Any) {
        mainFlowController.showGlossary()
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

