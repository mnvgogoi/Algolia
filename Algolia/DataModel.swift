//
//  DataModel.swift
//  Algolia
//
//  Created by Vantage Circle on 23/08/22.
//

import Foundation
import AlgoliaSearchClient

class DataModel{
    
    var algoliaData = AlgoliaData.algoliaData
    
    let index = AlgoliaData.index
    
    var genderFacets : [String] = []
    
    //MARK: - function to get the dataset
    
    //* defining the func (passing a func and string as a param)
    func getData(completion: @escaping ([ResultModel]?,Error?) -> Void, searchItem: String?){
        
        var query = Query(searchItem ?? "")
//            .set(\.filters, to: "gender:unknown")
            .set(\.facets, to: ["gender"])
        
        query.hitsPerPage = 10
        index.search(query: query) { result in
            if case .success(let response) = result {
                do{
//                    print(response.facets)
//                    print(response.facets?.keys)
//                    print(response.facets?.values)
//                    print(response.facets?["gender"]![0].value)
                    
                    if let response = response.facets{
                        
                        for position in 0..<(response.count) {
//                            print(position)
                            print(response.keys)
//                            self.algoliaData.myFacets.append(response[position].keys)
                        }
                        
                        for i in response {
//                            self.algoliaData.myFacets.append(i.key.rawValue)
//                            print(i.key)
                            
                            for position in 0..<(i.value.count) {
                                print(i.value[position].value)
                                self.genderFacets.append(i.value[position].value)
                            }
                        }
                    }
                    
//                    print(response.facets?.values)
                    let resultModel : [ResultModel] = try response.extractHits()
//                    print(resultModel)
                    
                    //* calling the func
                    completion(resultModel,nil)
                }
                catch let error{
                    completion(nil,error)
                    print("error ---- \(error)")
                }
                print("gender___facetes   ",self.genderFacets)
            }
        }
    }
    
    //MARK: - function for Searchable Attribute
    func searchableAttributesResults(){
        print("Calling....")

        let settings = Settings()
            .set(\.searchableAttributes, to: algoliaData.myAttributes)
        index.setSettings(settings) { result in
            print("MY RESULTS ========>> ",result)
            if case .failure(let error) = result {
                print("Error when applying settings: \(error)")
            }
        }
    }
    
    
    //MARK: - function for Faceting
//    func facetingResults(){
//        print("Calling....")
//
//        let settings = Settings()
//            .set(\.attributesForFaceting, to: [
//            ])
//        index.setSettings(settings) { result in
//            print("MY RESULTS ========>> ",result)
//            if case .success(let response) = result {
//                print("Response: \(response)")
//              }
//        }
//    }
    
    
    //MARK: - function for filtering
    func filterAttributesResults(searchItem: String?){

        var query = Query(searchItem ?? "")
            .set(\.filters, to: "gender:female")
//            .set(\.filters, to: "(gender:Male OR gender:unknown)")
        index.search(query: query) { result in
            print("MY RESULTS ========>> ",result)
            if case .failure(let error) = result {
                print("Error when applying settings: \(error)")
            }
        }

    }
    
    
}
