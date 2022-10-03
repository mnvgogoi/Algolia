//
//  AllFacetsViewController.swift
//  Algolia
//
//  Created by Vantage Circle on 02/09/22.
//

import UIKit
import AlgoliaSearchClient

class AllFacetsViewController: UIViewController {
    
    @IBOutlet weak var facetsKeyTable: UITableView!
    @IBOutlet weak var facetsValueTable: UITableView!
    
    @IBOutlet weak var setBtn: UIButton!
    @IBOutlet weak var clearBtn: UIButton!
    
    var facetsValue: [String?] = []
    var facetsKeys: [String?] = []
    
    var selectedFacet: String = ""
    
    var userFacets = UserFacets.userFacets.myFacets
    
    var userPreference = UserPreference.userPreference
    
    override func viewDidLoad() {
        super.viewDidLoad()
        facetsKeyTable.delegate = self
        facetsKeyTable.dataSource = self
        
        facetsValueTable.delegate = self
        facetsValueTable.dataSource = self
        
        
        facetsKeyTable.register(UINib.init(nibName: "FacetsKeyTableCell", bundle: nil), forCellReuseIdentifier: "FacetsKeyTableCell")
        
        facetsValueTable.register(UINib.init(nibName: "FacetsValueTableCell", bundle: nil), forCellReuseIdentifier: "FacetsValueTableCell")
        
        //adding keys in facetsKeys array.
        for i in userFacets {
            facetsKeys.append(i.key.rawValue)
        }
        
    }
    
    @IBAction func setBtnPressed(_ sender: UIButton) {
        FilterManager.filterManager.ArrangeQuery(facet: selectedFacet)
        print("query ---- ",FilterManager.filterManager.finalQuery)
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clearBtnPressed(_ sender: UIButton) {
        FilterManager.filterManager.clearQuery()
        navigationController?.popViewController(animated: true)
    }
    
}

extension AllFacetsViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rows = 1
        if tableView == self.facetsKeyTable {
            rows = facetsKeys.count
        } else if tableView == self.facetsValueTable {
            rows = facetsValue.count
        }
        return rows
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(60)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cellToReturn = UITableViewCell()
        if tableView == self.facetsKeyTable {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FacetsKeyTableCell", for: indexPath) as? FacetsKeyTableCell
            cell?.setData(data: facetsKeys, index: indexPath.row)
            
            cellToReturn = cell ?? UITableViewCell()
            
        } else if tableView == self.facetsValueTable {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FacetsValueTableCell", for: indexPath) as? FacetsValueTableCell
            cell?.setData(data: facetsValue,index: indexPath.row)

            cellToReturn = cell ?? UITableViewCell()
        }
        return cellToReturn
    }
    
    func selectedFacet(facet: String){
        guard let userFacetsValues = userFacets[Attribute(rawValue: facet)]
        else{
            return print("empty facets value")
        }
        for userFilterValues in userFacetsValues {
//            print(".... ",userFilterValues)
            facetsValue.append(userFilterValues.value)
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //remove previous data
        facetsValue.removeAll()
        
        if tableView == facetsKeyTable {
            selectedFacet(facet: facetsKeys[indexPath.row]!)
            selectedFacet = facetsKeys[indexPath.row]!
            facetsValueTable.reloadData()
        }
    }
}
