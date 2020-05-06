//
//  NextMonthCollectionViewCell.swift
//  Calendar
//
//  Created by 신효근 on 2020/04/29.
//  Copyright © 2020 신효근. All rights reserved.
//

import UIKit

class NextMonthCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var Label2: UILabel!    
    @IBOutlet weak var button: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        if self.Label.text == "0"{
            button.isHidden = true
        } else {
            self.layer.addBorder(edge: .top, color: .gray, thickness: 0.5)
        }
    }

}
