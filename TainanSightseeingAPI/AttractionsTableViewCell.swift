//
//  AttractionsTableViewCell.swift
//  TainanSightseeingAPI
//
//  Created by 羅承志 on 2021/10/6.
//

import UIKit

class AttractionsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var introduceLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
