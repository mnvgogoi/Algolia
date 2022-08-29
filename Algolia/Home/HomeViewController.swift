//
//  HomeViewController.swift
//  Algolia
//
//  Created by Vantage Circle on 23/08/22.
//

import UIKit

protocol FacetsDelegate{
    func getFacets()
}


class HomeViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchableAttributeBtn: UIButton!
    @IBOutlet weak var filterBtn: UIButton!
    
    
    // character model
    var resultModel = [ResultModel]()
    
    var facetsDelegate: FacetsDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set delegate
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
        // register cells
        tableView.register(UINib.init(nibName: "ItemTableCell", bundle: nil), forCellReuseIdentifier: "ItemTableCell")
        
        callDataModel("")
        
    }
    
    func callDataModel(_ item: String?){
        //*calling getData function.....(and defining the completion func)
        DataModel().getData(completion: { items, error in
            if (items != nil){
                self.resultModel = items!
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                if (items?.count == 0)
                {
                    print("No data")
                }
            }
            else if (error != nil){
                print(error ?? "Error value")
            }
        }, searchItem: item)
    }
    
    
    @IBAction func searchableAttributeBtnPressed(_ sender: UIButton) {
        present(FacetsViewController(), animated: true)
        self.facetsDelegate?.getFacets()
    }
    
    @IBAction func filterBtnPressed(_ sender: UIButton) {
        present(FilterScreenViewController(), animated: true)
    }
    
    
}


//MARK: - tableview delegate

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        print("Count -  \(resultModel.count)")
        return resultModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let itemCell = tableView.dequeueReusableCell(withIdentifier: "ItemTableCell", for: indexPath) as? ItemTableCell
        
        itemCell?.setData(character: resultModel[indexPath.item])
        return itemCell ?? UITableViewCell()
        
    }
}

//MARK: - searchbar delegate

extension HomeViewController: UISearchBarDelegate,UISearchDisplayDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //        print("====>>",searchText)
        callDataModel(searchText)
    }
}

