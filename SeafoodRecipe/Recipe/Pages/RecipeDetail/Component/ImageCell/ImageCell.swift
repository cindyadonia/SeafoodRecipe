//
//  ImageCell.swift
//  SeafoodRecipe
//
//  Created by Cindy  Adonia on 26/05/22.
//

import UIKit

class ImageCell: UITableViewCell {
    @IBOutlet weak var recipeImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
