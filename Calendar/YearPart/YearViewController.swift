//
//  YearViewController.swift
//  Calendar
//
//  Created by 신효근 on 2020/05/02.
//  Copyright © 2020 신효근. All rights reserved.
//

import UIKit

class YearViewController: UIViewController {

    @IBOutlet weak var yearName: UILabel!
    @IBOutlet weak var yearCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        yearName.text = String(CalenderBrain.init().curruntYear)
        yearCollectionView.dataSource = self
        yearCollectionView.delegate = self
        
        yearCollectionView.register(UINib(nibName: "ReusableYearCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MyCell3")
        
        if let layout = self.yearCollectionView.collectionViewLayout as? UICollectionViewFlowLayout{
            layout.minimumInteritemSpacing = -10
            layout.minimumLineSpacing = 1
        }
        
    }
    
}

extension YearViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell3", for: indexPath) as! ReusableYearCollectionViewCell
        cell.monthName.text = Calendar.current.monthSymbols[indexPath.row]
        if cell.monthName.text == CalenderBrain.init().curruntMonthName(){
            cell.monthName.textColor = .red
            cell.tag = 999
        }
        cell.month = indexPath.row + 1
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 126.3, height:(570-3)/4)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "lastOne") as? ViewController
        vc?.whatIGetFromYearViewController = indexPath.row + 1
        vc?.curruntMonthNameThatIHaveToPut = Calendar.current.monthSymbols[indexPath.row]
        if indexPath.row != 11 {
         vc?.nextMonthNameThatIHaveToPut = Calendar.current.monthSymbols[indexPath.row + 1]
        } else{
         vc?.nextMonthNameThatIHaveToPut = Calendar.current.monthSymbols[0]
        }
        self.navigationController?.pushViewController(vc!, animated: true)
        print("i'm pressed")
    }
}
