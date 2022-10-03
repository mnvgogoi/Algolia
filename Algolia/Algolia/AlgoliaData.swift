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
    
    private var client : SearchClient?
    private var index : Index?
    private var indexNameSortAsc : Index?
    private var indexNameSortDesc : Index?
    
    var usableIndex : Index?

    private init() {
        self.client = SearchClient(appID: ApplicationID(rawValue: ClientConfig.appId), apiKey: APIKey(rawValue: ClientConfig.apiKey))
        self.index = client!.index(withName: IndexName(rawValue: ClientConfig.mainIndex))
        self.indexNameSortAsc = client!.index(withName: IndexName(rawValue: ClientConfig.nameAscSortIndex))
        self.indexNameSortDesc = client!.index(withName: IndexName(rawValue: ClientConfig.nameDescSortIndex))
        self.usableIndex = index
    }
    
    var status : IndexTags = IndexTags.regular{
        didSet{
            switch status{
            case .asc:
                usableIndex = self.indexNameSortAsc
            case .desc:
                usableIndex = self.indexNameSortDesc
            case .regular:
                usableIndex = self.index
            }
        }
    }
    
}






