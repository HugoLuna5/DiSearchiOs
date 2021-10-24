//
//  ResponseMessage.swift
//  DiSearch
//
//  Created by Hugo Luna on 22/10/21.
//

import Foundation


struct ResponseMessage: Codable, Hashable {
    
    var status: String
    var message: String
    
}
