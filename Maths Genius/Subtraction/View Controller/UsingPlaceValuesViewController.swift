//
//  UsingPlaceValuesViewController.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 05/09/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import UIKit

class UsingPlaceValuesViewController: UIViewController {
    
    fileprivate var usingPlaceValuesFlowController: UsingPlaceValuesFlowController!
    fileprivate var usingPlaceValuesViewModel: UsingPlaceValuesViewModel!
    fileprivate var usingPlaceValuesModel = UsingPlaceValuesModel()
    
    var firstNumber = Int()
    var secondNumber = Int ()
    
    @IBOutlet weak var returnToEquation: UIButton!
    
    @IBOutlet weak var newEquation: UIButton!
    
    @IBOutlet weak var pageTitle: UILabel!
    
    @IBOutlet weak var step1Label: UILabel!
    @IBOutlet weak var step2Label: UILabel!
    @IBOutlet weak var step3Label: UILabel!
    @IBOutlet weak var step4Label: UILabel!
    @IBOutlet weak var step5Label: UILabel!
    @IBOutlet weak var step6Label: UILabel!
    @IBOutlet weak var exampleLabel: UILabel!
    
    @IBOutlet weak var step1Image: UIImageView!
    @IBOutlet weak var step2Image: UIImageView!
    @IBOutlet weak var step4Image: UIImageView!
    @IBOutlet weak var step5Image: UIImageView!
    @IBOutlet weak var step6Image: UIImageView!
    
    
    func assignDependancies(usingPlaceValuesFlowController: UsingPlaceValuesFlowController, usingPlaceValuesViewModel: UsingPlaceValuesViewModel) {
        self.usingPlaceValuesViewModel = usingPlaceValuesViewModel
        self.usingPlaceValuesFlowController = usingPlaceValuesFlowController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        buttonSetup()
        example()
    }
    
    func setUp() {
        
        firstNumber = usingPlaceValuesViewModel.firstNumber
        secondNumber = usingPlaceValuesViewModel.secondNumber
        
        //page setup
        pageTitle.text = "Using Place Values"
        pageTitle.titleLabelSetUp()
        self.view.backgroundColor = UIColor.Shades.standardBlack
        
        //label dialog
        step1Label.text = usingPlaceValuesModel.step1
        step2Label.text = usingPlaceValuesModel.step2
        step3Label.text = usingPlaceValuesModel.step3
        step4Label.text = usingPlaceValuesModel.step4
        step5Label.text = usingPlaceValuesModel.step5
        step6Label.text = usingPlaceValuesModel.step6
        
        //labelsetup
        step1Label.subTitleLabelSetUp()
        step2Label.subTitleLabelSetUp()
        step3Label.subTitleLabelSetUp()
        step4Label.subTitleLabelSetUp()
        step5Label.subTitleLabelSetUp()
        step6Label.subTitleLabelSetUp()
        
        //image setup
        step1Image.image = UIImage(named: "additionsUPVStep1")
        step2Image.image = UIImage(named: "additionsUPVStep2")
        step4Image.image = UIImage(named: "additionsUPVStep3")
        step5Image.image = UIImage(named: "additionsUPVStep4")
        step6Image.image = UIImage(named: "additionsUPVStep5")
    }
    
    func buttonSetup() {
        returnToEquation.subTitleButtonSetup()
        newEquation.subTitleButtonSetup()
        
        returnToEquation.setTitle("Return to the equation", for: .normal)
        newEquation.setTitle("Let me try a new equation", for: .normal)
    }

