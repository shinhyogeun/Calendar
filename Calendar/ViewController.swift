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
    
    var selectedRow : Int?
    var monthData = Array(1...CalenderBrain.init().curruntMothLength())
    let searchController = UISearchController(searchResultsController: nil)
    var items = [UIBarButtonItem]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    

    override func viewDidLoad() {
            super.viewDidLoad()
            self.title = String(CalenderBrain.init().curruntYear)
            self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
            nowMonthName.text = String(CalenderBrain.init().curruntMonthName())
            nextMonthName.text = String(CalenderBrain.init().nextMonthName())
            self.collectionView.dataSource = self
            self.collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier : "MyCell")
            self.navigationItem.searchController = searchController
        }
    
    
}

extension ViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return monthData.count
        }
    
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! CollectionViewCell
            if indexPath.row <= 5 {
                cell.isHidden = true
            } else{
                cell.button.tag = indexPath.item
                            cell.button.addTarget(self, action:#selector(buttonPressed(_:)) , for: .touchUpInside)
                            cell.Label.text = String(Array(monthData)[indexPath.row])
                
                            if selectedRow == indexPath.item{
                                cell.Label.textColor = .white
                                cell.Label2.backgroundColor = .red
                                cell.Label2.layer.cornerRadius = 0.5 * cell.Label2.bounds.size.width
                                cell.Label2.clipsToBounds = true
                            }else{
                                cell.Label.textColor = .black
                                cell.Label2.backgroundColor = .white
                                cell.Label2.layer.cornerRadius =  0
                            }
        
            }
            return cell
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 110)
    }
    
        @IBAction func buttonPressed(_ sender: UIButton) {
            if selectedRow == sender.tag{
                selectedRow = nil
            }else{
                selectedRow = sender.tag
            }
            self.collectionView.reloadData()
       }
    
}

