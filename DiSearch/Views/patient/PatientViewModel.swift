//
//  PatientViewModel.swift
//  DiSearch
//
//  Created by Hugo Luna on 24/10/21.
//

import Foundation
import SwiftUI


class PatientViewModel: ObservableObject {
    
    
    @Published var imagenPerfil:Image? = Image("profile")
    @Published var isPhotoLibraryActive: Bool = false
    @Published var downloadURL: String = ""
    @Published var showProgressBar: Bool = false
    @Published var status: String = ""
    
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
