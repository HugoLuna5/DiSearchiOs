//
//  Patient.swift
//  DiSearch
//
//  Created by Hugo Luna on 22/10/21.
//

import Foundation

struct Patient: Codable, Hashable, Identifiable {
    
    
    var id: String
    var uuid: String?
    var name: String?
    var lastname: String?
    var email: String?
    var phone: String?
    var age: String?
    var weight: String?
    var height: String?
    var sex: String?
    
    init (dictionary: [String: Any]) {
        self.id = dictionary["uuid"] as? String ?? ""
        self.uuid = dictionary["uuid"] as? String ?? ""
        self.name = dictionary["name"] as? String ?? ""
        self.lastname = dictionary["lastname"] as? String ?? ""
        self.phone = dictionary["phone"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.age = dictionary["age"] as? String ?? ""
        self.weight = dictionary["weight"] as? String ?? ""
        self.height = dictionary["height"] as? String ?? ""
        self.sex = dictionary["sex"] as? String ?? ""
    }
    
}
