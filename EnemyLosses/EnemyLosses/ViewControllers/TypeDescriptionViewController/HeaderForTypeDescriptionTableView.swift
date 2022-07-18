//
//  HeaderForTypeDescriptionTableView.swift
//  TestProjecct
//
//  Created by Iryna Rarova on 11.07.2022.
//

import UIKit

class HeaderForTypeDescriptionTableView: UITableViewHeaderFooterView {
    @IBOutlet weak var backgroundHeaderView: UIView!
    @IBOutlet weak var typeImageView: UIImageView!
    @IBOutlet weak var typeDescriptionOnUkrainianLabel: UILabel!
    @IBOutlet weak var typeDescriptionOnEnglishLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
