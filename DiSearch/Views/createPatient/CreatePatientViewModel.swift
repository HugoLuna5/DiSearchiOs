//
//  CreatePatientViewModel.swift
//  DiSearch
//
//  Created by Hugo Luna on 24/10/21.
//

import Foundation
import FirebaseFirestore

class CreatePatientViewModel: ObservableObject {
    
    
    @Published var showDialog: Bool = false
    @Published var showPassword: Bool = false
    @Published var showConfirmPassword: Bool = false
    @Published private var isShowingDetails = false
    @Published var titleAlert: String = ""
    @Published var messageAlert: String = ""
    let db = Firestore.firestore()
    
    @Published var name: String = ""
    @Published var last_name: String = ""
    @Published var phone: String = ""
    @Published var email: String = ""
    @Published var age: String = ""
    @Published var weight: String = ""
    @Published var height: String = ""
    @Published var sex: String = "Male"
    
    @Published var typeSex = ["Male", "Female", "Another"]
    
    
    func createPatient(requestCompletionHandler:@escaping (ResponseMessage?) -> ()) {
        
    
        if  name.isEmpty{
            return requestCompletionHandler(ResponseMessage(status: "error", message: "You must enter the name"))
        }
            
        if  last_name.isEmpty{
            return requestCompletionHandler(ResponseMessage(status: "error", message: "You must enter the last name"))
        }
        
        if  phone.isEmpty{
            return requestCompletionHandler(ResponseMessage(status: "error", message: "You must enter a phone number"))
        }
    
        if  email.isEmpty{
            return requestCompletionHandler(ResponseMessage(status: "error", message: "You must enter a email"))
        }
        
        if  age.isEmpty{
            return requestCompletionHandler(ResponseMessage(status: "error", message: "You must enter an age"))
        }
        
        if  weight.isEmpty{
            return requestCompletionHandler(ResponseMessage(status: "error", message: "You must enter a weight"))
        }
        if  height.isEmpty{
            return requestCompletionHandler(ResponseMessage(status: "error", message: "You must enter a height"))
        }
        if  sex.isEmpty{
            return requestCompletionHandler(ResponseMessage(status: "error", message: "You must enter a gender"))
        }
        
        let uuid = db.collection("patients").document().documentID
        db.collection("patients").document(uuid).setData([
            "uuid": uuid,
            "name": name,
            "last_name": last_name,
            "phone": phone,
            "email": email,
            "age": age,
            "weight": weight,
            "height": height,
            "sex": sex
        ]){ err in
            if let err = err {
                return requestCompletionHandler(ResponseMessage(status: "error", message: "Error writing document: \(err)"))
            } else {
                return requestCompletionHandler(ResponseMessage(status: "success", message: "Patient successfully added!"))
            }
        }
            
         
        
        
    }
 
    
    
}
