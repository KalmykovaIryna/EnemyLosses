//
//  DescriptionByTypeTableViewCell.swift
//  EnemyLosses
//
//  Created by Iryna Kalmykova on 14.07.2022.
//

import UIKit

class DescriptionByTypeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var backgroundViewCell: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        backgroundViewCell.layer.cornerRadius = 20
     
    }

}
