//
//  FilterScreenViewController.swift
//  Algolia
//
//  Created by Vantage Circle on 26/08/22.
//

import UIKit

class FilterScreenViewController: UIViewController {
    
    @IBOutlet weak var backgroundCard: UIView!
    @IBOutlet weak var deadBtn: UIButton!
    @IBOutlet weak var aliveBtn: UIButton!
    @IBOutlet weak var unKnownStatusBtn: UIButton!
    @IBOutlet weak var maleBtn: UIButton!
    @IBOutlet weak var femaleBtn: UIButton!
    @IBOutlet weak var unknownGenderBtn: UIButton!
    @IBOutlet weak var doneBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundCard.layer.cornerRadius = 20
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
    
    @IBAction func deadBtnPressed(_ sender: UIButton) {
        tapped(sender)
    }
    
    @IBAction func aliveBtnPressed(_ sender: UIButton) {
        tapped(sender)
    }
    
    @IBAction func unknownStatusBtnPressed(_ sender: UIButton){
        tapped(sender)
    }
    
    @IBAction func maleBtnPressed(_ sender: UIButton){
        tapped(sender)
    }
    
    @IBAction func femaleBtnPressed(_ sender: UIButton){
        tapped(sender)
    }
    
    @IBAction func unknownGenderBtnPressed(_ sender: UIButton){
        tapped(sender)
    }
    
    @IBAction func doneBtnPressed(_ sender: UIButton) {
        DataModel().filterAttributesResults(searchItem: "")
        self.dismiss(animated: true)
    }
}
