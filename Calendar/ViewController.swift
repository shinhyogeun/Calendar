//
//  ViewController.swift
//  Calendar
//
//  Created by 신효근 on 2020/04/20.
//  Copyright © 2020 신효근. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {

var selectedRow : Int?
    let data = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31]
override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier : "MyCell")
}

override func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
}
override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return data.count
}

override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! CollectionViewCell

    cell.button.tag = indexPath.item
//    나를 살린부분.. ㄷㄷ
    cell.button.addTarget(self, action:#selector(buttonPressed(_:)) , for: .touchUpInside)
    cell.Label.text = String(data[indexPath.row])

    if selectedRow == indexPath.item{
        cell.Label.textColor = .white
        cell.Label2.backgroundColor = .red
        cell.Label2.layer.cornerRadius = 0.5 * cell.Label2.bounds.size.width
        cell.Label2.clipsToBounds = true
    }else{
        cell.Label.textColor = .black
        cell.Label2.backgroundColor = .white
//        cell.button.layer.cornerRadius = 0 * cell.button.bounds.size.width
//        cell.button.clipsToBounds = false
    }
    return cell
}

    @IBAction func buttonPressed(_ sender: UIButton) {
        if selectedRow == sender.tag{
            selectedRow = nil
        }else{
            selectedRow = sender.tag
        }
        print("real")
        collectionView.reloadData()
    }

}
