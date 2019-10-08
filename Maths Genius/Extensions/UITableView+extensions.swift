//
//  UITableView+extensions.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 30/08/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    //return number of rows in given section
    func indexPathsForRowsInSection(_ section: Int) -> [NSIndexPath] {
        return (0..<self.numberOfRows(inSection: section)).map { NSIndexPath(row: $0, section: section) }
    }
    
    //Scroll table to last open cell
    func scrollToBottomRow() {
        DispatchQueue.main.async { [weak self] in
            guard self!.numberOfSections > 0 else { return }
            
            // Make an attempt to use the bottom-most section with at least one row
            var section = max(self!.numberOfSections - 1, 0)
            var row = max((self?.numberOfRows(inSection: section))! - 1, 0)
            var indexPath = IndexPath(row: row, section: section)
            
            // Ensure the index path is valid, otherwise use the section above (sections can contain 0 rows which leads to an invalid index path)
            while !(self?.indexPathIsValid(indexPath))! {
                section = max(section - 1, 0)
                row = max((self?.numberOfRows(inSection: section))! - 1, 0)
                indexPath = IndexPath(row: row, section: section)
                
                // If we're down to the last section, attempt to use the first row
                if indexPath.section == 0 {
                    indexPath = IndexPath(row: 0, section: 0)
                    break
                }
            }
            
            // In the case that [0, 0] is valid (perhaps no data source?), ensure we don't encounter an exception here
            guard (self?.indexPathIsValid(indexPath))! else { return }
            
            self?.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
    
    func indexPathIsValid(_ indexPath: IndexPath) -> Bool {
        let section = indexPath.section
        let row = indexPath.row
        return section < self.numberOfSections && row < self.numberOfRows(inSection: section)
    }
}
