//
//  UserPreference.swift
//  Algolia
//
//  Created by Vantage Circle on 30/08/22.
//

import Foundation
import AlgoliaSearchClient

class UserPreference{
    static let userPreference = UserPreference()
    private init() {}
 
    //for searchable attributes
    var myAttributes: [SearchableAttribute] = []
        
    //default index
    var sortingType: IndexTags = IndexTags.regular
    
    
}
