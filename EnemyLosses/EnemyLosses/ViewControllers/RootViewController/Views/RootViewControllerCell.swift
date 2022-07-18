//
//  RootViewControllerCell.swift
//  EnemyLosses
//
//  Created by Iryna Kalmykova on 14.07.2022.
//

import UIKit

class RootViewControllerCell: UITableViewCell {
    
    @IBOutlet weak var descriptionOnUkrainianLabel: UILabel!
    @IBOutlet weak var descriptionOnEnglishLabel: UILabel!
    @IBOutlet weak var imageOfTypeImageView: UIImageView!
    @IBOutlet weak var cellBackgroundView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        cellBackgroundView.layer.cornerRadius = 15
        
    }
    
}
