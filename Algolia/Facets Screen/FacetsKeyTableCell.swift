//
//  FacetsKeyTableCell.swift
//  Algolia
//
//  Created by Vantage Circle on 02/09/22.
//

import UIKit

class FacetsKeyTableCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    var userPreference = UserPreference.userPreference
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //* set data after cell is loaded.
    func setData(data: [String?], index: Int){
        nameLabel.text = data[index]?.uppercased()
    }
    
}
