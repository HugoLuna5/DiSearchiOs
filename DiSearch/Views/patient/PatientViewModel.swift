//
//  PatientViewModel.swift
//  DiSearch
//
//  Created by Hugo Luna on 24/10/21.
//

import Foundation


class PatientViewModel: ObservableObject {
    
    
    
    
    @Published var patient: Patient?
    
    @Published var name: String = ""
    @Published var last_name: String = ""
    @Published var phone: String = ""
    @Published var email: String = ""
    @Published var age: String = ""
    @Published var weight: String = ""
    @Published var height: String = ""
    @Published var sex: String = "Male"
    
    @Published var typeSex = ["Male", "Female", "Another"]
    
    
    func loadData(){
        
        self.name = (patient?.name)!
        self.last_name = (patient?.lastname)!
        self.phone = (patient?.phone)!
        self.email = (patient?.email)!
        self.age = (patient?.age)!
        self.weight = (patient?.weight)!
        self.height = (patient?.height)!
        self.sex = (patient?.sex)!
    }
    
    
}
