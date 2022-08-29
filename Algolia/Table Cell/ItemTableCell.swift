//
//  ItemTableCell.swift
//  Algolia
//
//  Created by Vantage Circle on 23/08/22.
//

import UIKit
import Kingfisher

class ItemTableCell: UITableViewCell {

  
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var firstCard: UIView!
    @IBOutlet weak var secondCard: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle =  .none
        
//        firstCard.clipsToBounds = true
        firstCard.layer.cornerRadius = 20
        firstCard.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        secondCard.layer.cornerRadius = 20
        secondCard.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setData(character: ResultModel){
        nameLabel.text = character.name
        speciesLabel.text = character.species
        genderLabel.text = character.gender?.rawValue
        originLabel.text = character.origin?.name
        statusLabel.text = character.status.rawValue
        
        let urlImage = URL(string: character.image)
        characterImageView?.kf.setImage(with: urlImage)
    }
    
}
