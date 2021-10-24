//
//  LoginViewModel.swift
//  DiSearch
//
//  Created by Hugo Luna on 22/10/21.
//

import Foundation
import SwiftUI
import FirebaseAuth


class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    @Published var showPassword: Bool = false
    @Published var goToHome: Bool = false
    
    @Published var responseMessage: ResponseMessage?
    
    
    func checkLogin() {
        if Auth.auth().currentUser != nil {
            self.goToHome = true
        }
    }
    
    func handleLogin(requestCompletionHandler:@escaping (ResponseMessage?) -> ()) {
        
        Auth.auth().signIn(withEmail: email, password: password) { res, error in
            
            if error != nil {
                return requestCompletionHandler(ResponseMessage(status: "error", message: "Error al iniciar sesión"))
            }else{
                
                self.goToHome = true
                return requestCompletionHandler(ResponseMessage(status: "success", message: "Sesión iniciada correctamente"))

            }
            
            
        }
        
    }
    
}
