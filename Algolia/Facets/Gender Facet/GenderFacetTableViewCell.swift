//
//  GenderFacetTableViewCell.swift
//  Algolia
//
//  Created by Vantage Circle on 26/08/22.
//

import UIKit

class GenderFacetTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var checkBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle =  .none
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func tapped(_ sender: UIButton) {
        if (sender.isSelected == true)
        {
            sender.isSelected = false;
        }
        else
        {
            sender.isSelected = true;
        }
    }
    
    @IBAction func checkBtnPressed(_ sender: UIButton) {
        tapped(sender)
    }
}
