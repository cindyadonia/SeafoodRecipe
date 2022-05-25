//
//  RecipeListCell.swift
//  SeafoodRecipe
//
//  Created by Cindy  Adonia on 25/05/22.
//

import UIKit

class RecipeListCell: UITableViewCell {

    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var wrapper: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupView() {
        recipeImage.layer.cornerRadius = 8
        wrapper.layer.borderWidth = 1
        wrapper.layer.borderColor = UIColor.init(hexaRGB: "E6EAF3")?.cgColor
        wrapper.layer.cornerRadius = 10
    }
}
