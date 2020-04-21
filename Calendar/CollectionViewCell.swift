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
      @IBOutlet weak var button: UIButton!

      var callback : (() -> Void)?

      @IBAction func buttonPressed(_ sender: UIButton) {
          callback?()
      }
  }
