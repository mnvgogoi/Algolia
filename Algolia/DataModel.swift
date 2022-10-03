//
//  DataModel.swift
//  Algolia
//
//  Created by Vantage Circle on 23/08/22.
//

import Foundation
import AlgoliaSearchClient

class DataModel{
    
    var userPreference = UserPreference.userPreference
    
    var facetsValue : [String] = []
    var facetsKeys: [String] = []
    
    var algoliaIndex = AlgoliaData.algoliaData
    
    //**
    var finalQuery = FilterManager.filterManager.finalQuery
    
    
    //MARK: - function to get the dataset
    
    //* defining the func (passing a func and string as a param)
    func getData(completion: @escaping ([ResultModel]?,Error?,_ facets: [String?]) -> Void,
                 searchItem: String?, page: Int){
        
        var query = Query(searchItem ?? "")
            .set(\.filters, to: finalQuery )
            .set(\.facets, to: ["gender","status"])
            .set(\.page, to: page)
        
        
        query.hitsPerPage = 10
        algoliaIndex.usableIndex!.search(query: query) { result in
            if case .success(let responses) = result {
                do{
                    if let response = responses.facets{
                        UserFacets.userFacets.myFacets = response
                    }
                    let resultModel : [ResultModel] = try responses.extractHits()
                    
                    //* calling the func
                    completion(resultModel,nil,self.facetsValue)
                    
                    
                }
                catch let error{
                    completion(nil,error, [nil])
                    print("error ---- \(error)")
                }
            }
        }
    }
    
    //MARK: - function for Searchable Attribute
    func searchableAttributesResults(){
        let settings = Settings()
            .set(\.searchableAttributes, to: userPreference.myAttributes)
        algoliaIndex.usableIndex!.setSettings(settings) { result in
            print("MY RESULTS ========>> ",result)
            if case .failure(let error) = result {
                print("Error when applying settings: \(error)")
            }
        }
    }
    
}
