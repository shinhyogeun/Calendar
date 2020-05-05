//
//  ViewController.swift
//  Calendar
//
//  Created by 신효근 on 2020/04/23.
//  Copyright © 2020 신효근. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nowMonthName: UILabel!
    @IBOutlet weak var nextMonthName: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextMonthCollectionView: UICollectionView!
    var thing = realOptimaize()
    var selectedIndex : IndexPath?
    var items = [UIBarButtonItem]()
    var forCollectionViewCount : Int?
    var monthData : Array<Int>?
    var nextMonthData : Array<Int>?
    
    override func viewDidLoad() {
         monthData = thing.optimaize(month: 5)
         nextMonthData = thing.optimaize(month: 6)
        
        self.title = String(CalenderBrain.init().curruntYear)
        nowMonthName.text = String(CalenderBrain.init().curruntMonthName())
        nextMonthName.text = String(CalenderBrain.init().nextMonthName())
    
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.nextMonthCollectionView.dataSource = self
        self.nextMonthCollectionView.delegate = self
        
        self.collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier : "MyCell")
        self.nextMonthCollectionView.register(UINib(nibName: "NextMonthCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MyCell2")
        
        //이해가 잘 안가는 부분!!!
        if let layout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout{
            layout.minimumInteritemSpacing = -0.2
        }
        if let layout2 = self.nextMonthCollectionView.collectionViewLayout as? UICollectionViewFlowLayout{
            layout2.minimumInteritemSpacing = -0.2
        }
        
    }
    
}


extension ViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.nextMonthCollectionView {
            forCollectionViewCount = nextMonthData!.count
            return forCollectionViewCount!
        } else {
            forCollectionViewCount = monthData!.count
            return forCollectionViewCount!
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell { if collectionView == self.nextMonthCollectionView{
        let forCollectionViewCell = nextMonthCollectionView.dequeueReusableCell(withReuseIdentifier: "MyCell2", for: indexPath) as! NextMonthCollectionViewCell
//        forCollectionViewCell.button.tag = indexPath.item
        if nextMonthData![indexPath.row] == 0 {
            forCollectionViewCell.isHidden = true
        } else {
            forCollectionViewCell.Label.text = String(nextMonthData![indexPath.row])
            }
            return forCollectionViewCell
        } else {
        
        let forCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! CollectionViewCell
//        forCollectionViewCell.button.tag = indexPath.item + 100
        if monthData![indexPath.row] == 0 {
            forCollectionViewCell.isHidden = true
        } else {
            forCollectionViewCell.Label.text = String(monthData![indexPath.row])
        }
        return forCollectionViewCell
        
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == nextMonthCollectionView {
            return .init(width: 53.25  , height: 67)
        } else{
            return .init(width: 53.25  , height: 67)
        }
    }

     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.nextMonthCollectionView {
            let forCollectionViewCell = collectionView.cellForItem(at: indexPath) as! NextMonthCollectionViewCell
            self.collectionView.reloadData()
            collectionView.reloadData()
            forCollectionViewCell.Label.textColor = .white
            forCollectionViewCell.Label2.backgroundColor = .red
            forCollectionViewCell.Label2.layer.cornerRadius = 0.5 * forCollectionViewCell.Label2.bounds.size.width
            forCollectionViewCell.Label2.clipsToBounds = true
        }else{
            let forCollectionViewCell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
            self.nextMonthCollectionView.reloadData()
            collectionView.reloadData()
            forCollectionViewCell.Label.textColor = .white
            forCollectionViewCell.Label2.backgroundColor = .red
            forCollectionViewCell.Label2.layer.cornerRadius = 0.5 * forCollectionViewCell.Label2.bounds.size.width
            forCollectionViewCell.Label2.clipsToBounds = true
        }
    }
}

