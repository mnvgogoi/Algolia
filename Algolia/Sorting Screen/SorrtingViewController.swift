//
//  SorrtingViewController.swift
//  Algolia
//
//  Created by Vantage Circle on 31/08/22.
//

import UIKit
import AlgoliaSearchClient

class SorrtingViewController: UIViewController {
    
    @IBOutlet weak var backgroundCard: UIView!
    @IBOutlet weak var sortNameAscBtn: UIButton!
    @IBOutlet weak var clearBtn: UIButton!
    @IBOutlet weak var setBtn: UIButton!
    @IBOutlet weak var sortNameDescBtn: UIButton!
    
    //get the index
    var algoliaIndex = AlgoliaData.algoliaData
    
    var userPreference = UserPreference.userPreference
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundCard.layer.cornerRadius = 20
        
        switch userPreference.sortingType {
        case .asc:
            sortNameAscBtn.isSelected = true
            break
            
        case .desc:
            sortNameDescBtn.isSelected = true
            break
            
        case .regular:
            sortNameAscBtn.isSelected = false
            sortNameDescBtn.isSelected = false
            break
        }
        
    }
    
    func optionSelected(_ isOptionSelected: IndexTags) {
        
        switch isOptionSelected
        {
        case .asc:
            sortNameAscBtn.isSelected = true
            sortNameDescBtn.isSelected = false
            algoliaIndex.status = IndexTags.asc
            userPreference.sortingType = .asc
            
        case .desc:
            sortNameAscBtn.isSelected = false
            sortNameDescBtn.isSelected = true
            algoliaIndex.status = IndexTags.desc
            userPreference.sortingType = .desc
            
        case .regular:
            sortNameAscBtn.isSelected = false
            sortNameDescBtn.isSelected = false
            algoliaIndex.status = IndexTags.regular
            userPreference.sortingType = .regular
        }
    }
    
    
    @IBAction func sortNameAscBtnPressed(_ sender: UIButton){
        optionSelected(.asc)
    }
    
    @IBAction func sortNameDescBtnPressed(_ sender: UIButton) {
        optionSelected(.desc)
    }
    
    @IBAction func setBtnPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func clearBtnPressed(_ sender: UIButton) {
        optionSelected(.regular)
        navigationController?.popViewController(animated: true)
    }
}
