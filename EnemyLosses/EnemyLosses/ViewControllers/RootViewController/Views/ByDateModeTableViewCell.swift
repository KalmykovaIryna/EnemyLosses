//
//  ByDateModeTableViewCell.swift
//  EnemyLosses
//
//  Created by Iryna Kalmykova on 14.07.2022.
//

import UIKit

class ByDateModeTableViewCell: UITableViewCell {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var cellBackgroundView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellBackgroundView.layer.cornerRadius = 10
    }
    
}
