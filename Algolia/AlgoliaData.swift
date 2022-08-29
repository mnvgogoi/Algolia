//
//  AlgoliaData.swift
//  Algolia
//
//  Created by Vantage Circle on 23/08/22.
//

import Foundation
import AlgoliaSearchClient


class AlgoliaData{
    
    static let algoliaData = AlgoliaData()

    private init() {}
    
    static let client = SearchClient(appID: "RX3U53SCVJ", apiKey: "1ebbc0be17b9609797dd6cf2ff396c2e")
    static let index = client.index(withName: "test_Rick")

    var myAttributes: [SearchableAttribute] = []
    
    var attributeForFaceting: [AttributeForFaceting] = []
    
    var myFacets: [String] = []
    
    
}




