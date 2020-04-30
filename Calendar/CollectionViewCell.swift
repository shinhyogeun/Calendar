//
//  CollectionViewCell.swift
//  Calendar
//
//  Created by 신효근 on 2020/04/23.
//  Copyright © 2020 신효근. All rights reserved.
//

import UIKit

 class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var Label2: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.addBorder(edge: .top, color: .gray, thickness: 0.5)
    }
}

extension CALayer {

func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {

    let border = CALayer()

    switch edge {
    case .top:
        border.frame = CGRect(x: 0, y: 0, width: frame.width, height: thickness)
    case .bottom:
        border.frame = CGRect(x: 0, y: frame.height - thickness, width: frame.width, height: thickness)
    case .left:
        border.frame = CGRect(x: 0, y: 0, width: thickness, height: frame.height)
    case .right:
        border.frame = CGRect(x: frame.width - thickness, y: 0, width: thickness, height: frame.height)
    default:
        break
    }
    border.backgroundColor = color.cgColor
    addSublayer(border)
    }
}
