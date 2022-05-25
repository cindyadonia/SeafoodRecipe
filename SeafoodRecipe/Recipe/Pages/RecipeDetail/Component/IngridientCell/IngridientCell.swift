//
//  IngridientCell.swift
//  SeafoodRecipe
//
//  Created by Cindy  Adonia on 26/05/22.
//

import UIKit

class IngridientCell: UITableViewCell {
    @IBOutlet weak var measureLabel: UILabel!
    @IBOutlet weak var ingridientLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
