//
//  MainPrediction.swift
//  DiSearch
//
//  Created by Hugo Luna on 22/10/21.
//

import Foundation

struct MainPrediction: Codable, Hashable {
    
    var id: String?
    var project: String?
    var iteration: String?
    var created: String?
    var predictions: [ItemPrediction]?
    
}

struct ItemPrediction: Codable, Hashable {
    var probability: Double?
    var tagId: String?
    var tagName: String?
    
}

struct Data: Codable, Hashable {
    var Url: String
    
}
