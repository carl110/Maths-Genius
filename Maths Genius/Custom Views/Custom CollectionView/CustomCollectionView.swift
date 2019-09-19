//
//  CustomCollectionView.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 17/09/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

class CustomCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource{

    
    
    var cellData: [String] = ["cell1", "cell2"]
    var cellImage: [UIImage] = []
    
    var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.size.width
        layout.estimatedItemSize = CGSize(width: width, height: 900)
        return layout
    }()
    
    override func awakeFromNib() {
        delegate = self
        dataSource = self
        self.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCollectionViewCell")
        
        self.collectionViewLayout = layout
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
//        cell.cellLabel.textColor = UIColor.Blues.standardBlue
        cell.cellLabel.text = cellData[indexPath.row]
        cell.cellImage.image = cellImage[indexPath.row]
    
        
        return cell
    }
    
        //set layout for cell
   


    
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        return CGSize(width: collectionView.bounds.size.width - 16, height: 120)
//    }
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 8
//    }
//
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets.init(top: 8, left: 8, bottom: 8, right: 8)
//    }
}

//class FilmCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//
//    //placeholder for number to remove from year for pagenation
//    private var yearCount = 1
//    var cellDelegate: FilmCellSelectedDelegate?
//
//    func registerCell() {
//        self.register(UINib(nibName: "MyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MyCollectionViewCell")
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return DataManager.shared.filmList.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as! MyCollectionViewCell
//        let filmModel = DataManager.shared.filmList[indexPath.item]
//        cell.populate(filmModel: filmModel)
//
//
//
//
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let filmModel = DataManager.shared.filmList[indexPath.item]
//        let id = filmModel.id
//        //send id to delegate for ViewController
//        cellDelegate?.cellWasSelected(id: id)
//    }
//
//    override func awakeFromNib() {
//        delegate = self
//        dataSource = self
//        registerCell()
//    }
//

//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 5
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 5
//    }
//
//    //When scroll gets to 10 before the end
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        if indexPath.row == DataManager.shared.filmList.count - 25 {
//            //pass number of years to remove to view controller
//            cellDelegate?.nearingScrollEnd(year: yearCount)
//            yearCount += 1
//        }
//    }
//}
