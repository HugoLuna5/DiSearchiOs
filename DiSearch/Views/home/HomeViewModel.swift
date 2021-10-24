//
//  HomeViewModel.swift
//  DiSearch
//
//  Created by Hugo Luna on 22/10/21.
//

import Foundation

import FirebaseFirestore
import FirebaseAuth

class HomeViewModel: ObservableObject {
    
    @Published var goToLogin: Bool = false
    @Published var patients = [Patient]()
//    var selectedPatient: Patient?
    
    
    func getListUsers(requestCompletionHandler:@escaping ([Patient]?) -> ()) {
        
        
        Firestore.firestore().collection("patients").getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else {return}
            
            documents.forEach { document in
                
                let patient = Patient(dictionary: document.data())
                self.patients.append(patient)
               
            }
            
            return requestCompletionHandler(self.patients)
        }

        
    }
    
    
    func logOut(){
        do {
          try  Auth.auth().signOut()
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
          
       
    }
    
    
}
