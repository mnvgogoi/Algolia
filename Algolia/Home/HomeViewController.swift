//
//  HomeViewController.swift
//  Algolia
//
//  Created by Vantage Circle on 23/08/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchableAttributeBtn: UIButton!
    @IBOutlet weak var filterBtn: UIButton!
    @IBOutlet weak var sortBtn: UIButton!
    @IBOutlet weak var prevPageBtn: UIButton!
    @IBOutlet weak var nextPageBtn: UIButton!
    @IBOutlet weak var pageNoLabel: UILabel!
    
    
    // character model
    var resultModel = [ResultModel]()
    
    var facetsValue: [String?] = []
    
    var pageNo: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set delegate
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
        pageNoLabel.text = "\(pageNo + 1)"
        
        // register cells
        tableView.register(UINib.init(nibName: "ItemTableCell", bundle: nil), forCellReuseIdentifier: "ItemTableCell")
        
        getDataFromAlgolia(searchData: "", page: pageNo)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("-------- viewdidapper =========")
        self.getDataFromAlgolia(searchData: "", page: pageNo)
    }
    
    func getDataFromAlgolia(searchData: String?, page:Int){
//        print("..........",page)
        DataModel().getData(completion: { items, error, facets in
            if (items != nil){
                self.resultModel = items!
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                if (items?.count == 0)
                {
                    print("No data")
                }
                self.facetsValue = facets
            }
            else if (error != nil){
                print(error ?? "Error value")
            }
        }, searchItem: searchData, page: page)
        
    }
    
    
    func checkSorting() {
        print("checksorting is called.......")
        getDataFromAlgolia(searchData: "", page: 0)
    }
    
    func setFacets() {
        print("set facets runnning")
        getDataFromAlgolia(searchData: "", page: 0)
    }
    
    
    @IBAction func searchableAttributeBtnPressed(_ sender: UIButton) {
        let allFacetsVC = AllFacetsViewController()
//        allFacetsVC.delegate = self
        navigationController?.pushViewController(allFacetsVC, animated: true)
    }
    
    @IBAction func filterBtnPressed(_ sender: UIButton) {
        let searchableVC = SearchableAttributeViewController()
        navigationController?.pushViewController(searchableVC, animated: true)
    }
    
    @IBAction func sortBtnPressed(_ sender: UIButton) {
        let sortingVC = SorrtingViewController()
        navigationController?.pushViewController(sortingVC, animated: true)
    }
    
    
    @IBAction func prevPageBtnPressed(_ sender: UIButton) {
        if(pageNo > 0){
            pageNo -= 1
            pageNoLabel.text = "\(pageNo + 1)"
            getDataFromAlgolia(searchData: "", page: pageNo)
        }
    }
    
    @IBAction func nextPageBtnPressed(_ sender: UIButton) {
    
        if(pageNo < 10){
            pageNo += 1
            pageNoLabel.text = "\(pageNo + 1)"
            getDataFromAlgolia(searchData: "", page: pageNo)
        }
        
    }
    
    
}


//MARK: - tableview delegate

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
        
        getDataFromAlgolia(searchData: searchText, page: 0)
    }
}

