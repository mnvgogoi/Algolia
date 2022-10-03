//
//  FilterManager.swift
//  Algolia
//
//  Created by Vantage Circle on 05/09/22.
//

import Foundation

class FilterManager{
    
    static let filterManager = FilterManager()
    private init(){}
    
    var finalQuery = ""
    var filterArray: [String] = []
    
    func ArrangeQuery(facet: String){
        var tempQuery = ""
        tempQuery.append(QuerySupporter.leftparen.rawValue +
                         FilterQuery(fac: facet)
                         + QuerySupporter.rightparen.rawValue)
        
//        print(tempQuery)
        if finalQuery.isEmpty{
            finalQuery = tempQuery
        }else{
            finalQuery.append(" " + QuerySupporter.AND.rawValue + " " + tempQuery + " ")
        }
        
        print(finalQuery)
    }
    
    func FilterQuery(fac: String) -> String {
        var query = ""
        var count = filterArray.count
        for i in filterArray {
            query.append(" "+fac+":"+i+" ")
            if (count - 1 > 0){
                query.append(QuerySupporter.OR.rawValue)
            }
            count-=1
        }
        return query
    }
    
    func clearQuery(){
        filterArray.removeAll()
        finalQuery = ""
    }
    
    
}

enum QuerySupporter: String{
    case OR,AND,NOT
    case leftparen = "("
    case rightparen = ")"
}

