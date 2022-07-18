//
//  DescriptionByDateTableViewCell.swift
//  EnemyLosses
//
//  Created by Iryna Kalmykova on 14.07.2022.
//

import UIKit

class DescriptionByDateTableViewCell: UITableViewCell {
    @IBOutlet weak var cellBackgroundView: UIView!
    @IBOutlet weak var imageOftypImageView: UIImageView!
    @IBOutlet weak var descriptionOnUkrainianLabel: UILabel!
    @IBOutlet weak var descriptionOnEnglishLabel: UILabel!
    @IBOutlet weak var addedLosesLabel: UILabel!
    @IBOutlet weak var countOfLossesLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        cellBackgroundView.layer.cornerRadius = 20
      
    }
}