    func example() {
        
        //create an array of the numbers
        var firstNumberArray = firstNumber.digits
        var secondNumberArray = secondNumber.digits
        
        //using the arays, if the numbers are less that 1000 add preceeding 0's for readability
        while 4 - firstNumberArray.count > 0 {
            firstNumberArray.insert(0, at: 0)
        }
        while 4 - secondNumberArray.count > 0 {
            secondNumberArray.insert(0, at: 0)
        }
        
        //Split numbers into their place values
        let fnUnit = firstNumberArray[3]
        let fnTen = firstNumberArray[2] * 10
        let fnHund = firstNumberArray[1] * 100
        let fnThou = firstNumberArray[0] * 1000
        let snUnit = secondNumberArray[3]
        let snTen = secondNumberArray[2] * 10
        let snHund = secondNumberArray[1] * 100
        let snThou = secondNumberArray[0] * 1000
        
        exampleLabel.exampleLabelSetUp()
        
        //If first and second number is more than 9 or 99 etc then add all values at that point and below together to get figure. Else if number contains numbers at place value just use those 2 digits
        
        //Intor and unit calculations
        exampleLabel.text = "Using the equation \(firstNumber) + \(secondNumber) we can do the following : \n\n \(String(format: "%04d", firstNumber))\n+\(String(format: "%04d", secondNumber))\n------\n  \(String(format: "%04d", (fnUnit + snUnit).digits.last))"
        
        //Tens calculation
        if fnUnit + snUnit > 9 {
            exampleLabel.text = exampleLabel.text! + "   - Add the 10 to the next row\n  \(String(format: "%04d", ((fnTen + snTen) + (((fnUnit + snUnit).digits[0]) * 10)).digits.secondToLast * 10))"
        } else if firstNumber.digits.count > 1 || secondNumber.digits.count > 1 || (fnUnit + snUnit).digits.count  > 1 {
            exampleLabel.text = exampleLabel.text! + "\n  \(String(format: "%04d", (fnTen + snTen).digits.secondToLast * 10))"
        }
        
        //Hundres calculation
        if fnTen + snTen + fnUnit + snUnit > 99 {
            exampleLabel.text = exampleLabel.text! + "   - Add the 100 to the next row\n  \(String(format: "%04d", ((fnHund + snHund) + (((fnTen + snTen + fnUnit + snUnit).digits[0]) * 100)).digits.thirdToLast * 100))"
        } else if (firstNumber + secondNumber).digits.count > 2 {
            exampleLabel.text = exampleLabel.text! + "\n \(String(format: "%04d", (fnHund + snHund).digits.thirdToLast * 100))"
        }
        
        //Thousdands calculation
        if fnHund + snHund + fnTen + snTen + fnUnit + snUnit > 999 {
            exampleLabel.text = exampleLabel.text! + "   - Add the 1000 to the next row\n  \(String(format: "%04d", (((fnThou + snThou) + (((fnHund + snHund + fnTen + snTen + fnUnit + snUnit).digits[0]) * 1000)).digits.fourthToLast * 1000)))"
        } else if (firstNumber + secondNumber).digits.count > 3 {
            exampleLabel.text = exampleLabel.text! + "\n  \(String(format: "%04d", (fnThou + snThou).digits.fourthToLast * 1000))"
        }
        
        //Ten thousands calculation
        if fnThou + snThou + fnHund + snHund + fnTen + snTen + fnUnit + snUnit > 9999 {
            exampleLabel.text = exampleLabel.text! + "   - Add the 10000 to the next row\n \(String(format: "%04d", ((fnThou + snThou) + (((fnHund + snHund).digits[0]))*1000).digits.fithToLast * 10000)) - This is Ten Thousands"
        }
        
        //Sum of equation
        exampleLabel.text = exampleLabel.text! + "\n\nNow add the numbers from the first to last row. And your answer should be : \n\n\(firstNumber + secondNumber)"
    }
    
    @IBAction func returnToEquation(_ sender: Any) {
        
        self.popBack(3)
    }
    
    @IBAction func newEquation(_ sender: Any) {
        //Remove all viewcontrollers from the navigation stack
        self.navigationController!.viewControllers.removeAll()
        
        usingPlaceValuesFlowController.showMain()
    }
}
