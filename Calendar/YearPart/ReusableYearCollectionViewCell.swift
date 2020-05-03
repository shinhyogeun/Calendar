//
//  ReusableYearCollectionViewCell.swift
//  Calendar
//
//  Created by 신효근 on 2020/05/02.
//  Copyright © 2020 신효근. All rights reserved.
//

import UIKit

class ReusableYearCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var monthName: UILabel!
    @IBOutlet weak var monthInYearCollectionView: UICollectionView!
    
    var month : Int?
    var monthArray : Array<Int>?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        monthInYearCollectionView.delegate = self
        monthInYearCollectionView.dataSource = self
        monthInYearCollectionView.register(UINib(nibName: "InnerInCell", bundle: nil), forCellWithReuseIdentifier: "MyCell4")
        if let layout = self.monthInYearCollectionView.collectionViewLayout as? UICollectionViewFlowLayout{
            layout.minimumInteritemSpacing = -2
            layout.minimumLineSpacing = 1
        }
    }

}

extension ReusableYearCollectionViewCell : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let length = CalenderBrain.init().monthLenght[month!]
        monthArray = Array(1...length)
        return length
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = monthInYearCollectionView.dequeueReusableCell(withReuseIdentifier: "MyCell4", for: indexPath) as! InnerInCell
        cell.day.text = String(monthArray![indexPath.row])
        if self.tag == 999{
            if Int(cell.day.text!) == CalenderBrain.init().cuuruntDay{
                cell.day.textColor = .red
            }
        }
        cell.day.frame.size.width = 18
        cell.day.frame.size.height = 18
        print(cell.day.text ?? 0)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 18, height:18)
    }
    
}
