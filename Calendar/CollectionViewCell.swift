//
//  CollectionViewCell.swift
//  Calendar
//
//  Created by 신효근 on 2020/04/20.
//  Copyright © 2020 신효근. All rights reserved.
//

import UIKit

   class CollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var Label2: UILabel!
    @IBOutlet weak var button: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
