//
//  FacetsViewController.swift
//  Algolia
//
//  Created by Vantage Circle on 26/08/22.
//

import UIKit

class FacetsViewController: UIViewController {

    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var genderTable: UITableView!
    @IBOutlet weak var ddoneBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        genderTable.delegate = self
        genderTable.dataSource = self
        
        genderTable.register(UINib.init(nibName: "GenderFacetTableViewCell", bundle: nil), forCellReuseIdentifier: "GenderFacetTableViewCell")
    }
    @IBAction func doneBtnPressed(_ sender: UIButton) {
    }
    
}

extension FacetsViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GenderFacetTableViewCell", for: indexPath) as? GenderFacetTableViewCell
        
//        cell?.setData(character: resultModel[indexPath.item])
        return cell ?? UITableViewCell()
    }
    
    
}
