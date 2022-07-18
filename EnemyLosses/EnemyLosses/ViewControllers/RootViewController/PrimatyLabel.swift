//
//  PrimatyLabel.swift
//  TestProjecct
//
//  Created by Iryna Rarova on 07.07.2022.
//

import UIKit

class PrimatyLabel: UILabel {

    override func awakeFromNib() {
        super.awakeFromNib()

        self.textColor = UIColor.init(red: 220.0/255.0, green: 216.0/255.0, blue: 216.0/255.0, alpha: 1)
        self.textAlignment = .center
    }

}
