//
//  FacetsValueTableCell.swift
//  Algolia
//
//  Created by Vantage Circle on 02/09/22.
//

import UIKit

class FacetsValueTableCell: UITableViewCell {
    
    @IBOutlet weak var facetsValueLabel: UILabel!
    @IBOutlet weak var checkBtn: UIButton!

    var filterManager = FilterManager.filterManager
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle =  .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //* set data after cell is loaded.
    func setData(data: [String?],index: Int){
        facetsValueLabel.text = data[index]?.uppercased()
        checkBtn.accessibilityLabel = data[index]
        
        filterManager.filterArray.removeAll()
        
        for userFacets in filterManager.filterArray{
//            print("---In the function---")
            if (checkBtn.accessibilityLabel == userFacets) {
                print("---Selected---")
                checkBtn.isSelected = true
            }
        }
    }
    
    @IBAction func checkBtnPressed(_ sender: UIButton) {
        tapped(sender)
    }
    
    func tapped(_ sender: UIButton) {
        if (sender.isSelected == true)
        {
            sender.isSelected = false
            if let itemIndex = filterManager.filterArray.firstIndex(of: sender.accessibilityLabel!)
            {
                filterManager.filterArray.remove(at: itemIndex)
                print("filterArray----",filterManager.filterArray)
                
            }
            
        }
        else
        {
            sender.isSelected = true
            filterManager.filterArray.append(sender.accessibilityLabel!)
            print(sender.accessibilityLabel!,"------- added")

            print("filterArray----",filterManager.filterArray)

        }
    }
    
    
}
