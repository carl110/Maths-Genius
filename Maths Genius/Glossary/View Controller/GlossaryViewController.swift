//
//  GlossaryViewController.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 25/09/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import UIKit

class GlossaryViewController: UIViewController {

        fileprivate var glossaryFlowController: GlossaryFlowController!
        fileprivate var glossaryViewModel: GlossaryViewModel!
        
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cascadingTable: CascadingTable!
    
    func assignDependancies(glossaryFlowController: GlossaryFlowController, glossaryViewModel: GlossaryViewModel) {
            self.glossaryViewModel = glossaryViewModel
            self.glossaryFlowController = glossaryFlowController
        }
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            cascadingTable.tableCellData = ["cell1", "cellxgvn2"]
            
//            cascadingTable.tableCellData.append(contentsOf: ["Cell1", "cell2"])
            
            cascadingTable.tableSectionName = ["Section1", "section2"]
            
            cascadingTable.reloadData()
            
        }
}
