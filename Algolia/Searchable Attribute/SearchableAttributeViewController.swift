//
//  SearchableAttributeViewController.swift
//  Algolia
//
//  Created by Vantage Circle on 25/08/22.
//

import UIKit
import AlgoliaSearchClient

class SearchableAttributeViewController: UIViewController {
    
    @IBOutlet weak var backgroundCard: UIView!
    @IBOutlet weak var nameSwitch: UISwitch!
    @IBOutlet weak var speciesSwitch: UISwitch!
    @IBOutlet weak var genderSwitch: UISwitch!
    @IBOutlet weak var statusSwitch: UISwitch!
    @IBOutlet weak var doneBtn: UIButton!
    
    
    var algoliaData = AlgoliaData.algoliaData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundCard.layer.cornerRadius = 20
        
        for attribute in algoliaData.myAttributes{
            print("Attribute - \(attribute)")
            
            switch attribute {
            case "name":
                nameSwitch.setOn(true, animated: true)
            case "species":
                speciesSwitch.setOn(true, animated: true)
            case "gender":
                genderSwitch.setOn(true, animated: true)
            case "status":
                statusSwitch.setOn(true, animated: true)
            default:
                return
            }
                        
        }
    }
    
    func getSearchAttributes(element: String?){
        if element != nil{
            algoliaData.myAttributes.append(SearchableAttribute(rawValue: element!))
        }

        //* calling for searchable attribute results
        DataModel().searchableAttributesResults()
    }
    
    @IBAction func nameSwitchPressed(_ sender: UISwitch) {
        if (sender.isOn){
            print("name on")
            getSearchAttributes(element: "name")
            
        }
        else{
            print("name off")
            if let itemIndex = algoliaData.myAttributes.firstIndex(of: "name"){
                algoliaData.myAttributes.remove(at: itemIndex)
            }
            getSearchAttributes(element: nil)
        }
    }
    
    @IBAction func speciesSwitchPressed(_ sender: UISwitch) {
        if (sender.isOn){
            print("species on")
            getSearchAttributes(element: "species")
            
        }
        else{
            print("species off")
            if let itemIndex = algoliaData.myAttributes.firstIndex(of: "species"){
                algoliaData.myAttributes.remove(at: itemIndex)
            }
            getSearchAttributes(element: nil)
        }
    }
    @IBAction func statusSwitchPressed(_ sender: UISwitch) {
        if (sender.isOn){
            print("status on")
            getSearchAttributes(element: "status")
            
        }
        else{
            print("status off")
            if let itemIndex = algoliaData.myAttributes.firstIndex(of: "status"){
                algoliaData.myAttributes.remove(at: itemIndex)
            }
            getSearchAttributes(element: nil)
        }
    }
    
    @IBAction func genderSwitchPressed(_ sender: UISwitch) {
        if (sender.isOn){
            print("gender on")
            getSearchAttributes(element: "gender")
            
        }
        else{
            print("gender off")
            if let itemIndex = algoliaData.myAttributes.firstIndex(of: "gender"){
                algoliaData.myAttributes.remove(at: itemIndex)
            }
            getSearchAttributes(element: nil)
        }

    }
    
    @IBAction func doneBtnPressed(_ sender: UIButton) {
        print(algoliaData.myAttributes)
        self.dismiss(animated: true)
    }
    
    
    
    
}
