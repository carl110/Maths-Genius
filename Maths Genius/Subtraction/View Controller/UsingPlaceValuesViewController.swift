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
    
    @IBOutlet weak var pageTitle: UILabel!
    
    @IBOutlet weak var step1Label: UILabel!
    @IBOutlet weak var step2Label: UILabel!
    @IBOutlet weak var step3Label: UILabel!
    @IBOutlet weak var step4Label: UILabel!
    @IBOutlet weak var step5Label: UILabel!
    @IBOutlet weak var step6Label: UILabel!

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
        // Do any additional setup after loading the view.
    }
    
    func setUp() {
        pageTitle.text = "Using Place Values"
        pageTitle.titleLabelSetUp()
        self.view.backgroundColor = UIColor.Shades.standardBlack
        
        step1Label.text = usingPlaceValuesModel.step1
        step2Label.text = usingPlaceValuesModel.step2
        step3Label.text = usingPlaceValuesModel.step3
        step4Label.text = usingPlaceValuesModel.step4
        step5Label.text = usingPlaceValuesModel.step5
        step6Label.text = usingPlaceValuesModel.step6
        
        step1Label.subTitleLabelSetUp()
        step2Label.subTitleLabelSetUp()
        step3Label.subTitleLabelSetUp()
        step4Label.subTitleLabelSetUp()
        step5Label.subTitleLabelSetUp()
        step6Label.subTitleLabelSetUp()
        
        
        step1Image.image = UIImage(named: "step1")
        step2Image.image = UIImage(named: "step1")
        step4Image.image = UIImage(named: "step1")
        step5Image.image = UIImage(named: "step1")
        step6Image.image = UIImage(named: "step1")
        
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
