//
//  LoginView.swift
//  DiSearch
//
//  Created by Hugo Luna on 22/10/21.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        NavigationView {
            
            VStack{
                
                Image("login")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                VStack {
                    
                    Fields()
                    
                }.padding(.horizontal, 40)
                
            }
            
        }
        
    }
}

struct Fields: View {
    
    @ObservedObject var loginViewModel = LoginViewModel()
    
   
    @State var goToHome: Bool = false
    @State var messagePasword: String = "Mostrar contraseña"
    
    @State var showErrors = false
    @State var customMessage: String = ""
    
    @ScaledMetric var sizePadding: CGFloat = 85.0
    
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            
            Text("Correo electrónico")
                .font(.footnote)
                .foregroundColor(.gray)
            
            ZStack(alignment: .leading) {
                
                if loginViewModel.email.isEmpty  {
                    Text("ejemplo@gmail.com")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .accentColor(.gray)
                        .autocapitalization(.none)
                        .textCase(.lowercase)
                }
                
                TextField("", text: $loginViewModel.email)
                    .foregroundColor(.gray)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .accentColor(.gray)
                    .textCase(.lowercase)
                
                
                
            }
            Divider()
                .frame(height: 1)
                .background(Color(.gray))
                .padding(.bottom)
            
            //Password
            Text("Contraseña")
                .font(.footnote)
                .foregroundColor(.gray)
                .padding(.top, 10)
            
            ZStack(alignment: .leading) {
                
                if loginViewModel.password.isEmpty && !loginViewModel.showPassword  {
                    Text("Escribe tu contraseña")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                }
                
                VStack {
                    
                    
                    if loginViewModel.showPassword {
                        TextField("", text: $loginViewModel.password)
                            .foregroundColor(.gray)
                            .autocapitalization(.none)
                            .textCase(.lowercase)
          
                    }else{
                        SecureField("", text: $loginViewModel.password)
                            .foregroundColor(.gray)
                    }
                }
                
                
                
                
                
                
            }.contextMenu(ContextMenu(menuItems: {
                if !loginViewModel.showPassword {
                    
                    Button {
                        loginViewModel.showPassword.toggle()
                    } label: {
                        Label("Mostrar contraseña", systemImage: "eye")
                    }
                }else{
                    Button {
                        loginViewModel.showPassword.toggle()
                    } label: {
                        Label("Ocultar contraseña", systemImage: "eye.slash")
                    }
                }
            }))
            
            Divider()
                .frame(height: 1)
                .background(Color(.gray))
                .padding(.bottom)
            
            
            Button(action: {
                
                loginViewModel.handleLogin { res in
                    
                    if res?.status == "success" {
                        loginViewModel.goToHome = true
                    }
                    
                    
                }
            }, label: {
                
                
                ZStack {
                    
                    
                    RoundedRectangle(cornerRadius: 26.0)
                        .frame(height: 50)
                        .foregroundColor(Color("accent"))
                    
                    Text("ENTRAR")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(alignment: .leading)
                        .font(.title2)
                        
                        
                    
                }
 
            }).padding(.bottom, 15)
            
            
            
            VStack(alignment: .center) {
                
                HStack{
                    Spacer()
                    Text("¿No tienes cuenta?")
                        .font(.headline)
                        .foregroundColor(.gray)
                    
                    Button(action: {
                    }, label: {
                        Text("Crear cuenta")
                            .font(.headline)
                            .foregroundColor(Color("accent"))
                    })
                    Spacer()
                    
                    
                }
                
                Button(action: {
                    
                }, label: {
                    Text("Olvide mi contraseña")
                        .font(.headline)
                        .foregroundColor(.gray)
                }).frame(alignment: .center)
                    .padding(.top, 10)
                
                NavigationLink(
                    destination: HomeView(),
                    isActive: $loginViewModel.goToHome,
                    label: {
                        EmptyView()
                    })
                
                
            }
            
            
            
            
            Spacer()
            
            
           
            
            
            
        }
        .onAppear {
            loginViewModel.checkLogin()
        }
    }
    
    
}



struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
