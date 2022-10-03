//
//  UserFacets.swift
//  Algolia
//
//  Created by Vantage Circle on 02/09/22.
//

import Foundation
import AlgoliaSearchClient

class UserFacets{
    static let userFacets = UserFacets()
    private init(){}
    
    // storing the result facets
    var myFacets: [Attribute:[Facet]] = [:]
    
}
